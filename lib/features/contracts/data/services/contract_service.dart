import '../models/contract_model.dart';

abstract class ContractService {
  Future<List<ContractModel>> getContracts({required String userId});
  Future<ContractModel> signContract({required String contractId, required String userId});
}
