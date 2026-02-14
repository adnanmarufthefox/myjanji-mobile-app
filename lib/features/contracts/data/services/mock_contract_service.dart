import 'contract_service.dart';
import '../models/contract_model.dart';

class MockContractService implements ContractService {
  @override
  Future<List<ContractModel>> getContracts({required String userId}) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      ContractModel(
        id: '1',
        title: 'User Agreement',
        status: 'pending',
        signedDate: DateTime.now(),
      ),
    ];
  }

  @override
  Future<ContractModel> signContract({required String contractId, required String userId}) async {
    await Future.delayed(const Duration(seconds: 1));
    return ContractModel(
      id: contractId,
      title: 'User Agreement',
      status: 'signed',
      signedDate: DateTime.now(),
    );
  }
}
