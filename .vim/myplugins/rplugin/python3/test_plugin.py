import neovim
import threading
from glob import glob

import pydub
from pydub.playback import play
class Music(threading.Thread):
    def __init__(self, titles):
        super().__init__()
        self.titles = titles
        self.run = True

    def run(self):
        exit()
        title = pydub.AudioSegment.from_mp3("/Users/ctare/my/python/ytb/result/sakuzyo/Altale.mp3")
        # play(title)
        # while self.run:
            # random.shuffle(self.titles)
            # title = pydub.AudioSegment.from_mp3(self.titles[0])


@neovim.plugin
class TestPlugin:
    def __init__(self, nvim):
        self.nvim = nvim
        self.url = "/Users/ctare/my/python/ytb/result/{}/*".format
        self.titles = glob(self.url("sakuzyo"))

    @neovim.function("TestFunction", sync=True)
    def test_function(self, args):
        Music(self.nvim).start()
        return args

    @neovim.command("TestCommand", range='', nargs='*')
    def test_command(self, args, rng):
        self.nvim.current.line = ('HHHell {}'.format(args, rng))

    @neovim.autocmd('BufEnter', pattern='*.py', eval='expand("<afile>")', sync=True)
    def on_bufenter(self, filename):
        self.nvim.out_write("testplugin is in {} \n".format(filename))

    @neovim.autocmd('VimLeave', pattern='*', eval='expand("<afile>")', sync=True)
    def on_exit(self, filename):
        self.music.run = False
