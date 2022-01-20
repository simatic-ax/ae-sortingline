# Sorting Line Application Example

## Description
Sorting line by using the library `WindowTracking` 

### Layout

This example shows a small example of a sorting line with 4 exits.

![](./doc/linelayout.png)
### How does it work

In this example every second, a `TransportWindow` will be created and one of 16 items in a list will be assigned to this window. Each item has one sort destination (exit point).

During the execution, a encoder will be simulated. This encoder will be incremented by 10mm every 10ms (corresponds 1m/s belt speed). In your application, the simulated encoder has to be replaced by a concrete one of type `IEncoder`.

The `TransportWindow` will be moved according the encoder values. When a `TransportWindow` reaches a `VirtualTrigger`, it will be activated and the event handler which belongs to the `VirtualTrigger`, will be executed.

1. If the event handler is a `SortDecisionEvent`:
    
    The `SortDecisionEvent` check, if the assigned item in the `TransportWindow` is designated for the active `TriggerPoint`.
    
    If yes, the exit handler of the `SortDecisionEvent` will be executed. In your application, you've to implement your own exit handler (e.g. if the exit is another conveyor, it has to be startup).

    If not, nothing happened. 

1. If the event handler is a `TerminateWindowEvent`: 

    In this case, the TransportWindow will be terminated. That has to be done at the end of the sorting line. 


## Execute the Application Example (AX Code local)
1. If not open, open a terminal (`CTRL+SHIFT+ö`)
1. Start a PLCSIM Advanced Instance (IP: Address 192.168.0.1). To change the IP you'll find information [here](#tips-and-tricks)

1. Install dependencies (if not yet done)
   
   ```cli
   apax install -L
   ```
1. Update your dependencies (optionally)

   ```cli
   apax update -a
   ```

1. If not done download a HWCN with the command:
   
   ```cli
   apax loadhwcn
   ```

   Result: a predefined HWCN from the folder `hwcn` will be downloaded. If the predefined HWCN (CPU 1516, FW2.8) is not compatible with your device, you've to create your own HWCN with TIA Portal and download it to the PLC/PLCSIM.

1. Build in download the project to the PLC
   
   1. Download to a PLCSIM Advanced
   
   ```cli
   apax dlsim
   ```

    1. Download to a real hardware PLC

   ```cli
   apax dlhwplc
   ```

   The project will be compiled and downloaded to the PLCSIM Advanced instance
   
1. Open the monitoring file mon.mon
1. Go online

    ![](doc/goonline.png)

1. Watch the values
   
   ![](doc/mon-file.png)

## Tips and tricks

### Change the IP address for the downloader

To change the target IP address, open the `apax.yml` and search the entry `IP_ADDRESS`, Enter the IP address for your target.

### Change the IP address for the online debugging and monitoring

To change the IP address for the debugging, open the file `./vscode/launch.json` and search the entry `ip`, Enter the IP address for your device.

## Contribution

Thanks for your interest in contributing. Anybody is free to report bugs, unclear documentation, and other problems regarding this repository in the Issues section or, even better, is free to propose any changes to this repository using Merge Requests.

## License and Legal information

Please read the [Legal information](LICENSE.md)
