import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  static const credentials = r'''
  {
   
  "type": "service_account",
  "project_id": "centering-rider-394814",
  "private_key_id": "13bc07a0906bbcbb5442fb45431de37f54cdc58e",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDGOfJ49awh9Nxp\ng1G1e+7nUw4kMF4XcZOlm10mAaqWxS/YGQzOHyCxQELQkKTsOCJ7bNxh+HPg4LMp\ncOlTmzzmylE5j2Zj9gMbECHIC+MqXC2iwvIpfQ9j+Gs9/oMGtTyedLLwBt8ZFDIz\ns7S9WJPrsO/0nm6Qs8d2lrMagYmin96vb/Zk06TVEVH0vHsFh5I/Y+5+KTdKnDjT\npsNzM37It3rXLXtmDl/BQkNh0zC1bzK0RRxpsF1nRYaheIn6XpB239saUJFL3Rof\nI7wXTHK36mOoVxHS0D28dVQZvnxDSItU0FgcuN5tpG6y7HJUbOnOwrePHs/kaFrZ\nyJQ7IvJdAgMBAAECggEAAofW2p3NoW6uKa1YK7L2An9YR4n+iYS/rSDl+DLpP0eB\nLDHAV26k94j/JrPSBy9S8V8bE9JyLZrGGW9W6zmoy2F7K/ryrwVYViNx6vXhOTc4\nC0M7MuBlLpI1/Ef1hZkRZGHPrv9yIFsrpjv9wLUSyQgskrjlvHSEcAp4euF7JQJT\nsarBthCki+oy0rB4ciKhDlM1VpqWcmMKIgFipmxkAYCD9HiwADhkjlmrax0CG1mB\n91EPgEXwlGhtWMkq33I5ee2WOFqnuqEfLIIaCpnrP0gs/P1374I1/RXBVK0uPWbi\nVnRfZUyJGycJzXVUXDnya9VdbtRV2qnaKFV94taZAQKBgQD8GdtHYGyeE9jbZYzs\nMQm2gOw2IVDkQpy26eWybpCGipit01+adMXobpv7w2Ece5Xu4oJQ//DXYtroMxdW\nHmJYUiKtnFGX5KQPBty7zjdDb0r5Xn5XGyCZv/SEvO+DyK8GF7f7PRdNhj0/bSzB\n7abJRVBvB9xI7BFXKiFw+SckYQKBgQDJSsjjzTfsRSycOotpUMwHGsqkBY//GX5u\nNwHv08UbkJMIryiBz+nIsGnEa+5XBfNhWUzYd8pHFXJx/93w+ADVKiAQi2UlEhrp\n9WnrD14NqrYtwaZEG5ftotQcvpB5oGaap8P1jdrC+berjQA0G2jph0ScgqOeU5xS\nXfZrkjSPfQKBgQCcALgj/DRawfdhFP9WraXQDQmfGZDAH8RwoF7mwuqmhx+h+Xpg\nz0Ak7EWUTzxJ7uRCNmLkEu2Lq33BUNRxE05ST0lsW55WO0OWlO2FPkAOd9FSbToL\nVxseaZ27gltJFqfQQl80loJUE+zU0g9vVkvuovj6LEgRzBuS79xP1650IQKBgDj4\nzrUTH3Hi/kZVl6G+OZEFNzeHT4M/PvaI4SZ1BMPRfpwln0xmgV/I9paeib3dtE3o\nTYSzGvBVlKfJaJLMTsgGfT7RhVYhsrZnPIxINDGgEKIQvjNmr/CVdn2QPin+iSva\nse7tMG6g6ShH5zfYTjBSlcvKee7U8ViquZUms3OtAoGBALfr/Ndq1LYEWm69qxoa\ncmNLJrRx9EeEnJzRhu40iZscj6IuLSq3Pg8vQUsJONHF572vIdzt4u42+1p1pX7u\nTq2VY3OOiZ/v1LUnZCd2InnYpUUpywZl+3DuqFFqiS90ae/iFePXIGz49i82YVKy\nmkg2uj2mwqF4ljBT9+TWfXE2\n-----END PRIVATE KEY-----\n",
  "client_email": "googlesheets@centering-rider-394814.iam.gserviceaccount.com",
  "client_id": "115101825882302127809",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/googlesheets%40centering-rider-394814.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
  
  }
  ''';

  static const spreadsheetId = '1cbkjPLmou0HHlLODgwdnpx3tRIDPur6h7Rcr3wyDYfA';
  static final gsheets = GSheets(credentials);
  static Worksheet? worksheet;

  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

  Future init() async {
    final ss = await gsheets.spreadsheet(spreadsheetId);
    worksheet = ss.worksheetByTitle('Worksheet1');
    countRows();
  }

  static Future countRows() async {
    while ((await worksheet!.values
            .value(column: 1, row: numberOfTransactions + 1)) !=
        '') {
      numberOfTransactions++;
    }
    loadTransactions();
  }

  static Future loadTransactions() async {
    if (worksheet == null) return;

    for (int i = 1; i < numberOfTransactions; i++) {
      final String transactionName =
          await worksheet!.values.value(column: 1, row: i + 1);
      final String transactionAmount =
          await worksheet!.values.value(column: 2, row: i + 1);
      final String transactionType =
          await worksheet!.values.value(column: 3, row: i + 1);

      if (currentTransactions.length < numberOfTransactions) {
        currentTransactions.add([
          transactionName,
          transactionAmount,
          transactionType,
        ]
        );
        
      }
    }
    print(currentTransactions);
    loading = false;
  }

  static Future insert(String title, String amount, bool isIncome) async {
    if (worksheet == null) return;
    numberOfTransactions++;
    currentTransactions.add([
      title,
      amount,
      isIncome == true ? 'income' : 'expense',
    ]);
    await worksheet!.values.appendRow([
      title,
      amount,
      isIncome == true ? 'income' : 'expense',
    ]);
  }

  static double calculateIncome() {
    double totalIncome = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'income') {
        totalIncome += double.parse(currentTransactions[i][1]);
      }
    }
    return totalIncome;
  }

  static double calculateExpense() {
    double totalExpense = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'expense') {
        totalExpense += double.parse(currentTransactions[i][1]);
      }
    }
    return totalExpense;
  }
}
