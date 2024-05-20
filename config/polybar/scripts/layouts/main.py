import json

import pexpect


def layout(new_symbol):
    match new_symbol:
        case "[]=":
            print("1")
        case "><>":
            print("2")
        case "[M]":
            print("3")
        case "TTT":
            print("4")
        case "===":
            print("5")
        case "|M|":
            print("6")
        case "|M|":
            print("7")
        case "[D]":
            print("9")
        case "---":
            print("10")


def main():
    command = "dwm-msg subscribe layout_change_event"
    process = pexpect.spawn(command)
    print("0")

    while True:
        try:
            index = process.expect(["{.*}", pexpect.TIMEOUT], timeout=None)
            if index == 0:
                event_data = json.loads(process.after)
                new_symbol = event_data.get("layout_change_event", {}).get("new_symbol")
                if new_symbol:
                    layout(new_symbol)
        except KeyboardInterrupt:
            break


if __name__ == "__main__":
    main()
