import json
import websockets

class Main:
    def __on_open__(self, _):
        pass

    def __on_close__(self, _):
        pass

    def __on_message__(self, _, message):
        json_message = json.loads(message)

    def __subscribe__(self):
        ws = websocket.WebSocketApp(self.SOCKET,
                                    on_open=self.__on_open__,
                                    on_close=self.__on_close__,
                                    on_message=self.__on_message__)
        ws.run_forever()

if __name__ == "__main__":
    time.sleep(15)
    main = Main()
