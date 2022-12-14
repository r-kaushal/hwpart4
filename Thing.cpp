#include "Thing.h"
#include "ecs36b_Common.h"

Thing::Thing(Person owner, string description,string thingName, GPS_DD location)
{
  this->description = description;
  this->owner = owner;
  this->thingName = thingName;
  this->location = location;
}
Thing::Thing(string thingName)
{
  this->thingName = thingName;
}
Thing::Thing()
{
  this->thingName = "";
}
void Thing:: setOwner(Person p1){
  this->owner = p1;
}

Json::Value Thing::dump2JSON()
{

  Json::Value result {};
    result["thing name"] = this->thingName;

  Json::Value jv_result;
  
  jv_result = (this->owner).dump2JSON();
  result["owner"] = jv_result;

  jv_result = (this->location).dump2JSON();
  result["location"] = jv_result;

  // std::cout << jv_result.toStyledString() << std::endl;

  return result;
}
