

  Widget _dynamicQrImage() {
    return Visibility(
      visible: _vm.isCreatedQr.value,
      child: Column(
        children: [
          QrImageView(
            size: 200,
            backgroundColor: Colors.white,
            data: _vm.qrData.value,
          ),
          Text("Data: ${_vm.qrData.value}"),
          ValueListenableBuilder(
            valueListenable: _vm.remainingTime,
            builder: (_, time, __) {
                //Widgeti screende bu şekilde cağırıyorum.
              return CircularTimerWidget(
                controller: _controller,
                onCompleted: () => _vm.restartTimer(time + 1, _controller),
                totalTime: _vm.remainingTime.value + 1,
              );
            },
          ),
          IconButton(
              onPressed: () {
                _vm.isCreatedQr.value = false;
              },
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconCreator(
                    iconPath: 'assets/icons/stopwatch.png',
                    iconColor: Theme.of(context).hintColor.withValues(alpha: 1),
                    iconSize: 150,
                  ),
                  Text(
                    "End QR Attendance",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              )),
        ],
      ),
    );
  }

