import 'package:provider/provider.dart';
import 'package:todo_list_provider/core/module/todo_list_module.dart';
import 'package:todo_list_provider/models/auth/login/login_controller.dart';
import 'package:todo_list_provider/models/auth/login/login_page.dart';
import 'package:todo_list_provider/models/auth/register/register_controller.dart';
import 'package:todo_list_provider/models/auth/register/register_pager.dart';

class authModule extends TodoListModule {
  authModule()
      : super(
          // Aque vamos encontrar os bindings e as routers
          // que módulo login precisa
          bindings: [
            ChangeNotifierProvider(
              create: (_) => LoginController(),
            ),
            ChangeNotifierProvider(
              create: (_) => RegisterController(),
            )
          ],
          routers: {
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterPager(),
          },
        );
}
