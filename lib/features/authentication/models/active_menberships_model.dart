import 'package:t_store/utils/constants/image_strings.dart';

class ActiveMembership {
  final String membershipName;
  final String trainerName;
  final String styleOfTraining;
  final String imageUrl;

  ActiveMembership({
    required this.membershipName,
    required this.trainerName,
    required this.styleOfTraining,
    required this.imageUrl,
  });
}

List<ActiveMembership> sampleMemberships = [
  ActiveMembership(
    membershipName: 'Online Calisthenics',
    trainerName: 'John Doe',
    styleOfTraining: 'Calisthenics',
    imageUrl: TImages.user,
  ),
  ActiveMembership(
    membershipName: 'Fitness Factory',
    trainerName: 'Jane Smith',
    styleOfTraining: 'Weight Training',
    imageUrl: TImages.user,
  ),
  ActiveMembership(
    membershipName: 'Body Fitness',
    trainerName: 'Rishad',
    styleOfTraining: 'Weight Training',
    imageUrl: TImages.user,
  ),
  ActiveMembership(
    membershipName: 'Fitspo',
    trainerName: 'Abi',
    styleOfTraining: 'Weight Training',
    imageUrl: TImages.user,
  ),
];
