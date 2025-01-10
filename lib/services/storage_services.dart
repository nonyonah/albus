import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _addressKey = 'imported_addresses';
  final SharedPreferences _prefs;

  StorageService(this._prefs);

  Future<void> saveAddress(Map<String, dynamic> addressData) async {
    final addresses = await getAddresses();
    // Add validation to prevent duplicate addresses
    if (addresses.any((addr) => _isDuplicate(addr, addressData))) {
      throw Exception('Address already exists');
    }
    addresses.add(addressData);
    await _prefs.setString(_addressKey, jsonEncode(addresses));
  }

  bool _isDuplicate(Map<String, dynamic> existing, Map<String, dynamic> new_) {
    final existingAddresses = existing['addresses'] as Map<String, String>;
    final newAddresses = new_['addresses'] as Map<String, String>;

    return existingAddresses.entries.any((entry) =>
        newAddresses.containsKey(entry.key) &&
        newAddresses[entry.key]?.toLowerCase() == entry.value.toLowerCase());
  }

  Future<List<Map<String, dynamic>>> getAddresses() async {
    final String? data = _prefs.getString(_addressKey);
    if (data == null) return [];
    return List<Map<String, dynamic>>.from(jsonDecode(data));
  }

  Future<void> removeAddress(String name) async {
    final addresses = await getAddresses();
    addresses.removeWhere((addr) => addr['name'] == name);
    await _prefs.setString(_addressKey, jsonEncode(addresses));
  }
}
