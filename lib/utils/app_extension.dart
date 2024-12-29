import 'package:cloud_firestore/cloud_firestore.dart';

extension FirebaseErrorHandler on FirebaseException {
  String get friendlyMessage {
    switch (code) {
      case 'permission-denied':
        return "Ruxsat berilmagan!";
      case 'unavailable':
        return "Xizmat vaqtincha mavjud emas!";
      case 'not-found':
        return "Ma'lumot topilmadi!";
      case 'already-exists':
        return "Ma'lumot allaqachon mavjud!";
      case 'cancelled':
        return "Amal bekor qilindi!";
      case 'deadline-exceeded':
        return "So'rov uchun vaqt tugadi!";
      case 'invalid-argument':
        return "Noto'g'ri argument kiritildi!";
      case 'unauthenticated':
        return "Foydalanuvchi avtorizatsiyadan o'tmagan!";
      case 'failed-precondition':
        return "Shart bajarilmagan!";
      case 'aborted':
        return "Amal to'xtatildi!";
      case 'out-of-range':
        return "Qiymat diapazondan tashqarida!";
      default:
        return "Noma'lum xatolik: $message";
    }
  }
}
