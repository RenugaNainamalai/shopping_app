import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_app/screens/login.dart';
void main(){

test('empty user returns error string', (){
final result = UserFieldValidator.validate('');
    expect(result, 'User field can\'t be empty');
});
test('empty password returns error string', (){
final result = PasswordFieldValidator.validate('');
    expect(result, 'Password can\'t be empty');
});
test('non-empty password returns error string', (){
final result = PasswordFieldValidator.validate('password');
    expect(result, null);
});
test('non-empty user returns error string', (){
final result = UserFieldValidator.validate('user');
    expect(result, null);
});
}