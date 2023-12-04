/// withdraw_open_time : "09:00 AM"
/// withdraw_close_time : "12:30 PM"
/// withdrawdata : [{"withdraw_request_id":"2","request_amount":"7","upi_id":"","request_number":"7534169","request_status":"1","payment_method":"1","bank_name":"","branch_address":"","ac_holder_name":"","ac_number":"","ifsc_code":"","paytm_number":"","google_pay_number":"","phone_pay_number":"","remark":"tt","payment_receipt":"https://developmentalphawizz.com/lottery/uploads/file/","insert_date":"24 Nov 2023 06:22:50 PM"},{"withdraw_request_id":"1","request_amount":"150","upi_id":"sadsdsfdsd65","request_number":"2951198","request_status":"0","payment_method":"2","bank_name":"","branch_address":"","ac_holder_name":"","ac_number":"","ifsc_code":"","paytm_number":"","google_pay_number":"","phone_pay_number":"","remark":"","payment_receipt":"https://developmentalphawizz.com/lottery/uploads/file/","insert_date":"24 Nov 2023 05:43:03 PM"}]
/// last_request_status : "1"
/// msg : "Withdraw Trasaction Data"
/// status : true
/// wallet_amt : "100"

class GetTransactionModel {
  GetTransactionModel({
      String? withdrawOpenTime, 
      String? withdrawCloseTime, 
      List<Withdrawdata>? withdrawdata, 
      String? lastRequestStatus, 
      String? msg, 
      bool? status, 
      String? walletAmt,}){
    _withdrawOpenTime = withdrawOpenTime;
    _withdrawCloseTime = withdrawCloseTime;
    _withdrawdata = withdrawdata;
    _lastRequestStatus = lastRequestStatus;
    _msg = msg;
    _status = status;
    _walletAmt = walletAmt;
}

  GetTransactionModel.fromJson(dynamic json) {
    _withdrawOpenTime = json['withdraw_open_time'];
    _withdrawCloseTime = json['withdraw_close_time'];
    if (json['withdrawdata'] != null) {
      _withdrawdata = [];
      json['withdrawdata'].forEach((v) {
        _withdrawdata?.add(Withdrawdata.fromJson(v));
      });
    }
    _lastRequestStatus = json['last_request_status'];
    _msg = json['msg'];
    _status = json['status'];
    _walletAmt = json['wallet_amt'];
  }
  String? _withdrawOpenTime;
  String? _withdrawCloseTime;
  List<Withdrawdata>? _withdrawdata;
  String? _lastRequestStatus;
  String? _msg;
  bool? _status;
  String? _walletAmt;
GetTransactionModel copyWith({  String? withdrawOpenTime,
  String? withdrawCloseTime,
  List<Withdrawdata>? withdrawdata,
  String? lastRequestStatus,
  String? msg,
  bool? status,
  String? walletAmt,
}) => GetTransactionModel(  withdrawOpenTime: withdrawOpenTime ?? _withdrawOpenTime,
  withdrawCloseTime: withdrawCloseTime ?? _withdrawCloseTime,
  withdrawdata: withdrawdata ?? _withdrawdata,
  lastRequestStatus: lastRequestStatus ?? _lastRequestStatus,
  msg: msg ?? _msg,
  status: status ?? _status,
  walletAmt: walletAmt ?? _walletAmt,
);
  String? get withdrawOpenTime => _withdrawOpenTime;
  String? get withdrawCloseTime => _withdrawCloseTime;
  List<Withdrawdata>? get withdrawdata => _withdrawdata;
  String? get lastRequestStatus => _lastRequestStatus;
  String? get msg => _msg;
  bool? get status => _status;
  String? get walletAmt => _walletAmt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['withdraw_open_time'] = _withdrawOpenTime;
    map['withdraw_close_time'] = _withdrawCloseTime;
    if (_withdrawdata != null) {
      map['withdrawdata'] = _withdrawdata?.map((v) => v.toJson()).toList();
    }
    map['last_request_status'] = _lastRequestStatus;
    map['msg'] = _msg;
    map['status'] = _status;
    map['wallet_amt'] = _walletAmt;
    return map;
  }

}

/// withdraw_request_id : "2"
/// request_amount : "7"
/// upi_id : ""
/// request_number : "7534169"
/// request_status : "1"
/// payment_method : "1"
/// bank_name : ""
/// branch_address : ""
/// ac_holder_name : ""
/// ac_number : ""
/// ifsc_code : ""
/// paytm_number : ""
/// google_pay_number : ""
/// phone_pay_number : ""
/// remark : "tt"
/// payment_receipt : "https://developmentalphawizz.com/lottery/uploads/file/"
/// insert_date : "24 Nov 2023 06:22:50 PM"

