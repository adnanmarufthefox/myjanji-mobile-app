import 'package:myjanji/core/utils/logger.dart';
import '../services/contract_service.dart';
import '../models/contract_model.dart';

class ContractRepository {
  final ContractService _contractService;

  ContractRepository(this._contractService);

  Future<List<ContractModel>> getContracts(String userId) async {
    try {
      Logger.info('ContractRepository: Fetching contracts');
      return await _contractService.getContracts(userId: userId);
    } catch (e) {
      Logger.error('ContractRepository: Failed to fetch contracts', e);
      rethrow;
    }
  }

  Future<ContractModel> signContract(String contractId, String userId) async {
    try {
      Logger.info('ContractRepository: Signing contract');
      return await _contractService.signContract(
        contractId: contractId,
        userId: userId,
      );
    } catch (e) {
      Logger.error('ContractRepository: Failed to sign contract', e);
      rethrow;
    }
  }
}
