import { useState, useEffect, useCallback } from "react";
import { YearSelector } from "./components/YearSelector";
import { YearMonthsView } from "./components/YearMonthsView";
import { MonthExpenses } from "./components/MonthExpenses";
import { ReportsView } from "./components/ReportsView";
import { FuelRequestApp } from "./components/FuelRequestApp";
import { ExpirationAlerts } from "./components/ExpirationAlerts";
import { ExpirationBadge } from "./components/ExpirationBadge";
import { DashboardWidgets } from "./components/DashboardWidgets";
import { DarkModeToggle, ThemeProvider } from "./components/DarkModeToggle";
import { LoadingScreen } from "./components/LoadingScreen";
import { StatusIndicators } from "./components/StatusIndicators";
import { QuickActions } from "./components/QuickActions";
import { DatabaseOperationsModal, DatabaseOperation } from "./components/DatabaseOperationsModal";
import { Expense } from "./types/expense";
import { usePWA } from "./hooks/usePWA";
import { useDatabase } from "./hooks/useDatabase";
import { useAppState } from "./hooks/useAppState";
import { CURRENT_YEAR, getMonthName, getMonthStats, getYearStats, setupPeriodicNotifications } from "./utils/appUtils";

export default function App() {
  const [allExpenses, setAllExpenses] = useState<Expense[]>([]);
  const [showDatabaseModal, setShowDatabaseModal] = useState(false);
  const [pendingOperation, setPendingOperation] = useState<DatabaseOperation | null>(null);
  const [isOperationInProgress, setIsOperationInProgress] = useState(false);
  
  // Custom hooks
  const pwa = usePWA();
  const database = useDatabase();
  const appState = useAppState();

  // Initialize app
  useEffect(() => {
    let mounted = true;

    const initializeApp = async () => {
      try {
        if (!mounted) return;
        
        console.log('Initializing app...');
        appState.setSelectedYear(CURRENT_YEAR);
        
        const expenses = await database.loadAllExpenses();
        if (!mounted) return;
        
        console.log('Loaded expenses:', expenses.length);
        setAllExpenses(expenses);
        
        const currentYearExpenses = expenses.filter(e => e.month.startsWith(`${CURRENT_YEAR}-`));
        if (currentYearExpenses.length === 0) {
          console.log('Generating expenses for current year:', CURRENT_YEAR);
          const updatedExpenses = await database.generateExpensesForYear(CURRENT_YEAR);
          if (!mounted) return;
          
          console.log('Generated expenses:', updatedExpenses.length);
          setAllExpenses(updatedExpenses);
        }
        
        if (pwa.isPWACompatible) {
          setupPeriodicNotifications(expenses, pwa.notificationsEnabled, pwa.isPWACompatible, pwa.sendNotification);
        }
        
      } catch (error) {
        console.error('Error initializing app:', error);
      } finally {
        if (mounted) {
          appState.setLoading(false);
        }
      }
    };

    initializeApp();
    return () => { mounted = false; };
  }, []);

  // Cleanup on unmount
  useEffect(() => {
    return () => {
      try {
        database.dbManager.disconnect();
      } catch (error) {
        console.warn('Error disconnecting database:', error);
      }
    };
  }, [database.dbManager]);

  // Enhanced handlers
  const handleYearChangeWithData = useCallback(async (year: number) => {
    if (database.isLoading) return;
    
    try {
      const yearExpenses = allExpenses.filter(e => e.month.startsWith(`${year}-`));
      if (yearExpenses.length === 0) {
        appState.setLoading(true);
        const updatedExpenses = await database.generateExpensesForYear(year);
        setAllExpenses(updatedExpenses);
        appState.setLoading(false);
      }
      appState.handleYearChange(year);
    } catch (error) {
      console.error('Error changing year:', error);
    }
  }, [allExpenses, database, appState]);

  const handleExpensesUpdateWithState = useCallback(async (updatedExpenses: Expense[]) => {
    try {
      const freshExpenses = await database.handleExpensesUpdate(updatedExpenses);
      if (freshExpenses) {
        setAllExpenses(freshExpenses);
      }
    } catch (error) {
      console.error('Error updating expenses:', error);
    }
  }, [database]);

  // Handler pentru backup import - înlocuiește toate datele
  const handleBackupImport = useCallback(async (importedExpenses: Expense[]) => {
    try {
      appState.setLoading(true);
      
      // Șterge toate datele existente
      await database.dbManager.clearAllData();
      
      // Inserează datele importate
      const insertPromises = importedExpenses.map(expense => 
        database.dbManager.upsertExpense(expense)
      );
      await Promise.all(insertPromises);
      
      // Reîncarcă datele
      const updatedExpenses = await database.loadAllExpenses();
      setAllExpenses(updatedExpenses);
      
      console.log('Backup import completed:', {
        imported: importedExpenses.length,
        loaded: updatedExpenses.length
      });
      
      // Afișează notificare de succes
      if (pwa.notificationsEnabled && pwa.isPWACompatible) {
        pwa.sendNotification(
          'Backup importat cu succes!', 
          `${updatedExpenses.length} cheltuieli au fost încărcate din backup.`, 
          '/'
        );
      }
      
    } catch (error) {
      console.error('Error importing backup:', error);
      alert('A apărut o eroare la importul backup-ului. Verifică consola pentru detalii.');
    } finally {
      appState.setLoading(false);
    }
  }, [database, appState, pwa]);

  const handleServiceDeleteWithState = useCallback(async (expenseId: string) => {
    try {
      const updatedExpenses = await database.handleServiceDelete(expenseId, allExpenses);
      if (updatedExpenses) {
        setAllExpenses(updatedExpenses);
      }
    } catch (error) {
      console.error('Error deleting service:', error);
    }
  }, [allExpenses, database]);

  // Database operations handlers cu modale
  const handleDatabaseOperationRequest = useCallback((operation: DatabaseOperation) => {
    if (database.isLoading || isOperationInProgress) return;
    
    setPendingOperation(operation);
    setShowDatabaseModal(true);
  }, [database.isLoading, isOperationInProgress]);

  const handleDatabaseOperationConfirm = useCallback(async () => {
    if (!pendingOperation) return;
    
    try {
      setIsOperationInProgress(true);
      
      let updatedExpenses: Expense[] = [];
      let successMessage = '';
      let notificationTitle = '';
      let notificationBody = '';

      switch (pendingOperation) {
        case 'addMissing':
          updatedExpenses = await database.handleAddMissingServices();
          successMessage = 'Serviciile lipsă au fost adăugate cu succes! Verifică categoriile pentru a vedea toate serviciile.';
          notificationTitle = 'Servicii adăugate!';
          notificationBody = 'Toate serviciile lipsă au fost adăugate cu succes.';
          break;
          
        case 'refresh':
          updatedExpenses = await database.handleDatabaseRefresh();
          successMessage = 'Baza de date a fost curățată cu succes!';
          notificationTitle = 'Baza de date actualizată!';
          notificationBody = 'Toate datele au fost reorganizate cu succes.';
          break;
          
        case 'regenerate':
          updatedExpenses = await database.handleRegenerateAllData(CURRENT_YEAR);
          successMessage = 'Datele au fost regenerate cu succes! Toate serviciile sunt acum disponibile.';
          notificationTitle = 'Date regenerate!';
          notificationBody = 'Toate serviciile au fost recreate cu configurația actualizată.';
          break;
      }

      setAllExpenses(updatedExpenses);

      // Afișează notificare de succes
      if (pwa.notificationsEnabled && pwa.isPWACompatible) {
        pwa.sendNotification(notificationTitle, notificationBody, '/');
      } else {
        alert(successMessage);
      }

      // Închide modal-ul după 2 secunde
      setTimeout(() => {
        setShowDatabaseModal(false);
        setPendingOperation(null);
      }, 2000);

    } catch (error) {
      console.error(`Error ${pendingOperation}:`, error);
      alert(`A apărut o eroare la ${pendingOperation === 'addMissing' ? 'adăugarea serviciilor' : pendingOperation === 'refresh' ? 'curățarea bazei de date' : 'regenerarea datelor'}.`);
    } finally {
      setIsOperationInProgress(false);
    }
  }, [pendingOperation, database, pwa, CURRENT_YEAR]);

  const handleDatabaseOperationCancel = useCallback(() => {
    if (isOperationInProgress) return;
    
    setShowDatabaseModal(false);
    setPendingOperation(null);
  }, [isOperationInProgress]);

  // Show loading screen during initialization
  if (appState.loading) {
    return (
      <ThemeProvider>
        <LoadingScreen isPWACompatible={pwa.isPWACompatible} />
      </ThemeProvider>
    );
  }

  // Fuel Requests view - NOUA APLICAȚIE
  if (appState.currentView === 'fuel-requests') {
    return (
      <ThemeProvider>
        <FuelRequestApp onBack={appState.handleBackToHome} />
      </ThemeProvider>
    );
  }

  // Reports view
  if (appState.currentView === 'reports') {
    return (
      <ThemeProvider>
        <ReportsView
          expenses={allExpenses}
          reportsContext={appState.reportsContext}
          onBack={appState.handleBackToHome}
        />
      </ThemeProvider>
    );
  }

  // Dashboard view
  if (appState.currentView === 'dashboard') {
    return (
      <ThemeProvider>
        <div className="min-h-screen bg-gradient-to-br from-blue-50 via-white to-purple-50 p-4">
          <div className="max-w-7xl mx-auto">
            <header className="mb-8">
              <div className="flex items-center justify-between mb-4">
                <button 
                  onClick={appState.handleBackToHome}
                  disabled={database.isLoading}
                  className="bg-gradient-to-r from-gray-500 to-gray-600 hover:from-gray-600 hover:to-gray-700 text-white px-4 py-2 rounded-lg shadow-lg transform transition-all duration-200 hover:scale-105 hover:shadow-xl border-b-4 border-gray-700 active:border-b-2 active:translate-y-1 flex items-center space-x-2 disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none"
                >
                  <span>← Înapoi la calendar</span>
                </button>
                <DarkModeToggle />
              </div>
            </header>

            <DashboardWidgets 
              expenses={allExpenses} 
              year={appState.selectedYear} 
              month={appState.selectedMonth} 
            />
          </div>
        </div>
      </ThemeProvider>
    );
  }

  // Month view
  if (appState.currentView === 'month' && appState.selectedMonth) {
    return (
      <ThemeProvider>
        <div>
          <div className="max-w-7xl mx-auto p-4">
            <ExpirationAlerts expenses={allExpenses} />
          </div>
          
          <MonthExpenses
            month={appState.selectedMonth}
            monthName={getMonthName(appState.selectedMonth)}
            expenses={allExpenses}
            onExpensesUpdate={handleExpensesUpdateWithState}
            onServiceDelete={handleServiceDeleteWithState}
            onShowReports={appState.handleShowReportsFromMonth}
            onBack={appState.handleBackToYear}
          />
        </div>
      </ThemeProvider>
    );
  }

  // Year view
  if (appState.currentView === 'year') {
    return (
      <ThemeProvider>
        <div className="min-h-screen bg-gradient-to-br from-blue-50 via-white to-purple-50 p-4">
          <div className="max-w-7xl mx-auto">
            <header className="mb-8">
              <div className="flex items-center justify-between mb-4">
                <button 
                  onClick={appState.handleBackToHome}
                  disabled={database.isLoading}
                  className="bg-gradient-to-r from-gray-500 to-gray-600 hover:from-gray-600 hover:to-gray-700 text-white px-4 py-2 rounded-lg shadow-lg transform transition-all duration-200 hover:scale-105 hover:shadow-xl border-b-4 border-gray-700 active:border-b-2 active:translate-y-1 flex items-center space-x-2 disabled:opacity-50 disabled:cursor-not-allowed disabled:transform-none"
                >
                  <span>← Înapoi la calendar</span>
                </button>
                
                <StatusIndicators 
                  pwa={pwa}
                  database={database}
                  onRefresh={() => handleDatabaseOperationRequest('refresh')}
                  onShowReports={appState.handleShowReportsFromYear}
                  selectedYear={appState.selectedYear}
                  expenses={allExpenses}
                />
              </div>
              <h1 className="text-4xl font-bold mb-2 bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent drop-shadow-lg">
                Evidența Cheltuielilor
              </h1>
              <p className="text-gray-600 text-lg">
                Selectează o lună din {appState.selectedYear} pentru a gestiona cheltuielile
              </p>
            </header>

            <ExpirationAlerts expenses={allExpenses} />

            <YearMonthsView
              year={appState.selectedYear}
              onMonthClick={appState.handleMonthClick}
              getMonthStats={(month: string) => getMonthStats(month, allExpenses)}
            />
          </div>
        </div>
      </ThemeProvider>
    );
  }

  // Home view
  return (
    <ThemeProvider>
      <div className="min-h-screen bg-gradient-to-br from-blue-50 via-white to-purple-50 p-4">
        <div className="max-w-7xl mx-auto">
          <header className="mb-8 text-center">
            <div className="flex items-center justify-center space-x-4 mb-4">
              <h1 className="text-4xl font-bold bg-gradient-to-r from-blue-600 to-purple-600 bg-clip-text text-transparent drop-shadow-lg">
                Evidența Cheltuielilor
              </h1>
              <ExpirationBadge expenses={allExpenses} />
              <DarkModeToggle />
            </div>
            <p className="text-gray-600 text-lg">
              Selectează anul pentru a vedea lunile și gestiona cheltuielile
            </p>
            
            {!pwa.isPWACompatible && (
              <div className="mt-4 mb-4 bg-amber-50 border border-amber-200 rounded-lg p-3">
                <div className="flex items-center justify-center space-x-2 text-amber-800">
                  <span className="text-sm">
                    Mod Preview - Aplicația funcționează cu funcționalități de bază. 
                    Pentru experiența completă PWA, accesează aplicația într-un browser complet.
                  </span>
                </div>
              </div>
            )}
            
            <StatusIndicators 
              pwa={pwa}
              database={database}
              onRefresh={() => handleDatabaseOperationRequest('refresh')}
              onShowReports={appState.handleShowReportsFromHome}
              selectedYear={appState.selectedYear}
              expenses={allExpenses}
              isHomeView={true}
            />
          </header>

          <ExpirationAlerts expenses={allExpenses} />

          <QuickActions 
            onShowReports={appState.handleShowReportsFromHome}
            onShowDashboard={appState.setDashboardView}
            onShowFuelRequests={appState.setFuelRequestsView}
            onAddMissingServices={() => handleDatabaseOperationRequest('addMissing')}
            onRefreshDatabase={() => handleDatabaseOperationRequest('refresh')}
            onRegenerateData={() => handleDatabaseOperationRequest('regenerate')}
            isLoading={database.isLoading || isOperationInProgress}
            expenses={allExpenses}
            onExpensesUpdate={handleBackupImport}
          />

          <YearSelector
            currentYear={appState.selectedYear}
            onYearChange={handleYearChangeWithData}
            yearStats={getYearStats(allExpenses)}
          />

          <div className="text-center mt-8">
            <div className="flex items-center justify-center space-x-8 text-sm text-gray-600">
              <div className="flex items-center space-x-2">
                <div className="w-4 h-4 bg-green-400 rounded border-2 border-green-500 shadow-lg"></div>
                <span>Lună completă</span>
              </div>
              <div className="flex items-center space-x-2">
                <div className="w-4 h-4 bg-red-400 rounded border-2 border-red-500 shadow-lg"></div>
                <span>Lună incompletă</span>
              </div>
              <div className="flex items-center space-x-2">
                <div className="w-4 h-4 bg-gray-300 rounded border-2 border-gray-400 shadow-lg"></div>
                <span>Fără date</span>
              </div>
            </div>
          </div>

          {pwa.isPWACompatible && pwa.isInstalled && (
            <div className="mt-8 text-center">
              <div className="bg-green-100 text-green-800 border-green-300 px-4 py-2 rounded inline-flex items-center">
                <span>📱 Aplicația este instalată și funcționează ca o aplicație nativă!</span>
              </div>
            </div>
          )}
        </div>

        {/* Database Operations Modal */}
        <DatabaseOperationsModal
          isOpen={showDatabaseModal}
          onClose={handleDatabaseOperationCancel}
          operation={pendingOperation}
          isLoading={isOperationInProgress}
          onConfirm={handleDatabaseOperationConfirm}
        />
      </div>
    </ThemeProvider>
  );
}