class Withdrawdata {
  Withdrawdata({
      String? withdrawRequestId, 
      String? requestAmount, 
      String? upiId, 
      String? requestNumber, 
      String? requestStatus, 
      String? paymentMethod, 
      String? bankName, 
      String? branchAddress, 
      String? acHolderName, 
      String? acNumber, 
      String? ifscCode, 
      String? paytmNumber, 
      String? googlePayNumber, 
      String? phonePayNumber, 
      String? remark, 
      String? paymentReceipt, 
      String? insertDate,}){
    _withdrawRequestId = withdrawRequestId;
    _requestAmount = requestAmount;
    _upiId = upiId;
    _requestNumber = requestNumber;
    _requestStatus = requestStatus;
    _paymentMethod = paymentMethod;
    _bankName = bankName;
    _branchAddress = branchAddress;
    _acHolderName = acHolderName;
    _acNumber = acNumber;
    _ifscCode = ifscCode;
    _paytmNumber = paytmNumber;
    _googlePayNumber = googlePayNumber;
    _phonePayNumber = phonePayNumber;
    _remark = remark;
    _paymentReceipt = paymentReceipt;
    _insertDate = insertDate;
}

  Withdrawdata.fromJson(dynamic json) {
    _withdrawRequestId = json['withdraw_request_id'];
    _requestAmount = json['request_amount'];
    _upiId = json['upi_id'];
    _requestNumber = json['request_number'];
    _requestStatus = json['request_status'];
    _paymentMethod = json['payment_method'];
    _bankName = json['bank_name'];
    _branchAddress = json['branch_address'];
    _acHolderName = json['ac_holder_name'];
    _acNumber = json['ac_number'];
    _ifscCode = json['ifsc_code'];
    _paytmNumber = json['paytm_number'];
    _googlePayNumber = json['google_pay_number'];
    _phonePayNumber = json['phone_pay_number'];
    _remark = json['remark'];
    _paymentReceipt = json['payment_receipt'];
    _insertDate = json['insert_date'];
  }
  String? _withdrawRequestId;
  String? _requestAmount;
  String? _upiId;
  String? _requestNumber;
  String? _requestStatus;
  String? _paymentMethod;
  String? _bankName;
  String? _branchAddress;
  String? _acHolderName;
  String? _acNumber;
  String? _ifscCode;
  String? _paytmNumber;
  String? _googlePayNumber;
  String? _phonePayNumber;
  String? _remark;
  String? _paymentReceipt;
  String? _insertDate;
Withdrawdata copyWith({  String? withdrawRequestId,
  String? requestAmount,
  String? upiId,
  String? requestNumber,
  String? requestStatus,
  String? paymentMethod,
  String? bankName,
  String? branchAddress,
  String? acHolderName,
  String? acNumber,
  String? ifscCode,
  String? paytmNumber,
  String? googlePayNumber,
  String? phonePayNumber,
  String? remark,
  String? paymentReceipt,
  String? insertDate,
}) => Withdrawdata(  withdrawRequestId: withdrawRequestId ?? _withdrawRequestId,
  requestAmount: requestAmount ?? _requestAmount,
  upiId: upiId ?? _upiId,
  requestNumber: requestNumber ?? _requestNumber,
  requestStatus: requestStatus ?? _requestStatus,
  paymentMethod: paymentMethod ?? _paymentMethod,
  bankName: bankName ?? _bankName,
  branchAddress: branchAddress ?? _branchAddress,
  acHolderName: acHolderName ?? _acHolderName,
  acNumber: acNumber ?? _acNumber,
  ifscCode: ifscCode ?? _ifscCode,
  paytmNumber: paytmNumber ?? _paytmNumber,
  googlePayNumber: googlePayNumber ?? _googlePayNumber,
  phonePayNumber: phonePayNumber ?? _phonePayNumber,
  remark: remark ?? _remark,
  paymentReceipt: paymentReceipt ?? _paymentReceipt,
  insertDate: insertDate ?? _insertDate,
);
  String? get withdrawRequestId => _withdrawRequestId;
  String? get requestAmount => _requestAmount;
  String? get upiId => _upiId;
  String? get requestNumber => _requestNumber;
  String? get requestStatus => _requestStatus;
  String? get paymentMethod => _paymentMethod;
  String? get bankName => _bankName;
  String? get branchAddress => _branchAddress;
  String? get acHolderName => _acHolderName;
  String? get acNumber => _acNumber;
  String? get ifscCode => _ifscCode;
  String? get paytmNumber => _paytmNumber;
  String? get googlePayNumber => _googlePayNumber;
  String? get phonePayNumber => _phonePayNumber;
  String? get remark => _remark;
  String? get paymentReceipt => _paymentReceipt;
  String? get insertDate => _insertDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['withdraw_request_id'] = _withdrawRequestId;
    map['request_amount'] = _requestAmount;
    map['upi_id'] = _upiId;
    map['request_number'] = _requestNumber;
    map['request_status'] = _requestStatus;
    map['payment_method'] = _paymentMethod;
    map['bank_name'] = _bankName;
    map['branch_address'] = _branchAddress;
    map['ac_holder_name'] = _acHolderName;
    map['ac_number'] = _acNumber;
    map['ifsc_code'] = _ifscCode;
    map['paytm_number'] = _paytmNumber;
    map['google_pay_number'] = _googlePayNumber;
    map['phone_pay_number'] = _phonePayNumber;
    map['remark'] = _remark;
    map['payment_receipt'] = _paymentReceipt;
    map['insert_date'] = _insertDate;
    return map;
  }

}