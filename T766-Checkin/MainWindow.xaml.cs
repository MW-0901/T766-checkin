using System.Diagnostics;
using System.Windows;
using T766_Checkin.Views;

namespace T766_Checkin
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainContent.Content = new WifiConnectView();
        }

        public void NavigateToNextPage()
        {
            MainContent.Content = new CheckinView();
        }
        private void Window_Deactivated(object sender, EventArgs e)
        {
            this.Activate();
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            e.Cancel = true;
        }
    }
}
