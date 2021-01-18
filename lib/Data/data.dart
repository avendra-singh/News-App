import 'package:fresh_news/models/categorymodel.dart';

List <categorymodel> getcategories(){
  List <categorymodel> category =new List <categorymodel>();
  categorymodel cm = new categorymodel();
  //1
  cm.name="Science";
  cm.imageurl="https://images.unsplash.com/photo-1507668077129-56e32842fceb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1868&q=80";
  category.add(cm);

  //2
  cm = new categorymodel();
  cm.name="Entertainment";
  cm.imageurl="https://images.unsplash.com/photo-1470020618177-f49a96241ae7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
  category.add(cm);
  //3
   cm = new categorymodel();
  cm.name="General";
  cm.imageurl="https://images.unsplash.com/photo-1444312645910-ffa973656eba?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80";
  category.add(cm);
  //4
   cm = new categorymodel();
  cm.name="Health";
  cm.imageurl="https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(cm);
  //5
   cm = new categorymodel();
  cm.name="business";
  cm.imageurl="https://images.unsplash.com/photo-1488998527040-85054a85150e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(cm);
  //6
   cm = new categorymodel();
  cm.name="Sports";
  cm.imageurl="https://images.unsplash.com/photo-1517649763962-0c623066013b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
  category.add(cm);
  //7
   cm = new categorymodel();
  cm.name="Technology";
  cm.imageurl="https://images.unsplash.com/photo-1485827404703-89b55fcc595e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80";
  category.add(cm);
  //8
   cm = new categorymodel();
  cm.name="Others";
  cm.imageurl="https://images.unsplash.com/photo-1504610926078-a1611febcad3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80";
  category.add(cm);
  return category;
}