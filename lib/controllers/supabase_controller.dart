import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:project/MemberInfo.dart';

class SupabaseController {
  static const adminTable = "Admin";
  static const MemTable = 'Members';
  static const TrainerTable = 'Trainer';
  static const url = 'https://olnbbfdxoeqsgxevijkm.supabase.co';
  static const anonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9sbmJiZmR4b2Vxc2d4ZXZpamttIiwicm9sZSI6ImFub24iLCJpYXQiOjE2Njg2MjUyMzAsImV4cCI6MTk4NDIwMTIzMH0.Ua_TpJHg_uFUvwrmMF4OZyRHj2QI-qhV8kM638IAjjo';

  static late final SupabaseController instance;
  late final Supabase supa;

  SupabaseController._(); // private constructor

  static Future<void> init() async {
    instance = SupabaseController._();
    instance.supa = await Supabase.initialize(url: url, anonKey: anonKey);
  }

  // will return true if login is successful; else fasle
  Future<bool> login(String email, String pass) async {
    final List res = await supa.client
        .from(adminTable)
        .select('Email_ID, Password')
        .eq('Email_ID', email)
        .eq('Password', pass);
    return res.isNotEmpty;
  }

  Future<bool> loginMem(String email, String pass) async {
    final List res3 = await supa.client
        .from(MemTable)
        .select('Email, Password,Name,Contact')
        .eq('Email', email)
        .eq('Password', pass);
    // return res3.isNotEmpty;
    return res3.isNotEmpty;
  }

  Future<void> RegMem(String regName, String regGen, String regCon,
      String regPack, String email) async {
    await supa.client.from(MemTable).insert({
      'Name': regName,
      'Gender': regGen,
      'Contact': regCon,
      'Package': regPack,
      'Email': email
    });
    return;
  }

  Future<void> UpdateMem(int uid, String regName, String regGen, String regCon,
      String regPack, String email, String pass) async {
    await supa.client.from(MemTable).update({
      'Name': regName,
      'Gender': regGen,
      'Contact': regCon,
      'Package': regPack,
      'Email': email,
      'Password': pass,
    }).eq('id', uid);
    return;
  }

  Future<void> DeleteMem(int uid) async {
    await supa.client.from(MemTable).delete().eq('id', uid);
    return;
  }

  Future<void> RegTrainer(String regName, String regGen, String regCon,
      String regPack, String Email) async {
    await supa.client.from(TrainerTable).insert({
      'Name': regName,
      'Gender': regGen,
      'Contact': regCon,
      'Package': regPack,
      'Email': Email,
    });
    return;
  }

  //where this function will be called from?
  Future<memberInfo> getSpecificData(
    String y,
  ) async {
    final Map<String, dynamic> x = await Supabase.instance.client
        .from('Members')
        .select('id, Name, Contact, Gender,Package,Email')
        .eq('Email', y)
        .single();
    return memberInfo.fromMap(x);
  }

  Future<List> SearchNames() async {
    final res1 = await supa.client.from(MemTable).select('Name');
    return res1;
  }

  Future<List> SearchTrainerNames() async {
    final res1 = await supa.client.from(TrainerTable).select('Name');
    return res1;
  }

  Future<List> members_under_trainer(String name) async {
    final res1 =
        await supa.client.from(MemTable).select('Name').eq('Trainer', name);
    //print(res1);
    return res1;
  }
}
