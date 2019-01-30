package;

import kha.Scheduler;
import kha.System;

class Main {
	static var map = new Map<String, Dynamic>();

	static function update(): Void {
		var rand = Math.round(Math.random() * 100);
		map[Std.string(rand)] = rand;
	}

	static function print(): Void {
		trace("--- Next run ---");
		for (key in map.keys()) {
			trace(key + ": " + map[key]);
		}
	}

	public static function main() {
		System.start({title: "Project", width: 1024, height: 768}, function (_) {
			Scheduler.addTimeTask(function () { update(); }, 0, 1 / 60);
			Scheduler.addTimeTask(print, 5, 5);
		});
	}
}
