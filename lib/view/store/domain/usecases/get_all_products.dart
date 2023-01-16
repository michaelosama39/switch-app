import 'package:dartz/dartz.dart';
import 'package:switch_app/view/store/domain/repository/base_store_repository.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/products_model.dart';

class GetAllProducts{
  final BaseStoreRepository baseStoreRepository;

  GetAllProducts(this.baseStoreRepository);

  Future<Either<Failure, ProductsModel>> execute() async {
    return await baseStoreRepository.getAllProducts();
  }
}