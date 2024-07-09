# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/custom-actions


# This is a simple example for a custom action which utters "Hello World!"

from typing import Any, Coroutine, Text, Dict, List
from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.types import DomainDict
from swiplserver import PrologMQI
import pandas as pd 
from sklearn.tree import DecisionTreeClassifier
from sklearn import tree
import graphviz
#
#
# class ActionHelloWorld(Action):
#
#     def name(self) -> Text:
#         return "action_hello_world"
#
#     def run(self, dispatcher: CollectingDispatcher,
#             tracker: Tracker,
#             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
#
#         dispatcher.utter_message(text="Hello World!")
#
#         return []

class ActionBuscaProd(Action):
    def name(self) -> Text:
      return "action_busca_prod"
    
    def run(self, dispatcher: CollectingDispatcher, 
            tracker: Tracker, 
            domain: Dict[Text, Any]) -> List[Dict[Text, Any]] :
      print("Ejecuta la accion buscaprod")
      producto = tracker.get_slot("producto")

      print( "Slot:  {producto}" )
      if producto != "None":
         minSlot = str(producto).lower()
         with PrologMQI(port=8000) as mqi:
            with mqi.create_thread() as prolog_thread:
               print("entro a mqi 2")
               prolog_thread.query("E:/Locaso/Carpeta_Facultad/Exploratoria old and new/Exploratoria2023/trabajoChat/BaseML.pl')")
               print("paso carga")
               rtaProducto = prolog_thread.query(f"buscar_prod('{minSlot}')")
               if rtaProducto:
                  dispatcher.utter_message(text=f"Hay disponibles productos de {producto}")
               else:
                  dispatcher.utter_message(text=f"No hay disponibles productos de {producto}")
      else:
         dispatcher.utter_message(text=f"No logramos entender el producto que busca")

      return[]
    
class ActionBuscaCategorias(Action):
   def name(self) -> Text:
      return "action_busca_categorias"
   
   def run(self, dispatcher: CollectingDispatcher, tracker: Tracker, domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
      print("Ejecuta busca categorias")
      with PrologMQI(port=8000) as mqi:
         with mqi.create_thread() as prolog_thread:
            prolog_thread.query("consult('E:/Locaso/Carpeta_Facultad/Exploratoria old and new/Exploratoria2023/trabajoChat/BaseML.pl')")
            result = prolog_thread.query(f"obtener_categorias(Categorias).")
            categorias = [str(solucion['Categorias']) for solucion in result]
            if categorias:
             mensaje = f"Las categorías disponibles son: {(', '.join(categorias))} "
            else:
             mensaje = "No se encontraron categorías."

         dispatcher.utter_message(text=mensaje)
            
      return []