
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc c0 b5 10 80       	mov    $0x8010b5c0,%esp
8010002d:	b8 b0 2e 10 80       	mov    $0x80102eb0,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 80 70 10 80       	push   $0x80107080
80100051:	68 c0 b5 10 80       	push   $0x8010b5c0
80100056:	e8 d5 42 00 00       	call   80104330 <initlock>
8010005b:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
80100062:	fc 10 80 
80100065:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc fc 10 80       	mov    $0x8010fcbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
80100092:	68 87 70 10 80       	push   $0x80107087
80100097:	50                   	push   %eax
80100098:	e8 83 41 00 00       	call   80104220 <initsleeplock>
8010009d:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
801000b6:	3d bc fc 10 80       	cmp    $0x8010fcbc,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 c0 b5 10 80       	push   $0x8010b5c0
801000e4:	e8 37 43 00 00       	call   80104420 <acquire>
801000e9:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b5 10 80       	push   $0x8010b5c0
80100162:	e8 d9 43 00 00       	call   80104540 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 ee 40 00 00       	call   80104260 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 ad 1f 00 00       	call   80102130 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 8e 70 10 80       	push   $0x8010708e
80100198:	e8 f3 01 00 00       	call   80100390 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 4d 41 00 00       	call   80104300 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 67 1f 00 00       	jmp    80102130 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 9f 70 10 80       	push   $0x8010709f
801001d1:	e8 ba 01 00 00       	call   80100390 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 0c 41 00 00       	call   80104300 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 bc 40 00 00       	call   801042c0 <releasesleep>
80100204:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010020b:	e8 10 42 00 00       	call   80104420 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100237:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
8010024f:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 df 42 00 00       	jmp    80104540 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 a6 70 10 80       	push   $0x801070a6
80100269:	e8 22 01 00 00       	call   80100390 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 eb 14 00 00       	call   80101770 <iunlock>
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 8f 41 00 00       	call   80104420 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e a1 00 00 00    	jle    80100342 <consoleread+0xd2>
801002a1:	8b 15 a0 ff 10 80    	mov    0x8010ffa0,%edx
801002a7:	39 15 a4 ff 10 80    	cmp    %edx,0x8010ffa4
801002ad:	74 2c                	je     801002db <consoleread+0x6b>
801002af:	eb 5f                	jmp    80100310 <consoleread+0xa0>
801002b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801002b8:	83 ec 08             	sub    $0x8,%esp
801002bb:	68 20 a5 10 80       	push   $0x8010a520
801002c0:	68 a0 ff 10 80       	push   $0x8010ffa0
801002c5:	e8 e6 3a 00 00       	call   80103db0 <sleep>
801002ca:	8b 15 a0 ff 10 80    	mov    0x8010ffa0,%edx
801002d0:	83 c4 10             	add    $0x10,%esp
801002d3:	3b 15 a4 ff 10 80    	cmp    0x8010ffa4,%edx
801002d9:	75 35                	jne    80100310 <consoleread+0xa0>
801002db:	e8 10 35 00 00       	call   801037f0 <myproc>
801002e0:	8b 40 24             	mov    0x24(%eax),%eax
801002e3:	85 c0                	test   %eax,%eax
801002e5:	74 d1                	je     801002b8 <consoleread+0x48>
801002e7:	83 ec 0c             	sub    $0xc,%esp
801002ea:	68 20 a5 10 80       	push   $0x8010a520
801002ef:	e8 4c 42 00 00       	call   80104540 <release>
801002f4:	89 3c 24             	mov    %edi,(%esp)
801002f7:	e8 94 13 00 00       	call   80101690 <ilock>
801002fc:	83 c4 10             	add    $0x10,%esp
801002ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100302:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100307:	5b                   	pop    %ebx
80100308:	5e                   	pop    %esi
80100309:	5f                   	pop    %edi
8010030a:	5d                   	pop    %ebp
8010030b:	c3                   	ret    
8010030c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100310:	8d 42 01             	lea    0x1(%edx),%eax
80100313:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
80100318:	89 d0                	mov    %edx,%eax
8010031a:	83 e0 7f             	and    $0x7f,%eax
8010031d:	0f be 80 20 ff 10 80 	movsbl -0x7fef00e0(%eax),%eax
80100324:	83 f8 04             	cmp    $0x4,%eax
80100327:	74 3f                	je     80100368 <consoleread+0xf8>
80100329:	83 c6 01             	add    $0x1,%esi
8010032c:	83 eb 01             	sub    $0x1,%ebx
8010032f:	83 f8 0a             	cmp    $0xa,%eax
80100332:	88 46 ff             	mov    %al,-0x1(%esi)
80100335:	74 43                	je     8010037a <consoleread+0x10a>
80100337:	85 db                	test   %ebx,%ebx
80100339:	0f 85 62 ff ff ff    	jne    801002a1 <consoleread+0x31>
8010033f:	8b 45 10             	mov    0x10(%ebp),%eax
80100342:	83 ec 0c             	sub    $0xc,%esp
80100345:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100348:	68 20 a5 10 80       	push   $0x8010a520
8010034d:	e8 ee 41 00 00       	call   80104540 <release>
80100352:	89 3c 24             	mov    %edi,(%esp)
80100355:	e8 36 13 00 00       	call   80101690 <ilock>
8010035a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010035d:	83 c4 10             	add    $0x10,%esp
80100360:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100363:	5b                   	pop    %ebx
80100364:	5e                   	pop    %esi
80100365:	5f                   	pop    %edi
80100366:	5d                   	pop    %ebp
80100367:	c3                   	ret    
80100368:	8b 45 10             	mov    0x10(%ebp),%eax
8010036b:	29 d8                	sub    %ebx,%eax
8010036d:	3b 5d 10             	cmp    0x10(%ebp),%ebx
80100370:	73 d0                	jae    80100342 <consoleread+0xd2>
80100372:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
80100378:	eb c8                	jmp    80100342 <consoleread+0xd2>
8010037a:	8b 45 10             	mov    0x10(%ebp),%eax
8010037d:	29 d8                	sub    %ebx,%eax
8010037f:	eb c1                	jmp    80100342 <consoleread+0xd2>
80100381:	eb 0d                	jmp    80100390 <panic>
80100383:	90                   	nop
80100384:	90                   	nop
80100385:	90                   	nop
80100386:	90                   	nop
80100387:	90                   	nop
80100388:	90                   	nop
80100389:	90                   	nop
8010038a:	90                   	nop
8010038b:	90                   	nop
8010038c:	90                   	nop
8010038d:	90                   	nop
8010038e:	90                   	nop
8010038f:	90                   	nop

80100390 <panic>:
80100390:	55                   	push   %ebp
80100391:	89 e5                	mov    %esp,%ebp
80100393:	56                   	push   %esi
80100394:	53                   	push   %ebx
80100395:	83 ec 30             	sub    $0x30,%esp
80100398:	fa                   	cli    
80100399:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
801003a0:	00 00 00 
801003a3:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003a6:	8d 75 f8             	lea    -0x8(%ebp),%esi
801003a9:	e8 92 23 00 00       	call   80102740 <lapicid>
801003ae:	83 ec 08             	sub    $0x8,%esp
801003b1:	50                   	push   %eax
801003b2:	68 ad 70 10 80       	push   $0x801070ad
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
801003c5:	c7 04 24 63 7a 10 80 	movl   $0x80107a63,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 73 3f 00 00       	call   80104350 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 c1 70 10 80       	push   $0x801070c1
801003ed:	e8 6e 02 00 00       	call   80100660 <cprintf>
801003f2:	83 c4 10             	add    $0x10,%esp
801003f5:	39 f3                	cmp    %esi,%ebx
801003f7:	75 e7                	jne    801003e0 <panic+0x50>
801003f9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
80100400:	00 00 00 
80100403:	eb fe                	jmp    80100403 <panic+0x73>
80100405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100410 <consputc>:
80100410:	8b 0d 58 a5 10 80    	mov    0x8010a558,%ecx
80100416:	85 c9                	test   %ecx,%ecx
80100418:	74 06                	je     80100420 <consputc+0x10>
8010041a:	fa                   	cli    
8010041b:	eb fe                	jmp    8010041b <consputc+0xb>
8010041d:	8d 76 00             	lea    0x0(%esi),%esi
80100420:	55                   	push   %ebp
80100421:	89 e5                	mov    %esp,%ebp
80100423:	57                   	push   %edi
80100424:	56                   	push   %esi
80100425:	53                   	push   %ebx
80100426:	89 c6                	mov    %eax,%esi
80100428:	83 ec 0c             	sub    $0xc,%esp
8010042b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100430:	0f 84 b1 00 00 00    	je     801004e7 <consputc+0xd7>
80100436:	83 ec 0c             	sub    $0xc,%esp
80100439:	50                   	push   %eax
8010043a:	e8 51 58 00 00       	call   80105c90 <uartputc>
8010043f:	83 c4 10             	add    $0x10,%esp
80100442:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100447:	b8 0e 00 00 00       	mov    $0xe,%eax
8010044c:	89 da                	mov    %ebx,%edx
8010044e:	ee                   	out    %al,(%dx)
8010044f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100454:	89 ca                	mov    %ecx,%edx
80100456:	ec                   	in     (%dx),%al
80100457:	0f b6 c0             	movzbl %al,%eax
8010045a:	89 da                	mov    %ebx,%edx
8010045c:	c1 e0 08             	shl    $0x8,%eax
8010045f:	89 c7                	mov    %eax,%edi
80100461:	b8 0f 00 00 00       	mov    $0xf,%eax
80100466:	ee                   	out    %al,(%dx)
80100467:	89 ca                	mov    %ecx,%edx
80100469:	ec                   	in     (%dx),%al
8010046a:	0f b6 d8             	movzbl %al,%ebx
8010046d:	09 fb                	or     %edi,%ebx
8010046f:	83 fe 0a             	cmp    $0xa,%esi
80100472:	0f 84 f3 00 00 00    	je     8010056b <consputc+0x15b>
80100478:	81 fe 00 01 00 00    	cmp    $0x100,%esi
8010047e:	0f 84 d7 00 00 00    	je     8010055b <consputc+0x14b>
80100484:	89 f0                	mov    %esi,%eax
80100486:	0f b6 c0             	movzbl %al,%eax
80100489:	80 cc 07             	or     $0x7,%ah
8010048c:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
80100493:	80 
80100494:	83 c3 01             	add    $0x1,%ebx
80100497:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
8010049d:	0f 8f ab 00 00 00    	jg     8010054e <consputc+0x13e>
801004a3:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
801004a9:	7f 66                	jg     80100511 <consputc+0x101>
801004ab:	be d4 03 00 00       	mov    $0x3d4,%esi
801004b0:	b8 0e 00 00 00       	mov    $0xe,%eax
801004b5:	89 f2                	mov    %esi,%edx
801004b7:	ee                   	out    %al,(%dx)
801004b8:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801004bd:	89 d8                	mov    %ebx,%eax
801004bf:	c1 f8 08             	sar    $0x8,%eax
801004c2:	89 ca                	mov    %ecx,%edx
801004c4:	ee                   	out    %al,(%dx)
801004c5:	b8 0f 00 00 00       	mov    $0xf,%eax
801004ca:	89 f2                	mov    %esi,%edx
801004cc:	ee                   	out    %al,(%dx)
801004cd:	89 d8                	mov    %ebx,%eax
801004cf:	89 ca                	mov    %ecx,%edx
801004d1:	ee                   	out    %al,(%dx)
801004d2:	b8 20 07 00 00       	mov    $0x720,%eax
801004d7:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
801004de:	80 
801004df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004e2:	5b                   	pop    %ebx
801004e3:	5e                   	pop    %esi
801004e4:	5f                   	pop    %edi
801004e5:	5d                   	pop    %ebp
801004e6:	c3                   	ret    
801004e7:	83 ec 0c             	sub    $0xc,%esp
801004ea:	6a 08                	push   $0x8
801004ec:	e8 9f 57 00 00       	call   80105c90 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 93 57 00 00       	call   80105c90 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 87 57 00 00       	call   80105c90 <uartputc>
80100509:	83 c4 10             	add    $0x10,%esp
8010050c:	e9 31 ff ff ff       	jmp    80100442 <consputc+0x32>
80100511:	52                   	push   %edx
80100512:	68 60 0e 00 00       	push   $0xe60
80100517:	83 eb 50             	sub    $0x50,%ebx
8010051a:	68 a0 80 0b 80       	push   $0x800b80a0
8010051f:	68 00 80 0b 80       	push   $0x800b8000
80100524:	e8 27 41 00 00       	call   80104650 <memmove>
80100529:	b8 80 07 00 00       	mov    $0x780,%eax
8010052e:	83 c4 0c             	add    $0xc,%esp
80100531:	29 d8                	sub    %ebx,%eax
80100533:	01 c0                	add    %eax,%eax
80100535:	50                   	push   %eax
80100536:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
80100539:	6a 00                	push   $0x0
8010053b:	2d 00 80 f4 7f       	sub    $0x7ff48000,%eax
80100540:	50                   	push   %eax
80100541:	e8 5a 40 00 00       	call   801045a0 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 c5 70 10 80       	push   $0x801070c5
80100556:	e8 35 fe ff ff       	call   80100390 <panic>
8010055b:	85 db                	test   %ebx,%ebx
8010055d:	0f 84 48 ff ff ff    	je     801004ab <consputc+0x9b>
80100563:	83 eb 01             	sub    $0x1,%ebx
80100566:	e9 2c ff ff ff       	jmp    80100497 <consputc+0x87>
8010056b:	89 d8                	mov    %ebx,%eax
8010056d:	b9 50 00 00 00       	mov    $0x50,%ecx
80100572:	99                   	cltd   
80100573:	f7 f9                	idiv   %ecx
80100575:	29 d1                	sub    %edx,%ecx
80100577:	01 cb                	add    %ecx,%ebx
80100579:	e9 19 ff ff ff       	jmp    80100497 <consputc+0x87>
8010057e:	66 90                	xchg   %ax,%ax

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d3                	mov    %edx,%ebx
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 04                	je     80100596 <printint+0x16>
80100592:	85 c0                	test   %eax,%eax
80100594:	78 5a                	js     801005f0 <printint+0x70>
80100596:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
8010059d:	31 c9                	xor    %ecx,%ecx
8010059f:	8d 75 d7             	lea    -0x29(%ebp),%esi
801005a2:	eb 06                	jmp    801005aa <printint+0x2a>
801005a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801005a8:	89 f9                	mov    %edi,%ecx
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 79 01             	lea    0x1(%ecx),%edi
801005af:	f7 f3                	div    %ebx
801005b1:	0f b6 92 f0 70 10 80 	movzbl -0x7fef8f10(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 3e             	mov    %dl,(%esi,%edi,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
801005cb:	8d 79 02             	lea    0x2(%ecx),%edi
801005ce:	8d 5c 3d d7          	lea    -0x29(%ebp,%edi,1),%ebx
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 03             	movsbl (%ebx),%eax
801005db:	83 eb 01             	sub    $0x1,%ebx
801005de:	e8 2d fe ff ff       	call   80100410 <consputc>
801005e3:	39 f3                	cmp    %esi,%ebx
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	90                   	nop
801005f0:	f7 d8                	neg    %eax
801005f2:	eb a9                	jmp    8010059d <printint+0x1d>
801005f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	8b 75 10             	mov    0x10(%ebp),%esi
8010060c:	ff 75 08             	pushl  0x8(%ebp)
8010060f:	e8 5c 11 00 00       	call   80101770 <iunlock>
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 00 3e 00 00       	call   80104420 <acquire>
80100620:	83 c4 10             	add    $0x10,%esp
80100623:	85 f6                	test   %esi,%esi
80100625:	7e 18                	jle    8010063f <consolewrite+0x3f>
80100627:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010062a:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 d5 fd ff ff       	call   80100410 <consputc>
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 f4 3e 00 00       	call   80104540 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 3b 10 00 00       	call   80101690 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100673:	0f 85 6f 01 00 00    	jne    801007e8 <cprintf+0x188>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c7                	mov    %eax,%edi
80100680:	0f 84 77 01 00 00    	je     801007fd <cprintf+0x19d>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	8d 4d 0c             	lea    0xc(%ebp),%ecx
8010068c:	31 db                	xor    %ebx,%ebx
8010068e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100691:	85 c0                	test   %eax,%eax
80100693:	75 56                	jne    801006eb <cprintf+0x8b>
80100695:	eb 79                	jmp    80100710 <cprintf+0xb0>
80100697:	89 f6                	mov    %esi,%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	0f b6 16             	movzbl (%esi),%edx
801006a3:	85 d2                	test   %edx,%edx
801006a5:	74 69                	je     80100710 <cprintf+0xb0>
801006a7:	83 c3 02             	add    $0x2,%ebx
801006aa:	83 fa 70             	cmp    $0x70,%edx
801006ad:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
801006b0:	0f 84 84 00 00 00    	je     8010073a <cprintf+0xda>
801006b6:	7f 78                	jg     80100730 <cprintf+0xd0>
801006b8:	83 fa 25             	cmp    $0x25,%edx
801006bb:	0f 84 ff 00 00 00    	je     801007c0 <cprintf+0x160>
801006c1:	83 fa 64             	cmp    $0x64,%edx
801006c4:	0f 85 8e 00 00 00    	jne    80100758 <cprintf+0xf8>
801006ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006cd:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d2:	8d 48 04             	lea    0x4(%eax),%ecx
801006d5:	8b 00                	mov    (%eax),%eax
801006d7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801006da:	b9 01 00 00 00       	mov    $0x1,%ecx
801006df:	e8 9c fe ff ff       	call   80100580 <printint>
801006e4:	0f b6 06             	movzbl (%esi),%eax
801006e7:	85 c0                	test   %eax,%eax
801006e9:	74 25                	je     80100710 <cprintf+0xb0>
801006eb:	8d 53 01             	lea    0x1(%ebx),%edx
801006ee:	83 f8 25             	cmp    $0x25,%eax
801006f1:	8d 34 17             	lea    (%edi,%edx,1),%esi
801006f4:	74 aa                	je     801006a0 <cprintf+0x40>
801006f6:	89 55 e0             	mov    %edx,-0x20(%ebp)
801006f9:	e8 12 fd ff ff       	call   80100410 <consputc>
801006fe:	0f b6 06             	movzbl (%esi),%eax
80100701:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100704:	89 d3                	mov    %edx,%ebx
80100706:	85 c0                	test   %eax,%eax
80100708:	75 e1                	jne    801006eb <cprintf+0x8b>
8010070a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100710:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100713:	85 c0                	test   %eax,%eax
80100715:	74 10                	je     80100727 <cprintf+0xc7>
80100717:	83 ec 0c             	sub    $0xc,%esp
8010071a:	68 20 a5 10 80       	push   $0x8010a520
8010071f:	e8 1c 3e 00 00       	call   80104540 <release>
80100724:	83 c4 10             	add    $0x10,%esp
80100727:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010072a:	5b                   	pop    %ebx
8010072b:	5e                   	pop    %esi
8010072c:	5f                   	pop    %edi
8010072d:	5d                   	pop    %ebp
8010072e:	c3                   	ret    
8010072f:	90                   	nop
80100730:	83 fa 73             	cmp    $0x73,%edx
80100733:	74 43                	je     80100778 <cprintf+0x118>
80100735:	83 fa 78             	cmp    $0x78,%edx
80100738:	75 1e                	jne    80100758 <cprintf+0xf8>
8010073a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010073d:	ba 10 00 00 00       	mov    $0x10,%edx
80100742:	8d 48 04             	lea    0x4(%eax),%ecx
80100745:	8b 00                	mov    (%eax),%eax
80100747:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010074a:	31 c9                	xor    %ecx,%ecx
8010074c:	e8 2f fe ff ff       	call   80100580 <printint>
80100751:	eb 91                	jmp    801006e4 <cprintf+0x84>
80100753:	90                   	nop
80100754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100758:	b8 25 00 00 00       	mov    $0x25,%eax
8010075d:	89 55 e0             	mov    %edx,-0x20(%ebp)
80100760:	e8 ab fc ff ff       	call   80100410 <consputc>
80100765:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100768:	89 d0                	mov    %edx,%eax
8010076a:	e8 a1 fc ff ff       	call   80100410 <consputc>
8010076f:	e9 70 ff ff ff       	jmp    801006e4 <cprintf+0x84>
80100774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100778:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010077b:	8b 10                	mov    (%eax),%edx
8010077d:	8d 48 04             	lea    0x4(%eax),%ecx
80100780:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80100783:	85 d2                	test   %edx,%edx
80100785:	74 49                	je     801007d0 <cprintf+0x170>
80100787:	0f be 02             	movsbl (%edx),%eax
8010078a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010078d:	84 c0                	test   %al,%al
8010078f:	0f 84 4f ff ff ff    	je     801006e4 <cprintf+0x84>
80100795:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100798:	89 d3                	mov    %edx,%ebx
8010079a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801007a0:	83 c3 01             	add    $0x1,%ebx
801007a3:	e8 68 fc ff ff       	call   80100410 <consputc>
801007a8:	0f be 03             	movsbl (%ebx),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
801007af:	8b 45 e0             	mov    -0x20(%ebp),%eax
801007b2:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801007b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801007b8:	e9 27 ff ff ff       	jmp    801006e4 <cprintf+0x84>
801007bd:	8d 76 00             	lea    0x0(%esi),%esi
801007c0:	b8 25 00 00 00       	mov    $0x25,%eax
801007c5:	e8 46 fc ff ff       	call   80100410 <consputc>
801007ca:	e9 15 ff ff ff       	jmp    801006e4 <cprintf+0x84>
801007cf:	90                   	nop
801007d0:	ba d8 70 10 80       	mov    $0x801070d8,%edx
801007d5:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801007d8:	b8 28 00 00 00       	mov    $0x28,%eax
801007dd:	89 d3                	mov    %edx,%ebx
801007df:	eb bf                	jmp    801007a0 <cprintf+0x140>
801007e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e8:	83 ec 0c             	sub    $0xc,%esp
801007eb:	68 20 a5 10 80       	push   $0x8010a520
801007f0:	e8 2b 3c 00 00       	call   80104420 <acquire>
801007f5:	83 c4 10             	add    $0x10,%esp
801007f8:	e9 7c fe ff ff       	jmp    80100679 <cprintf+0x19>
801007fd:	83 ec 0c             	sub    $0xc,%esp
80100800:	68 df 70 10 80       	push   $0x801070df
80100805:	e8 86 fb ff ff       	call   80100390 <panic>
8010080a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100810 <consoleintr>:
80100810:	55                   	push   %ebp
80100811:	89 e5                	mov    %esp,%ebp
80100813:	57                   	push   %edi
80100814:	56                   	push   %esi
80100815:	53                   	push   %ebx
80100816:	31 f6                	xor    %esi,%esi
80100818:	83 ec 18             	sub    $0x18,%esp
8010081b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010081e:	68 20 a5 10 80       	push   $0x8010a520
80100823:	e8 f8 3b 00 00       	call   80104420 <acquire>
80100828:	83 c4 10             	add    $0x10,%esp
8010082b:	90                   	nop
8010082c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100830:	ff d3                	call   *%ebx
80100832:	85 c0                	test   %eax,%eax
80100834:	89 c7                	mov    %eax,%edi
80100836:	78 48                	js     80100880 <consoleintr+0x70>
80100838:	83 ff 10             	cmp    $0x10,%edi
8010083b:	0f 84 e7 00 00 00    	je     80100928 <consoleintr+0x118>
80100841:	7e 5d                	jle    801008a0 <consoleintr+0x90>
80100843:	83 ff 15             	cmp    $0x15,%edi
80100846:	0f 84 ec 00 00 00    	je     80100938 <consoleintr+0x128>
8010084c:	83 ff 7f             	cmp    $0x7f,%edi
8010084f:	75 54                	jne    801008a5 <consoleintr+0x95>
80100851:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100856:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010085c:	74 d2                	je     80100830 <consoleintr+0x20>
8010085e:	83 e8 01             	sub    $0x1,%eax
80100861:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100866:	b8 00 01 00 00       	mov    $0x100,%eax
8010086b:	e8 a0 fb ff ff       	call   80100410 <consputc>
80100870:	ff d3                	call   *%ebx
80100872:	85 c0                	test   %eax,%eax
80100874:	89 c7                	mov    %eax,%edi
80100876:	79 c0                	jns    80100838 <consoleintr+0x28>
80100878:	90                   	nop
80100879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100880:	83 ec 0c             	sub    $0xc,%esp
80100883:	68 20 a5 10 80       	push   $0x8010a520
80100888:	e8 b3 3c 00 00       	call   80104540 <release>
8010088d:	83 c4 10             	add    $0x10,%esp
80100890:	85 f6                	test   %esi,%esi
80100892:	0f 85 f8 00 00 00    	jne    80100990 <consoleintr+0x180>
80100898:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010089b:	5b                   	pop    %ebx
8010089c:	5e                   	pop    %esi
8010089d:	5f                   	pop    %edi
8010089e:	5d                   	pop    %ebp
8010089f:	c3                   	ret    
801008a0:	83 ff 08             	cmp    $0x8,%edi
801008a3:	74 ac                	je     80100851 <consoleintr+0x41>
801008a5:	85 ff                	test   %edi,%edi
801008a7:	74 87                	je     80100830 <consoleintr+0x20>
801008a9:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801008ae:	89 c2                	mov    %eax,%edx
801008b0:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
801008b6:	83 fa 7f             	cmp    $0x7f,%edx
801008b9:	0f 87 71 ff ff ff    	ja     80100830 <consoleintr+0x20>
801008bf:	8d 50 01             	lea    0x1(%eax),%edx
801008c2:	83 e0 7f             	and    $0x7f,%eax
801008c5:	83 ff 0d             	cmp    $0xd,%edi
801008c8:	89 15 a8 ff 10 80    	mov    %edx,0x8010ffa8
801008ce:	0f 84 cc 00 00 00    	je     801009a0 <consoleintr+0x190>
801008d4:	89 f9                	mov    %edi,%ecx
801008d6:	88 88 20 ff 10 80    	mov    %cl,-0x7fef00e0(%eax)
801008dc:	89 f8                	mov    %edi,%eax
801008de:	e8 2d fb ff ff       	call   80100410 <consputc>
801008e3:	83 ff 0a             	cmp    $0xa,%edi
801008e6:	0f 84 c5 00 00 00    	je     801009b1 <consoleintr+0x1a1>
801008ec:	83 ff 04             	cmp    $0x4,%edi
801008ef:	0f 84 bc 00 00 00    	je     801009b1 <consoleintr+0x1a1>
801008f5:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801008fa:	83 e8 80             	sub    $0xffffff80,%eax
801008fd:	39 05 a8 ff 10 80    	cmp    %eax,0x8010ffa8
80100903:	0f 85 27 ff ff ff    	jne    80100830 <consoleintr+0x20>
80100909:	83 ec 0c             	sub    $0xc,%esp
8010090c:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
80100911:	68 a0 ff 10 80       	push   $0x8010ffa0
80100916:	e8 45 36 00 00       	call   80103f60 <wakeup>
8010091b:	83 c4 10             	add    $0x10,%esp
8010091e:	e9 0d ff ff ff       	jmp    80100830 <consoleintr+0x20>
80100923:	90                   	nop
80100924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100928:	be 01 00 00 00       	mov    $0x1,%esi
8010092d:	e9 fe fe ff ff       	jmp    80100830 <consoleintr+0x20>
80100932:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100938:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010093d:	39 05 a4 ff 10 80    	cmp    %eax,0x8010ffa4
80100943:	75 2b                	jne    80100970 <consoleintr+0x160>
80100945:	e9 e6 fe ff ff       	jmp    80100830 <consoleintr+0x20>
8010094a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100950:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100955:	b8 00 01 00 00       	mov    $0x100,%eax
8010095a:	e8 b1 fa ff ff       	call   80100410 <consputc>
8010095f:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100964:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010096a:	0f 84 c0 fe ff ff    	je     80100830 <consoleintr+0x20>
80100970:	83 e8 01             	sub    $0x1,%eax
80100973:	89 c2                	mov    %eax,%edx
80100975:	83 e2 7f             	and    $0x7f,%edx
80100978:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
8010097f:	75 cf                	jne    80100950 <consoleintr+0x140>
80100981:	e9 aa fe ff ff       	jmp    80100830 <consoleintr+0x20>
80100986:	8d 76 00             	lea    0x0(%esi),%esi
80100989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100990:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100993:	5b                   	pop    %ebx
80100994:	5e                   	pop    %esi
80100995:	5f                   	pop    %edi
80100996:	5d                   	pop    %ebp
80100997:	e9 a4 36 00 00       	jmp    80104040 <procdump>
8010099c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801009a0:	c6 80 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%eax)
801009a7:	b8 0a 00 00 00       	mov    $0xa,%eax
801009ac:	e8 5f fa ff ff       	call   80100410 <consputc>
801009b1:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801009b6:	e9 4e ff ff ff       	jmp    80100909 <consoleintr+0xf9>
801009bb:	90                   	nop
801009bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801009c0 <consoleinit>:
801009c0:	55                   	push   %ebp
801009c1:	89 e5                	mov    %esp,%ebp
801009c3:	83 ec 10             	sub    $0x10,%esp
801009c6:	68 e8 70 10 80       	push   $0x801070e8
801009cb:	68 20 a5 10 80       	push   $0x8010a520
801009d0:	e8 5b 39 00 00       	call   80104330 <initlock>
801009d5:	58                   	pop    %eax
801009d6:	5a                   	pop    %edx
801009d7:	6a 00                	push   $0x0
801009d9:	6a 01                	push   $0x1
801009db:	c7 05 6c 09 11 80 00 	movl   $0x80100600,0x8011096c
801009e2:	06 10 80 
801009e5:	c7 05 68 09 11 80 70 	movl   $0x80100270,0x80110968
801009ec:	02 10 80 
801009ef:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009f6:	00 00 00 
801009f9:	e8 e2 18 00 00       	call   801022e0 <ioapicenable>
801009fe:	83 c4 10             	add    $0x10,%esp
80100a01:	c9                   	leave  
80100a02:	c3                   	ret    
80100a03:	66 90                	xchg   %ax,%ax
80100a05:	66 90                	xchg   %ax,%ax
80100a07:	66 90                	xchg   %ax,%ax
80100a09:	66 90                	xchg   %ax,%ax
80100a0b:	66 90                	xchg   %ax,%ax
80100a0d:	66 90                	xchg   %ax,%ax
80100a0f:	90                   	nop

80100a10 <exec>:
80100a10:	55                   	push   %ebp
80100a11:	89 e5                	mov    %esp,%ebp
80100a13:	57                   	push   %edi
80100a14:	56                   	push   %esi
80100a15:	53                   	push   %ebx
80100a16:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
80100a1c:	e8 cf 2d 00 00       	call   801037f0 <myproc>
80100a21:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a27:	e8 84 21 00 00       	call   80102bb0 <begin_op>
80100a2c:	83 ec 0c             	sub    $0xc,%esp
80100a2f:	ff 75 08             	pushl  0x8(%ebp)
80100a32:	e8 b9 14 00 00       	call   80101ef0 <namei>
80100a37:	83 c4 10             	add    $0x10,%esp
80100a3a:	85 c0                	test   %eax,%eax
80100a3c:	0f 84 91 01 00 00    	je     80100bd3 <exec+0x1c3>
80100a42:	83 ec 0c             	sub    $0xc,%esp
80100a45:	89 c3                	mov    %eax,%ebx
80100a47:	50                   	push   %eax
80100a48:	e8 43 0c 00 00       	call   80101690 <ilock>
80100a4d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a53:	6a 34                	push   $0x34
80100a55:	6a 00                	push   $0x0
80100a57:	50                   	push   %eax
80100a58:	53                   	push   %ebx
80100a59:	e8 12 0f 00 00       	call   80101970 <readi>
80100a5e:	83 c4 20             	add    $0x20,%esp
80100a61:	83 f8 34             	cmp    $0x34,%eax
80100a64:	74 22                	je     80100a88 <exec+0x78>
80100a66:	83 ec 0c             	sub    $0xc,%esp
80100a69:	53                   	push   %ebx
80100a6a:	e8 b1 0e 00 00       	call   80101920 <iunlockput>
80100a6f:	e8 ac 21 00 00       	call   80102c20 <end_op>
80100a74:	83 c4 10             	add    $0x10,%esp
80100a77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a7f:	5b                   	pop    %ebx
80100a80:	5e                   	pop    %esi
80100a81:	5f                   	pop    %edi
80100a82:	5d                   	pop    %ebp
80100a83:	c3                   	ret    
80100a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100a88:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a8f:	45 4c 46 
80100a92:	75 d2                	jne    80100a66 <exec+0x56>
80100a94:	e8 47 63 00 00       	call   80106de0 <setupkvm>
80100a99:	85 c0                	test   %eax,%eax
80100a9b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100aa1:	74 c3                	je     80100a66 <exec+0x56>
80100aa3:	31 ff                	xor    %edi,%edi
80100aa5:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aac:	00 
80100aad:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
80100ab3:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100ab9:	0f 84 93 02 00 00    	je     80100d52 <exec+0x342>
80100abf:	31 f6                	xor    %esi,%esi
80100ac1:	eb 7f                	jmp    80100b42 <exec+0x132>
80100ac3:	90                   	nop
80100ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ac8:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100acf:	75 63                	jne    80100b34 <exec+0x124>
80100ad1:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ad7:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100add:	0f 82 86 00 00 00    	jb     80100b69 <exec+0x159>
80100ae3:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ae9:	72 7e                	jb     80100b69 <exec+0x159>
80100aeb:	83 ec 04             	sub    $0x4,%esp
80100aee:	50                   	push   %eax
80100aef:	57                   	push   %edi
80100af0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af6:	e8 05 61 00 00       	call   80106c00 <allocuvm>
80100afb:	83 c4 10             	add    $0x10,%esp
80100afe:	85 c0                	test   %eax,%eax
80100b00:	89 c7                	mov    %eax,%edi
80100b02:	74 65                	je     80100b69 <exec+0x159>
80100b04:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b0a:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b0f:	75 58                	jne    80100b69 <exec+0x159>
80100b11:	83 ec 0c             	sub    $0xc,%esp
80100b14:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b1a:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b20:	53                   	push   %ebx
80100b21:	50                   	push   %eax
80100b22:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b28:	e8 13 60 00 00       	call   80106b40 <loaduvm>
80100b2d:	83 c4 20             	add    $0x20,%esp
80100b30:	85 c0                	test   %eax,%eax
80100b32:	78 35                	js     80100b69 <exec+0x159>
80100b34:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100b3b:	83 c6 01             	add    $0x1,%esi
80100b3e:	39 f0                	cmp    %esi,%eax
80100b40:	7e 3d                	jle    80100b7f <exec+0x16f>
80100b42:	89 f0                	mov    %esi,%eax
80100b44:	6a 20                	push   $0x20
80100b46:	c1 e0 05             	shl    $0x5,%eax
80100b49:	03 85 ec fe ff ff    	add    -0x114(%ebp),%eax
80100b4f:	50                   	push   %eax
80100b50:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100b56:	50                   	push   %eax
80100b57:	53                   	push   %ebx
80100b58:	e8 13 0e 00 00       	call   80101970 <readi>
80100b5d:	83 c4 10             	add    $0x10,%esp
80100b60:	83 f8 20             	cmp    $0x20,%eax
80100b63:	0f 84 5f ff ff ff    	je     80100ac8 <exec+0xb8>
80100b69:	83 ec 0c             	sub    $0xc,%esp
80100b6c:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b72:	e8 e9 61 00 00       	call   80106d60 <freevm>
80100b77:	83 c4 10             	add    $0x10,%esp
80100b7a:	e9 e7 fe ff ff       	jmp    80100a66 <exec+0x56>
80100b7f:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100b85:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100b8b:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
80100b91:	83 ec 0c             	sub    $0xc,%esp
80100b94:	53                   	push   %ebx
80100b95:	e8 86 0d 00 00       	call   80101920 <iunlockput>
80100b9a:	e8 81 20 00 00       	call   80102c20 <end_op>
80100b9f:	83 c4 0c             	add    $0xc,%esp
80100ba2:	56                   	push   %esi
80100ba3:	57                   	push   %edi
80100ba4:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100baa:	e8 51 60 00 00       	call   80106c00 <allocuvm>
80100baf:	83 c4 10             	add    $0x10,%esp
80100bb2:	85 c0                	test   %eax,%eax
80100bb4:	89 c6                	mov    %eax,%esi
80100bb6:	75 3a                	jne    80100bf2 <exec+0x1e2>
80100bb8:	83 ec 0c             	sub    $0xc,%esp
80100bbb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bc1:	e8 9a 61 00 00       	call   80106d60 <freevm>
80100bc6:	83 c4 10             	add    $0x10,%esp
80100bc9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bce:	e9 a9 fe ff ff       	jmp    80100a7c <exec+0x6c>
80100bd3:	e8 48 20 00 00       	call   80102c20 <end_op>
80100bd8:	83 ec 0c             	sub    $0xc,%esp
80100bdb:	68 01 71 10 80       	push   $0x80107101
80100be0:	e8 7b fa ff ff       	call   80100660 <cprintf>
80100be5:	83 c4 10             	add    $0x10,%esp
80100be8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bed:	e9 8a fe ff ff       	jmp    80100a7c <exec+0x6c>
80100bf2:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bf8:	83 ec 08             	sub    $0x8,%esp
80100bfb:	31 ff                	xor    %edi,%edi
80100bfd:	89 f3                	mov    %esi,%ebx
80100bff:	50                   	push   %eax
80100c00:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c06:	e8 75 62 00 00       	call   80106e80 <clearpteu>
80100c0b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c0e:	83 c4 10             	add    $0x10,%esp
80100c11:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c17:	8b 00                	mov    (%eax),%eax
80100c19:	85 c0                	test   %eax,%eax
80100c1b:	74 70                	je     80100c8d <exec+0x27d>
80100c1d:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c23:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c29:	eb 0a                	jmp    80100c35 <exec+0x225>
80100c2b:	90                   	nop
80100c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100c30:	83 ff 20             	cmp    $0x20,%edi
80100c33:	74 83                	je     80100bb8 <exec+0x1a8>
80100c35:	83 ec 0c             	sub    $0xc,%esp
80100c38:	50                   	push   %eax
80100c39:	e8 82 3b 00 00       	call   801047c0 <strlen>
80100c3e:	f7 d0                	not    %eax
80100c40:	01 c3                	add    %eax,%ebx
80100c42:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c45:	5a                   	pop    %edx
80100c46:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c49:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4c:	e8 6f 3b 00 00       	call   801047c0 <strlen>
80100c51:	83 c0 01             	add    $0x1,%eax
80100c54:	50                   	push   %eax
80100c55:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c58:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c5b:	53                   	push   %ebx
80100c5c:	56                   	push   %esi
80100c5d:	e8 6e 63 00 00       	call   80106fd0 <copyout>
80100c62:	83 c4 20             	add    $0x20,%esp
80100c65:	85 c0                	test   %eax,%eax
80100c67:	0f 88 4b ff ff ff    	js     80100bb8 <exec+0x1a8>
80100c6d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c70:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100c77:	83 c7 01             	add    $0x1,%edi
80100c7a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c80:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c83:	85 c0                	test   %eax,%eax
80100c85:	75 a9                	jne    80100c30 <exec+0x220>
80100c87:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100c8d:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c94:	89 d9                	mov    %ebx,%ecx
80100c96:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c9d:	00 00 00 00 
80100ca1:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100ca8:	ff ff ff 
80100cab:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100cb1:	29 c1                	sub    %eax,%ecx
80100cb3:	83 c0 0c             	add    $0xc,%eax
80100cb6:	29 c3                	sub    %eax,%ebx
80100cb8:	50                   	push   %eax
80100cb9:	52                   	push   %edx
80100cba:	53                   	push   %ebx
80100cbb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100cc1:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100cc7:	e8 04 63 00 00       	call   80106fd0 <copyout>
80100ccc:	83 c4 10             	add    $0x10,%esp
80100ccf:	85 c0                	test   %eax,%eax
80100cd1:	0f 88 e1 fe ff ff    	js     80100bb8 <exec+0x1a8>
80100cd7:	8b 45 08             	mov    0x8(%ebp),%eax
80100cda:	0f b6 00             	movzbl (%eax),%eax
80100cdd:	84 c0                	test   %al,%al
80100cdf:	74 17                	je     80100cf8 <exec+0x2e8>
80100ce1:	8b 55 08             	mov    0x8(%ebp),%edx
80100ce4:	89 d1                	mov    %edx,%ecx
80100ce6:	83 c1 01             	add    $0x1,%ecx
80100ce9:	3c 2f                	cmp    $0x2f,%al
80100ceb:	0f b6 01             	movzbl (%ecx),%eax
80100cee:	0f 44 d1             	cmove  %ecx,%edx
80100cf1:	84 c0                	test   %al,%al
80100cf3:	75 f1                	jne    80100ce6 <exec+0x2d6>
80100cf5:	89 55 08             	mov    %edx,0x8(%ebp)
80100cf8:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cfe:	50                   	push   %eax
80100cff:	6a 10                	push   $0x10
80100d01:	ff 75 08             	pushl  0x8(%ebp)
80100d04:	89 f8                	mov    %edi,%eax
80100d06:	83 c0 6c             	add    $0x6c,%eax
80100d09:	50                   	push   %eax
80100d0a:	e8 71 3a 00 00       	call   80104780 <safestrcpy>
80100d0f:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
80100d15:	89 f9                	mov    %edi,%ecx
80100d17:	8b 7f 04             	mov    0x4(%edi),%edi
80100d1a:	8b 41 18             	mov    0x18(%ecx),%eax
80100d1d:	89 31                	mov    %esi,(%ecx)
80100d1f:	89 51 04             	mov    %edx,0x4(%ecx)
80100d22:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d28:	89 50 38             	mov    %edx,0x38(%eax)
80100d2b:	8b 41 18             	mov    0x18(%ecx),%eax
80100d2e:	89 58 44             	mov    %ebx,0x44(%eax)
80100d31:	c7 41 7c 3c 00 00 00 	movl   $0x3c,0x7c(%ecx)
80100d38:	89 0c 24             	mov    %ecx,(%esp)
80100d3b:	e8 70 5c 00 00       	call   801069b0 <switchuvm>
80100d40:	89 3c 24             	mov    %edi,(%esp)
80100d43:	e8 18 60 00 00       	call   80106d60 <freevm>
80100d48:	83 c4 10             	add    $0x10,%esp
80100d4b:	31 c0                	xor    %eax,%eax
80100d4d:	e9 2a fd ff ff       	jmp    80100a7c <exec+0x6c>
80100d52:	be 00 20 00 00       	mov    $0x2000,%esi
80100d57:	e9 35 fe ff ff       	jmp    80100b91 <exec+0x181>
80100d5c:	66 90                	xchg   %ax,%ax
80100d5e:	66 90                	xchg   %ax,%ax

80100d60 <fileinit>:
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	83 ec 10             	sub    $0x10,%esp
80100d66:	68 0d 71 10 80       	push   $0x8010710d
80100d6b:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d70:	e8 bb 35 00 00       	call   80104330 <initlock>
80100d75:	83 c4 10             	add    $0x10,%esp
80100d78:	c9                   	leave  
80100d79:	c3                   	ret    
80100d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d80 <filealloc>:
80100d80:	55                   	push   %ebp
80100d81:	89 e5                	mov    %esp,%ebp
80100d83:	53                   	push   %ebx
80100d84:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
80100d89:	83 ec 10             	sub    $0x10,%esp
80100d8c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d91:	e8 8a 36 00 00       	call   80104420 <acquire>
80100d96:	83 c4 10             	add    $0x10,%esp
80100d99:	eb 10                	jmp    80100dab <filealloc+0x2b>
80100d9b:	90                   	nop
80100d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100da0:	83 c3 18             	add    $0x18,%ebx
80100da3:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100da9:	73 25                	jae    80100dd0 <filealloc+0x50>
80100dab:	8b 43 04             	mov    0x4(%ebx),%eax
80100dae:	85 c0                	test   %eax,%eax
80100db0:	75 ee                	jne    80100da0 <filealloc+0x20>
80100db2:	83 ec 0c             	sub    $0xc,%esp
80100db5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100dbc:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dc1:	e8 7a 37 00 00       	call   80104540 <release>
80100dc6:	89 d8                	mov    %ebx,%eax
80100dc8:	83 c4 10             	add    $0x10,%esp
80100dcb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dce:	c9                   	leave  
80100dcf:	c3                   	ret    
80100dd0:	83 ec 0c             	sub    $0xc,%esp
80100dd3:	31 db                	xor    %ebx,%ebx
80100dd5:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dda:	e8 61 37 00 00       	call   80104540 <release>
80100ddf:	89 d8                	mov    %ebx,%eax
80100de1:	83 c4 10             	add    $0x10,%esp
80100de4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100de7:	c9                   	leave  
80100de8:	c3                   	ret    
80100de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100df0 <filedup>:
80100df0:	55                   	push   %ebp
80100df1:	89 e5                	mov    %esp,%ebp
80100df3:	53                   	push   %ebx
80100df4:	83 ec 10             	sub    $0x10,%esp
80100df7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dfa:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dff:	e8 1c 36 00 00       	call   80104420 <acquire>
80100e04:	8b 43 04             	mov    0x4(%ebx),%eax
80100e07:	83 c4 10             	add    $0x10,%esp
80100e0a:	85 c0                	test   %eax,%eax
80100e0c:	7e 1a                	jle    80100e28 <filedup+0x38>
80100e0e:	83 c0 01             	add    $0x1,%eax
80100e11:	83 ec 0c             	sub    $0xc,%esp
80100e14:	89 43 04             	mov    %eax,0x4(%ebx)
80100e17:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e1c:	e8 1f 37 00 00       	call   80104540 <release>
80100e21:	89 d8                	mov    %ebx,%eax
80100e23:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e26:	c9                   	leave  
80100e27:	c3                   	ret    
80100e28:	83 ec 0c             	sub    $0xc,%esp
80100e2b:	68 14 71 10 80       	push   $0x80107114
80100e30:	e8 5b f5 ff ff       	call   80100390 <panic>
80100e35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e40 <fileclose>:
80100e40:	55                   	push   %ebp
80100e41:	89 e5                	mov    %esp,%ebp
80100e43:	57                   	push   %edi
80100e44:	56                   	push   %esi
80100e45:	53                   	push   %ebx
80100e46:	83 ec 28             	sub    $0x28,%esp
80100e49:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e4c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e51:	e8 ca 35 00 00       	call   80104420 <acquire>
80100e56:	8b 43 04             	mov    0x4(%ebx),%eax
80100e59:	83 c4 10             	add    $0x10,%esp
80100e5c:	85 c0                	test   %eax,%eax
80100e5e:	0f 8e 9b 00 00 00    	jle    80100eff <fileclose+0xbf>
80100e64:	83 e8 01             	sub    $0x1,%eax
80100e67:	85 c0                	test   %eax,%eax
80100e69:	89 43 04             	mov    %eax,0x4(%ebx)
80100e6c:	74 1a                	je     80100e88 <fileclose+0x48>
80100e6e:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
80100e75:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e78:	5b                   	pop    %ebx
80100e79:	5e                   	pop    %esi
80100e7a:	5f                   	pop    %edi
80100e7b:	5d                   	pop    %ebp
80100e7c:	e9 bf 36 00 00       	jmp    80104540 <release>
80100e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e88:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100e8c:	8b 3b                	mov    (%ebx),%edi
80100e8e:	83 ec 0c             	sub    $0xc,%esp
80100e91:	8b 73 0c             	mov    0xc(%ebx),%esi
80100e94:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100e9a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e9d:	8b 43 10             	mov    0x10(%ebx),%eax
80100ea0:	68 c0 ff 10 80       	push   $0x8010ffc0
80100ea5:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100ea8:	e8 93 36 00 00       	call   80104540 <release>
80100ead:	83 c4 10             	add    $0x10,%esp
80100eb0:	83 ff 01             	cmp    $0x1,%edi
80100eb3:	74 13                	je     80100ec8 <fileclose+0x88>
80100eb5:	83 ff 02             	cmp    $0x2,%edi
80100eb8:	74 26                	je     80100ee0 <fileclose+0xa0>
80100eba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ebd:	5b                   	pop    %ebx
80100ebe:	5e                   	pop    %esi
80100ebf:	5f                   	pop    %edi
80100ec0:	5d                   	pop    %ebp
80100ec1:	c3                   	ret    
80100ec2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100ec8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ecc:	83 ec 08             	sub    $0x8,%esp
80100ecf:	53                   	push   %ebx
80100ed0:	56                   	push   %esi
80100ed1:	e8 8a 24 00 00       	call   80103360 <pipeclose>
80100ed6:	83 c4 10             	add    $0x10,%esp
80100ed9:	eb df                	jmp    80100eba <fileclose+0x7a>
80100edb:	90                   	nop
80100edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ee0:	e8 cb 1c 00 00       	call   80102bb0 <begin_op>
80100ee5:	83 ec 0c             	sub    $0xc,%esp
80100ee8:	ff 75 e0             	pushl  -0x20(%ebp)
80100eeb:	e8 d0 08 00 00       	call   801017c0 <iput>
80100ef0:	83 c4 10             	add    $0x10,%esp
80100ef3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ef6:	5b                   	pop    %ebx
80100ef7:	5e                   	pop    %esi
80100ef8:	5f                   	pop    %edi
80100ef9:	5d                   	pop    %ebp
80100efa:	e9 21 1d 00 00       	jmp    80102c20 <end_op>
80100eff:	83 ec 0c             	sub    $0xc,%esp
80100f02:	68 1c 71 10 80       	push   $0x8010711c
80100f07:	e8 84 f4 ff ff       	call   80100390 <panic>
80100f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f10 <filestat>:
80100f10:	55                   	push   %ebp
80100f11:	89 e5                	mov    %esp,%ebp
80100f13:	53                   	push   %ebx
80100f14:	83 ec 04             	sub    $0x4,%esp
80100f17:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f1a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f1d:	75 31                	jne    80100f50 <filestat+0x40>
80100f1f:	83 ec 0c             	sub    $0xc,%esp
80100f22:	ff 73 10             	pushl  0x10(%ebx)
80100f25:	e8 66 07 00 00       	call   80101690 <ilock>
80100f2a:	58                   	pop    %eax
80100f2b:	5a                   	pop    %edx
80100f2c:	ff 75 0c             	pushl  0xc(%ebp)
80100f2f:	ff 73 10             	pushl  0x10(%ebx)
80100f32:	e8 09 0a 00 00       	call   80101940 <stati>
80100f37:	59                   	pop    %ecx
80100f38:	ff 73 10             	pushl  0x10(%ebx)
80100f3b:	e8 30 08 00 00       	call   80101770 <iunlock>
80100f40:	83 c4 10             	add    $0x10,%esp
80100f43:	31 c0                	xor    %eax,%eax
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f55:	eb ee                	jmp    80100f45 <filestat+0x35>
80100f57:	89 f6                	mov    %esi,%esi
80100f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100f60 <fileread>:
80100f60:	55                   	push   %ebp
80100f61:	89 e5                	mov    %esp,%ebp
80100f63:	57                   	push   %edi
80100f64:	56                   	push   %esi
80100f65:	53                   	push   %ebx
80100f66:	83 ec 0c             	sub    $0xc,%esp
80100f69:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f6c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f6f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f72:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f76:	74 60                	je     80100fd8 <fileread+0x78>
80100f78:	8b 03                	mov    (%ebx),%eax
80100f7a:	83 f8 01             	cmp    $0x1,%eax
80100f7d:	74 41                	je     80100fc0 <fileread+0x60>
80100f7f:	83 f8 02             	cmp    $0x2,%eax
80100f82:	75 5b                	jne    80100fdf <fileread+0x7f>
80100f84:	83 ec 0c             	sub    $0xc,%esp
80100f87:	ff 73 10             	pushl  0x10(%ebx)
80100f8a:	e8 01 07 00 00       	call   80101690 <ilock>
80100f8f:	57                   	push   %edi
80100f90:	ff 73 14             	pushl  0x14(%ebx)
80100f93:	56                   	push   %esi
80100f94:	ff 73 10             	pushl  0x10(%ebx)
80100f97:	e8 d4 09 00 00       	call   80101970 <readi>
80100f9c:	83 c4 20             	add    $0x20,%esp
80100f9f:	85 c0                	test   %eax,%eax
80100fa1:	89 c6                	mov    %eax,%esi
80100fa3:	7e 03                	jle    80100fa8 <fileread+0x48>
80100fa5:	01 43 14             	add    %eax,0x14(%ebx)
80100fa8:	83 ec 0c             	sub    $0xc,%esp
80100fab:	ff 73 10             	pushl  0x10(%ebx)
80100fae:	e8 bd 07 00 00       	call   80101770 <iunlock>
80100fb3:	83 c4 10             	add    $0x10,%esp
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	89 f0                	mov    %esi,%eax
80100fbb:	5b                   	pop    %ebx
80100fbc:	5e                   	pop    %esi
80100fbd:	5f                   	pop    %edi
80100fbe:	5d                   	pop    %ebp
80100fbf:	c3                   	ret    
80100fc0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fc3:	89 45 08             	mov    %eax,0x8(%ebp)
80100fc6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fc9:	5b                   	pop    %ebx
80100fca:	5e                   	pop    %esi
80100fcb:	5f                   	pop    %edi
80100fcc:	5d                   	pop    %ebp
80100fcd:	e9 3e 25 00 00       	jmp    80103510 <piperead>
80100fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fd8:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100fdd:	eb d7                	jmp    80100fb6 <fileread+0x56>
80100fdf:	83 ec 0c             	sub    $0xc,%esp
80100fe2:	68 26 71 10 80       	push   $0x80107126
80100fe7:	e8 a4 f3 ff ff       	call   80100390 <panic>
80100fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ff0 <filewrite>:
80100ff0:	55                   	push   %ebp
80100ff1:	89 e5                	mov    %esp,%ebp
80100ff3:	57                   	push   %edi
80100ff4:	56                   	push   %esi
80100ff5:	53                   	push   %ebx
80100ff6:	83 ec 1c             	sub    $0x1c,%esp
80100ff9:	8b 75 08             	mov    0x8(%ebp),%esi
80100ffc:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fff:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80101003:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101006:	8b 45 10             	mov    0x10(%ebp),%eax
80101009:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010100c:	0f 84 aa 00 00 00    	je     801010bc <filewrite+0xcc>
80101012:	8b 06                	mov    (%esi),%eax
80101014:	83 f8 01             	cmp    $0x1,%eax
80101017:	0f 84 c3 00 00 00    	je     801010e0 <filewrite+0xf0>
8010101d:	83 f8 02             	cmp    $0x2,%eax
80101020:	0f 85 d9 00 00 00    	jne    801010ff <filewrite+0x10f>
80101026:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101029:	31 ff                	xor    %edi,%edi
8010102b:	85 c0                	test   %eax,%eax
8010102d:	7f 34                	jg     80101063 <filewrite+0x73>
8010102f:	e9 9c 00 00 00       	jmp    801010d0 <filewrite+0xe0>
80101034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101038:	01 46 14             	add    %eax,0x14(%esi)
8010103b:	83 ec 0c             	sub    $0xc,%esp
8010103e:	ff 76 10             	pushl  0x10(%esi)
80101041:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101044:	e8 27 07 00 00       	call   80101770 <iunlock>
80101049:	e8 d2 1b 00 00       	call   80102c20 <end_op>
8010104e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101051:	83 c4 10             	add    $0x10,%esp
80101054:	39 c3                	cmp    %eax,%ebx
80101056:	0f 85 96 00 00 00    	jne    801010f2 <filewrite+0x102>
8010105c:	01 df                	add    %ebx,%edi
8010105e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101061:	7e 6d                	jle    801010d0 <filewrite+0xe0>
80101063:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101066:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010106b:	29 fb                	sub    %edi,%ebx
8010106d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101073:	0f 4f d8             	cmovg  %eax,%ebx
80101076:	e8 35 1b 00 00       	call   80102bb0 <begin_op>
8010107b:	83 ec 0c             	sub    $0xc,%esp
8010107e:	ff 76 10             	pushl  0x10(%esi)
80101081:	e8 0a 06 00 00       	call   80101690 <ilock>
80101086:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101089:	53                   	push   %ebx
8010108a:	ff 76 14             	pushl  0x14(%esi)
8010108d:	01 f8                	add    %edi,%eax
8010108f:	50                   	push   %eax
80101090:	ff 76 10             	pushl  0x10(%esi)
80101093:	e8 d8 09 00 00       	call   80101a70 <writei>
80101098:	83 c4 20             	add    $0x20,%esp
8010109b:	85 c0                	test   %eax,%eax
8010109d:	7f 99                	jg     80101038 <filewrite+0x48>
8010109f:	83 ec 0c             	sub    $0xc,%esp
801010a2:	ff 76 10             	pushl  0x10(%esi)
801010a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010a8:	e8 c3 06 00 00       	call   80101770 <iunlock>
801010ad:	e8 6e 1b 00 00       	call   80102c20 <end_op>
801010b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010b5:	83 c4 10             	add    $0x10,%esp
801010b8:	85 c0                	test   %eax,%eax
801010ba:	74 98                	je     80101054 <filewrite+0x64>
801010bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010bf:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801010c4:	89 f8                	mov    %edi,%eax
801010c6:	5b                   	pop    %ebx
801010c7:	5e                   	pop    %esi
801010c8:	5f                   	pop    %edi
801010c9:	5d                   	pop    %ebp
801010ca:	c3                   	ret    
801010cb:	90                   	nop
801010cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801010d0:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801010d3:	75 e7                	jne    801010bc <filewrite+0xcc>
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	89 f8                	mov    %edi,%eax
801010da:	5b                   	pop    %ebx
801010db:	5e                   	pop    %esi
801010dc:	5f                   	pop    %edi
801010dd:	5d                   	pop    %ebp
801010de:	c3                   	ret    
801010df:	90                   	nop
801010e0:	8b 46 0c             	mov    0xc(%esi),%eax
801010e3:	89 45 08             	mov    %eax,0x8(%ebp)
801010e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010e9:	5b                   	pop    %ebx
801010ea:	5e                   	pop    %esi
801010eb:	5f                   	pop    %edi
801010ec:	5d                   	pop    %ebp
801010ed:	e9 0e 23 00 00       	jmp    80103400 <pipewrite>
801010f2:	83 ec 0c             	sub    $0xc,%esp
801010f5:	68 2f 71 10 80       	push   $0x8010712f
801010fa:	e8 91 f2 ff ff       	call   80100390 <panic>
801010ff:	83 ec 0c             	sub    $0xc,%esp
80101102:	68 35 71 10 80       	push   $0x80107135
80101107:	e8 84 f2 ff ff       	call   80100390 <panic>
8010110c:	66 90                	xchg   %ax,%ax
8010110e:	66 90                	xchg   %ax,%ax

80101110 <balloc>:
80101110:	55                   	push   %ebp
80101111:	89 e5                	mov    %esp,%ebp
80101113:	57                   	push   %edi
80101114:	56                   	push   %esi
80101115:	53                   	push   %ebx
80101116:	83 ec 1c             	sub    $0x1c,%esp
80101119:	8b 0d c0 09 11 80    	mov    0x801109c0,%ecx
8010111f:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101122:	85 c9                	test   %ecx,%ecx
80101124:	0f 84 87 00 00 00    	je     801011b1 <balloc+0xa1>
8010112a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101131:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101134:	83 ec 08             	sub    $0x8,%esp
80101137:	89 f0                	mov    %esi,%eax
80101139:	c1 f8 0c             	sar    $0xc,%eax
8010113c:	03 05 d8 09 11 80    	add    0x801109d8,%eax
80101142:	50                   	push   %eax
80101143:	ff 75 d8             	pushl  -0x28(%ebp)
80101146:	e8 85 ef ff ff       	call   801000d0 <bread>
8010114b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010114e:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101153:	83 c4 10             	add    $0x10,%esp
80101156:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101159:	31 c0                	xor    %eax,%eax
8010115b:	eb 2f                	jmp    8010118c <balloc+0x7c>
8010115d:	8d 76 00             	lea    0x0(%esi),%esi
80101160:	89 c1                	mov    %eax,%ecx
80101162:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101165:	bb 01 00 00 00       	mov    $0x1,%ebx
8010116a:	83 e1 07             	and    $0x7,%ecx
8010116d:	d3 e3                	shl    %cl,%ebx
8010116f:	89 c1                	mov    %eax,%ecx
80101171:	c1 f9 03             	sar    $0x3,%ecx
80101174:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101179:	85 df                	test   %ebx,%edi
8010117b:	89 fa                	mov    %edi,%edx
8010117d:	74 41                	je     801011c0 <balloc+0xb0>
8010117f:	83 c0 01             	add    $0x1,%eax
80101182:	83 c6 01             	add    $0x1,%esi
80101185:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010118a:	74 05                	je     80101191 <balloc+0x81>
8010118c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
8010118f:	77 cf                	ja     80101160 <balloc+0x50>
80101191:	83 ec 0c             	sub    $0xc,%esp
80101194:	ff 75 e4             	pushl  -0x1c(%ebp)
80101197:	e8 44 f0 ff ff       	call   801001e0 <brelse>
8010119c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801011a3:	83 c4 10             	add    $0x10,%esp
801011a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801011a9:	39 05 c0 09 11 80    	cmp    %eax,0x801109c0
801011af:	77 80                	ja     80101131 <balloc+0x21>
801011b1:	83 ec 0c             	sub    $0xc,%esp
801011b4:	68 3f 71 10 80       	push   $0x8010713f
801011b9:	e8 d2 f1 ff ff       	call   80100390 <panic>
801011be:	66 90                	xchg   %ax,%ax
801011c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801011c3:	83 ec 0c             	sub    $0xc,%esp
801011c6:	09 da                	or     %ebx,%edx
801011c8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
801011cc:	57                   	push   %edi
801011cd:	e8 ae 1b 00 00       	call   80102d80 <log_write>
801011d2:	89 3c 24             	mov    %edi,(%esp)
801011d5:	e8 06 f0 ff ff       	call   801001e0 <brelse>
801011da:	58                   	pop    %eax
801011db:	5a                   	pop    %edx
801011dc:	56                   	push   %esi
801011dd:	ff 75 d8             	pushl  -0x28(%ebp)
801011e0:	e8 eb ee ff ff       	call   801000d0 <bread>
801011e5:	89 c3                	mov    %eax,%ebx
801011e7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ea:	83 c4 0c             	add    $0xc,%esp
801011ed:	68 00 02 00 00       	push   $0x200
801011f2:	6a 00                	push   $0x0
801011f4:	50                   	push   %eax
801011f5:	e8 a6 33 00 00       	call   801045a0 <memset>
801011fa:	89 1c 24             	mov    %ebx,(%esp)
801011fd:	e8 7e 1b 00 00       	call   80102d80 <log_write>
80101202:	89 1c 24             	mov    %ebx,(%esp)
80101205:	e8 d6 ef ff ff       	call   801001e0 <brelse>
8010120a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010120d:	89 f0                	mov    %esi,%eax
8010120f:	5b                   	pop    %ebx
80101210:	5e                   	pop    %esi
80101211:	5f                   	pop    %edi
80101212:	5d                   	pop    %ebp
80101213:	c3                   	ret    
80101214:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010121a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101220 <iget>:
80101220:	55                   	push   %ebp
80101221:	89 e5                	mov    %esp,%ebp
80101223:	57                   	push   %edi
80101224:	56                   	push   %esi
80101225:	53                   	push   %ebx
80101226:	89 c7                	mov    %eax,%edi
80101228:	31 f6                	xor    %esi,%esi
8010122a:	bb 14 0a 11 80       	mov    $0x80110a14,%ebx
8010122f:	83 ec 28             	sub    $0x28,%esp
80101232:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101235:	68 e0 09 11 80       	push   $0x801109e0
8010123a:	e8 e1 31 00 00       	call   80104420 <acquire>
8010123f:	83 c4 10             	add    $0x10,%esp
80101242:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101245:	eb 17                	jmp    8010125e <iget+0x3e>
80101247:	89 f6                	mov    %esi,%esi
80101249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101250:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101256:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
8010125c:	73 22                	jae    80101280 <iget+0x60>
8010125e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101261:	85 c9                	test   %ecx,%ecx
80101263:	7e 04                	jle    80101269 <iget+0x49>
80101265:	39 3b                	cmp    %edi,(%ebx)
80101267:	74 4f                	je     801012b8 <iget+0x98>
80101269:	85 f6                	test   %esi,%esi
8010126b:	75 e3                	jne    80101250 <iget+0x30>
8010126d:	85 c9                	test   %ecx,%ecx
8010126f:	0f 44 f3             	cmove  %ebx,%esi
80101272:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101278:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
8010127e:	72 de                	jb     8010125e <iget+0x3e>
80101280:	85 f6                	test   %esi,%esi
80101282:	74 5b                	je     801012df <iget+0xbf>
80101284:	83 ec 0c             	sub    $0xc,%esp
80101287:	89 3e                	mov    %edi,(%esi)
80101289:	89 56 04             	mov    %edx,0x4(%esi)
8010128c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101293:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010129a:	68 e0 09 11 80       	push   $0x801109e0
8010129f:	e8 9c 32 00 00       	call   80104540 <release>
801012a4:	83 c4 10             	add    $0x10,%esp
801012a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012aa:	89 f0                	mov    %esi,%eax
801012ac:	5b                   	pop    %ebx
801012ad:	5e                   	pop    %esi
801012ae:	5f                   	pop    %edi
801012af:	5d                   	pop    %ebp
801012b0:	c3                   	ret    
801012b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801012b8:	39 53 04             	cmp    %edx,0x4(%ebx)
801012bb:	75 ac                	jne    80101269 <iget+0x49>
801012bd:	83 ec 0c             	sub    $0xc,%esp
801012c0:	83 c1 01             	add    $0x1,%ecx
801012c3:	89 de                	mov    %ebx,%esi
801012c5:	68 e0 09 11 80       	push   $0x801109e0
801012ca:	89 4b 08             	mov    %ecx,0x8(%ebx)
801012cd:	e8 6e 32 00 00       	call   80104540 <release>
801012d2:	83 c4 10             	add    $0x10,%esp
801012d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012d8:	89 f0                	mov    %esi,%eax
801012da:	5b                   	pop    %ebx
801012db:	5e                   	pop    %esi
801012dc:	5f                   	pop    %edi
801012dd:	5d                   	pop    %ebp
801012de:	c3                   	ret    
801012df:	83 ec 0c             	sub    $0xc,%esp
801012e2:	68 55 71 10 80       	push   $0x80107155
801012e7:	e8 a4 f0 ff ff       	call   80100390 <panic>
801012ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801012f0 <bmap>:
801012f0:	55                   	push   %ebp
801012f1:	89 e5                	mov    %esp,%ebp
801012f3:	57                   	push   %edi
801012f4:	56                   	push   %esi
801012f5:	53                   	push   %ebx
801012f6:	89 c6                	mov    %eax,%esi
801012f8:	83 ec 1c             	sub    $0x1c,%esp
801012fb:	83 fa 0b             	cmp    $0xb,%edx
801012fe:	77 18                	ja     80101318 <bmap+0x28>
80101300:	8d 3c 90             	lea    (%eax,%edx,4),%edi
80101303:	8b 5f 5c             	mov    0x5c(%edi),%ebx
80101306:	85 db                	test   %ebx,%ebx
80101308:	74 76                	je     80101380 <bmap+0x90>
8010130a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010130d:	89 d8                	mov    %ebx,%eax
8010130f:	5b                   	pop    %ebx
80101310:	5e                   	pop    %esi
80101311:	5f                   	pop    %edi
80101312:	5d                   	pop    %ebp
80101313:	c3                   	ret    
80101314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101318:	8d 5a f4             	lea    -0xc(%edx),%ebx
8010131b:	83 fb 7f             	cmp    $0x7f,%ebx
8010131e:	0f 87 90 00 00 00    	ja     801013b4 <bmap+0xc4>
80101324:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
8010132a:	8b 00                	mov    (%eax),%eax
8010132c:	85 d2                	test   %edx,%edx
8010132e:	74 70                	je     801013a0 <bmap+0xb0>
80101330:	83 ec 08             	sub    $0x8,%esp
80101333:	52                   	push   %edx
80101334:	50                   	push   %eax
80101335:	e8 96 ed ff ff       	call   801000d0 <bread>
8010133a:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010133e:	83 c4 10             	add    $0x10,%esp
80101341:	89 c7                	mov    %eax,%edi
80101343:	8b 1a                	mov    (%edx),%ebx
80101345:	85 db                	test   %ebx,%ebx
80101347:	75 1d                	jne    80101366 <bmap+0x76>
80101349:	8b 06                	mov    (%esi),%eax
8010134b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010134e:	e8 bd fd ff ff       	call   80101110 <balloc>
80101353:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101356:	83 ec 0c             	sub    $0xc,%esp
80101359:	89 c3                	mov    %eax,%ebx
8010135b:	89 02                	mov    %eax,(%edx)
8010135d:	57                   	push   %edi
8010135e:	e8 1d 1a 00 00       	call   80102d80 <log_write>
80101363:	83 c4 10             	add    $0x10,%esp
80101366:	83 ec 0c             	sub    $0xc,%esp
80101369:	57                   	push   %edi
8010136a:	e8 71 ee ff ff       	call   801001e0 <brelse>
8010136f:	83 c4 10             	add    $0x10,%esp
80101372:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101375:	89 d8                	mov    %ebx,%eax
80101377:	5b                   	pop    %ebx
80101378:	5e                   	pop    %esi
80101379:	5f                   	pop    %edi
8010137a:	5d                   	pop    %ebp
8010137b:	c3                   	ret    
8010137c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101380:	8b 00                	mov    (%eax),%eax
80101382:	e8 89 fd ff ff       	call   80101110 <balloc>
80101387:	89 47 5c             	mov    %eax,0x5c(%edi)
8010138a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010138d:	89 c3                	mov    %eax,%ebx
8010138f:	89 d8                	mov    %ebx,%eax
80101391:	5b                   	pop    %ebx
80101392:	5e                   	pop    %esi
80101393:	5f                   	pop    %edi
80101394:	5d                   	pop    %ebp
80101395:	c3                   	ret    
80101396:	8d 76 00             	lea    0x0(%esi),%esi
80101399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801013a0:	e8 6b fd ff ff       	call   80101110 <balloc>
801013a5:	89 c2                	mov    %eax,%edx
801013a7:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801013ad:	8b 06                	mov    (%esi),%eax
801013af:	e9 7c ff ff ff       	jmp    80101330 <bmap+0x40>
801013b4:	83 ec 0c             	sub    $0xc,%esp
801013b7:	68 65 71 10 80       	push   $0x80107165
801013bc:	e8 cf ef ff ff       	call   80100390 <panic>
801013c1:	eb 0d                	jmp    801013d0 <readsb>
801013c3:	90                   	nop
801013c4:	90                   	nop
801013c5:	90                   	nop
801013c6:	90                   	nop
801013c7:	90                   	nop
801013c8:	90                   	nop
801013c9:	90                   	nop
801013ca:	90                   	nop
801013cb:	90                   	nop
801013cc:	90                   	nop
801013cd:	90                   	nop
801013ce:	90                   	nop
801013cf:	90                   	nop

801013d0 <readsb>:
801013d0:	55                   	push   %ebp
801013d1:	89 e5                	mov    %esp,%ebp
801013d3:	56                   	push   %esi
801013d4:	53                   	push   %ebx
801013d5:	8b 75 0c             	mov    0xc(%ebp),%esi
801013d8:	83 ec 08             	sub    $0x8,%esp
801013db:	6a 01                	push   $0x1
801013dd:	ff 75 08             	pushl  0x8(%ebp)
801013e0:	e8 eb ec ff ff       	call   801000d0 <bread>
801013e5:	89 c3                	mov    %eax,%ebx
801013e7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ea:	83 c4 0c             	add    $0xc,%esp
801013ed:	6a 1c                	push   $0x1c
801013ef:	50                   	push   %eax
801013f0:	56                   	push   %esi
801013f1:	e8 5a 32 00 00       	call   80104650 <memmove>
801013f6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013f9:	83 c4 10             	add    $0x10,%esp
801013fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013ff:	5b                   	pop    %ebx
80101400:	5e                   	pop    %esi
80101401:	5d                   	pop    %ebp
80101402:	e9 d9 ed ff ff       	jmp    801001e0 <brelse>
80101407:	89 f6                	mov    %esi,%esi
80101409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101410 <bfree>:
80101410:	55                   	push   %ebp
80101411:	89 e5                	mov    %esp,%ebp
80101413:	56                   	push   %esi
80101414:	53                   	push   %ebx
80101415:	89 d3                	mov    %edx,%ebx
80101417:	89 c6                	mov    %eax,%esi
80101419:	83 ec 08             	sub    $0x8,%esp
8010141c:	68 c0 09 11 80       	push   $0x801109c0
80101421:	50                   	push   %eax
80101422:	e8 a9 ff ff ff       	call   801013d0 <readsb>
80101427:	58                   	pop    %eax
80101428:	5a                   	pop    %edx
80101429:	89 da                	mov    %ebx,%edx
8010142b:	c1 ea 0c             	shr    $0xc,%edx
8010142e:	03 15 d8 09 11 80    	add    0x801109d8,%edx
80101434:	52                   	push   %edx
80101435:	56                   	push   %esi
80101436:	e8 95 ec ff ff       	call   801000d0 <bread>
8010143b:	89 d9                	mov    %ebx,%ecx
8010143d:	c1 fb 03             	sar    $0x3,%ebx
80101440:	ba 01 00 00 00       	mov    $0x1,%edx
80101445:	83 e1 07             	and    $0x7,%ecx
80101448:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010144e:	83 c4 10             	add    $0x10,%esp
80101451:	d3 e2                	shl    %cl,%edx
80101453:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101458:	85 d1                	test   %edx,%ecx
8010145a:	74 25                	je     80101481 <bfree+0x71>
8010145c:	f7 d2                	not    %edx
8010145e:	89 c6                	mov    %eax,%esi
80101460:	83 ec 0c             	sub    $0xc,%esp
80101463:	21 ca                	and    %ecx,%edx
80101465:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
80101469:	56                   	push   %esi
8010146a:	e8 11 19 00 00       	call   80102d80 <log_write>
8010146f:	89 34 24             	mov    %esi,(%esp)
80101472:	e8 69 ed ff ff       	call   801001e0 <brelse>
80101477:	83 c4 10             	add    $0x10,%esp
8010147a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010147d:	5b                   	pop    %ebx
8010147e:	5e                   	pop    %esi
8010147f:	5d                   	pop    %ebp
80101480:	c3                   	ret    
80101481:	83 ec 0c             	sub    $0xc,%esp
80101484:	68 78 71 10 80       	push   $0x80107178
80101489:	e8 02 ef ff ff       	call   80100390 <panic>
8010148e:	66 90                	xchg   %ax,%ax

80101490 <iinit>:
80101490:	55                   	push   %ebp
80101491:	89 e5                	mov    %esp,%ebp
80101493:	53                   	push   %ebx
80101494:	bb 20 0a 11 80       	mov    $0x80110a20,%ebx
80101499:	83 ec 0c             	sub    $0xc,%esp
8010149c:	68 8b 71 10 80       	push   $0x8010718b
801014a1:	68 e0 09 11 80       	push   $0x801109e0
801014a6:	e8 85 2e 00 00       	call   80104330 <initlock>
801014ab:	83 c4 10             	add    $0x10,%esp
801014ae:	66 90                	xchg   %ax,%ax
801014b0:	83 ec 08             	sub    $0x8,%esp
801014b3:	68 92 71 10 80       	push   $0x80107192
801014b8:	53                   	push   %ebx
801014b9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014bf:	e8 5c 2d 00 00       	call   80104220 <initsleeplock>
801014c4:	83 c4 10             	add    $0x10,%esp
801014c7:	81 fb 40 26 11 80    	cmp    $0x80112640,%ebx
801014cd:	75 e1                	jne    801014b0 <iinit+0x20>
801014cf:	83 ec 08             	sub    $0x8,%esp
801014d2:	68 c0 09 11 80       	push   $0x801109c0
801014d7:	ff 75 08             	pushl  0x8(%ebp)
801014da:	e8 f1 fe ff ff       	call   801013d0 <readsb>
801014df:	ff 35 d8 09 11 80    	pushl  0x801109d8
801014e5:	ff 35 d4 09 11 80    	pushl  0x801109d4
801014eb:	ff 35 d0 09 11 80    	pushl  0x801109d0
801014f1:	ff 35 cc 09 11 80    	pushl  0x801109cc
801014f7:	ff 35 c8 09 11 80    	pushl  0x801109c8
801014fd:	ff 35 c4 09 11 80    	pushl  0x801109c4
80101503:	ff 35 c0 09 11 80    	pushl  0x801109c0
80101509:	68 f8 71 10 80       	push   $0x801071f8
8010150e:	e8 4d f1 ff ff       	call   80100660 <cprintf>
80101513:	83 c4 30             	add    $0x30,%esp
80101516:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101519:	c9                   	leave  
8010151a:	c3                   	ret    
8010151b:	90                   	nop
8010151c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101520 <ialloc>:
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	57                   	push   %edi
80101524:	56                   	push   %esi
80101525:	53                   	push   %ebx
80101526:	83 ec 1c             	sub    $0x1c,%esp
80101529:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
80101530:	8b 45 0c             	mov    0xc(%ebp),%eax
80101533:	8b 75 08             	mov    0x8(%ebp),%esi
80101536:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101539:	0f 86 91 00 00 00    	jbe    801015d0 <ialloc+0xb0>
8010153f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101544:	eb 21                	jmp    80101567 <ialloc+0x47>
80101546:	8d 76 00             	lea    0x0(%esi),%esi
80101549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101550:	83 ec 0c             	sub    $0xc,%esp
80101553:	83 c3 01             	add    $0x1,%ebx
80101556:	57                   	push   %edi
80101557:	e8 84 ec ff ff       	call   801001e0 <brelse>
8010155c:	83 c4 10             	add    $0x10,%esp
8010155f:	39 1d c8 09 11 80    	cmp    %ebx,0x801109c8
80101565:	76 69                	jbe    801015d0 <ialloc+0xb0>
80101567:	89 d8                	mov    %ebx,%eax
80101569:	83 ec 08             	sub    $0x8,%esp
8010156c:	c1 e8 03             	shr    $0x3,%eax
8010156f:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101575:	50                   	push   %eax
80101576:	56                   	push   %esi
80101577:	e8 54 eb ff ff       	call   801000d0 <bread>
8010157c:	89 c7                	mov    %eax,%edi
8010157e:	89 d8                	mov    %ebx,%eax
80101580:	83 c4 10             	add    $0x10,%esp
80101583:	83 e0 07             	and    $0x7,%eax
80101586:	c1 e0 06             	shl    $0x6,%eax
80101589:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
8010158d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101591:	75 bd                	jne    80101550 <ialloc+0x30>
80101593:	83 ec 04             	sub    $0x4,%esp
80101596:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101599:	6a 40                	push   $0x40
8010159b:	6a 00                	push   $0x0
8010159d:	51                   	push   %ecx
8010159e:	e8 fd 2f 00 00       	call   801045a0 <memset>
801015a3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801015a7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801015aa:	66 89 01             	mov    %ax,(%ecx)
801015ad:	89 3c 24             	mov    %edi,(%esp)
801015b0:	e8 cb 17 00 00       	call   80102d80 <log_write>
801015b5:	89 3c 24             	mov    %edi,(%esp)
801015b8:	e8 23 ec ff ff       	call   801001e0 <brelse>
801015bd:	83 c4 10             	add    $0x10,%esp
801015c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801015c3:	89 da                	mov    %ebx,%edx
801015c5:	89 f0                	mov    %esi,%eax
801015c7:	5b                   	pop    %ebx
801015c8:	5e                   	pop    %esi
801015c9:	5f                   	pop    %edi
801015ca:	5d                   	pop    %ebp
801015cb:	e9 50 fc ff ff       	jmp    80101220 <iget>
801015d0:	83 ec 0c             	sub    $0xc,%esp
801015d3:	68 98 71 10 80       	push   $0x80107198
801015d8:	e8 b3 ed ff ff       	call   80100390 <panic>
801015dd:	8d 76 00             	lea    0x0(%esi),%esi

801015e0 <iupdate>:
801015e0:	55                   	push   %ebp
801015e1:	89 e5                	mov    %esp,%ebp
801015e3:	56                   	push   %esi
801015e4:	53                   	push   %ebx
801015e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015e8:	83 ec 08             	sub    $0x8,%esp
801015eb:	8b 43 04             	mov    0x4(%ebx),%eax
801015ee:	83 c3 5c             	add    $0x5c,%ebx
801015f1:	c1 e8 03             	shr    $0x3,%eax
801015f4:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801015fa:	50                   	push   %eax
801015fb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015fe:	e8 cd ea ff ff       	call   801000d0 <bread>
80101603:	89 c6                	mov    %eax,%esi
80101605:	8b 43 a8             	mov    -0x58(%ebx),%eax
80101608:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
8010160c:	83 c4 0c             	add    $0xc,%esp
8010160f:	83 e0 07             	and    $0x7,%eax
80101612:	c1 e0 06             	shl    $0x6,%eax
80101615:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101619:	66 89 10             	mov    %dx,(%eax)
8010161c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
80101620:	83 c0 0c             	add    $0xc,%eax
80101623:	66 89 50 f6          	mov    %dx,-0xa(%eax)
80101627:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010162b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
8010162f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101633:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101637:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010163a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010163d:	6a 34                	push   $0x34
8010163f:	53                   	push   %ebx
80101640:	50                   	push   %eax
80101641:	e8 0a 30 00 00       	call   80104650 <memmove>
80101646:	89 34 24             	mov    %esi,(%esp)
80101649:	e8 32 17 00 00       	call   80102d80 <log_write>
8010164e:	89 75 08             	mov    %esi,0x8(%ebp)
80101651:	83 c4 10             	add    $0x10,%esp
80101654:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101657:	5b                   	pop    %ebx
80101658:	5e                   	pop    %esi
80101659:	5d                   	pop    %ebp
8010165a:	e9 81 eb ff ff       	jmp    801001e0 <brelse>
8010165f:	90                   	nop

80101660 <idup>:
80101660:	55                   	push   %ebp
80101661:	89 e5                	mov    %esp,%ebp
80101663:	53                   	push   %ebx
80101664:	83 ec 10             	sub    $0x10,%esp
80101667:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010166a:	68 e0 09 11 80       	push   $0x801109e0
8010166f:	e8 ac 2d 00 00       	call   80104420 <acquire>
80101674:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101678:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010167f:	e8 bc 2e 00 00       	call   80104540 <release>
80101684:	89 d8                	mov    %ebx,%eax
80101686:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101689:	c9                   	leave  
8010168a:	c3                   	ret    
8010168b:	90                   	nop
8010168c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101690 <ilock>:
80101690:	55                   	push   %ebp
80101691:	89 e5                	mov    %esp,%ebp
80101693:	56                   	push   %esi
80101694:	53                   	push   %ebx
80101695:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101698:	85 db                	test   %ebx,%ebx
8010169a:	0f 84 b7 00 00 00    	je     80101757 <ilock+0xc7>
801016a0:	8b 53 08             	mov    0x8(%ebx),%edx
801016a3:	85 d2                	test   %edx,%edx
801016a5:	0f 8e ac 00 00 00    	jle    80101757 <ilock+0xc7>
801016ab:	8d 43 0c             	lea    0xc(%ebx),%eax
801016ae:	83 ec 0c             	sub    $0xc,%esp
801016b1:	50                   	push   %eax
801016b2:	e8 a9 2b 00 00       	call   80104260 <acquiresleep>
801016b7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801016ba:	83 c4 10             	add    $0x10,%esp
801016bd:	85 c0                	test   %eax,%eax
801016bf:	74 0f                	je     801016d0 <ilock+0x40>
801016c1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016c4:	5b                   	pop    %ebx
801016c5:	5e                   	pop    %esi
801016c6:	5d                   	pop    %ebp
801016c7:	c3                   	ret    
801016c8:	90                   	nop
801016c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801016d0:	8b 43 04             	mov    0x4(%ebx),%eax
801016d3:	83 ec 08             	sub    $0x8,%esp
801016d6:	c1 e8 03             	shr    $0x3,%eax
801016d9:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801016df:	50                   	push   %eax
801016e0:	ff 33                	pushl  (%ebx)
801016e2:	e8 e9 e9 ff ff       	call   801000d0 <bread>
801016e7:	89 c6                	mov    %eax,%esi
801016e9:	8b 43 04             	mov    0x4(%ebx),%eax
801016ec:	83 c4 0c             	add    $0xc,%esp
801016ef:	83 e0 07             	and    $0x7,%eax
801016f2:	c1 e0 06             	shl    $0x6,%eax
801016f5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801016f9:	0f b7 10             	movzwl (%eax),%edx
801016fc:	83 c0 0c             	add    $0xc,%eax
801016ff:	66 89 53 50          	mov    %dx,0x50(%ebx)
80101703:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101707:	66 89 53 52          	mov    %dx,0x52(%ebx)
8010170b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010170f:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101713:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101717:	66 89 53 56          	mov    %dx,0x56(%ebx)
8010171b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010171e:	89 53 58             	mov    %edx,0x58(%ebx)
80101721:	6a 34                	push   $0x34
80101723:	50                   	push   %eax
80101724:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101727:	50                   	push   %eax
80101728:	e8 23 2f 00 00       	call   80104650 <memmove>
8010172d:	89 34 24             	mov    %esi,(%esp)
80101730:	e8 ab ea ff ff       	call   801001e0 <brelse>
80101735:	83 c4 10             	add    $0x10,%esp
80101738:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010173d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101744:	0f 85 77 ff ff ff    	jne    801016c1 <ilock+0x31>
8010174a:	83 ec 0c             	sub    $0xc,%esp
8010174d:	68 b0 71 10 80       	push   $0x801071b0
80101752:	e8 39 ec ff ff       	call   80100390 <panic>
80101757:	83 ec 0c             	sub    $0xc,%esp
8010175a:	68 aa 71 10 80       	push   $0x801071aa
8010175f:	e8 2c ec ff ff       	call   80100390 <panic>
80101764:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010176a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101770 <iunlock>:
80101770:	55                   	push   %ebp
80101771:	89 e5                	mov    %esp,%ebp
80101773:	56                   	push   %esi
80101774:	53                   	push   %ebx
80101775:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101778:	85 db                	test   %ebx,%ebx
8010177a:	74 28                	je     801017a4 <iunlock+0x34>
8010177c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010177f:	83 ec 0c             	sub    $0xc,%esp
80101782:	56                   	push   %esi
80101783:	e8 78 2b 00 00       	call   80104300 <holdingsleep>
80101788:	83 c4 10             	add    $0x10,%esp
8010178b:	85 c0                	test   %eax,%eax
8010178d:	74 15                	je     801017a4 <iunlock+0x34>
8010178f:	8b 43 08             	mov    0x8(%ebx),%eax
80101792:	85 c0                	test   %eax,%eax
80101794:	7e 0e                	jle    801017a4 <iunlock+0x34>
80101796:	89 75 08             	mov    %esi,0x8(%ebp)
80101799:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010179c:	5b                   	pop    %ebx
8010179d:	5e                   	pop    %esi
8010179e:	5d                   	pop    %ebp
8010179f:	e9 1c 2b 00 00       	jmp    801042c0 <releasesleep>
801017a4:	83 ec 0c             	sub    $0xc,%esp
801017a7:	68 bf 71 10 80       	push   $0x801071bf
801017ac:	e8 df eb ff ff       	call   80100390 <panic>
801017b1:	eb 0d                	jmp    801017c0 <iput>
801017b3:	90                   	nop
801017b4:	90                   	nop
801017b5:	90                   	nop
801017b6:	90                   	nop
801017b7:	90                   	nop
801017b8:	90                   	nop
801017b9:	90                   	nop
801017ba:	90                   	nop
801017bb:	90                   	nop
801017bc:	90                   	nop
801017bd:	90                   	nop
801017be:	90                   	nop
801017bf:	90                   	nop

801017c0 <iput>:
801017c0:	55                   	push   %ebp
801017c1:	89 e5                	mov    %esp,%ebp
801017c3:	57                   	push   %edi
801017c4:	56                   	push   %esi
801017c5:	53                   	push   %ebx
801017c6:	83 ec 28             	sub    $0x28,%esp
801017c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801017cc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801017cf:	57                   	push   %edi
801017d0:	e8 8b 2a 00 00       	call   80104260 <acquiresleep>
801017d5:	8b 53 4c             	mov    0x4c(%ebx),%edx
801017d8:	83 c4 10             	add    $0x10,%esp
801017db:	85 d2                	test   %edx,%edx
801017dd:	74 07                	je     801017e6 <iput+0x26>
801017df:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801017e4:	74 32                	je     80101818 <iput+0x58>
801017e6:	83 ec 0c             	sub    $0xc,%esp
801017e9:	57                   	push   %edi
801017ea:	e8 d1 2a 00 00       	call   801042c0 <releasesleep>
801017ef:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017f6:	e8 25 2c 00 00       	call   80104420 <acquire>
801017fb:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
801017ff:	83 c4 10             	add    $0x10,%esp
80101802:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
80101809:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010180c:	5b                   	pop    %ebx
8010180d:	5e                   	pop    %esi
8010180e:	5f                   	pop    %edi
8010180f:	5d                   	pop    %ebp
80101810:	e9 2b 2d 00 00       	jmp    80104540 <release>
80101815:	8d 76 00             	lea    0x0(%esi),%esi
80101818:	83 ec 0c             	sub    $0xc,%esp
8010181b:	68 e0 09 11 80       	push   $0x801109e0
80101820:	e8 fb 2b 00 00       	call   80104420 <acquire>
80101825:	8b 73 08             	mov    0x8(%ebx),%esi
80101828:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010182f:	e8 0c 2d 00 00       	call   80104540 <release>
80101834:	83 c4 10             	add    $0x10,%esp
80101837:	83 fe 01             	cmp    $0x1,%esi
8010183a:	75 aa                	jne    801017e6 <iput+0x26>
8010183c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101842:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101845:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101848:	89 cf                	mov    %ecx,%edi
8010184a:	eb 0b                	jmp    80101857 <iput+0x97>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101850:	83 c6 04             	add    $0x4,%esi
80101853:	39 fe                	cmp    %edi,%esi
80101855:	74 19                	je     80101870 <iput+0xb0>
80101857:	8b 16                	mov    (%esi),%edx
80101859:	85 d2                	test   %edx,%edx
8010185b:	74 f3                	je     80101850 <iput+0x90>
8010185d:	8b 03                	mov    (%ebx),%eax
8010185f:	e8 ac fb ff ff       	call   80101410 <bfree>
80101864:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010186a:	eb e4                	jmp    80101850 <iput+0x90>
8010186c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101870:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80101876:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101879:	85 c0                	test   %eax,%eax
8010187b:	75 33                	jne    801018b0 <iput+0xf0>
8010187d:	83 ec 0c             	sub    $0xc,%esp
80101880:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
80101887:	53                   	push   %ebx
80101888:	e8 53 fd ff ff       	call   801015e0 <iupdate>
8010188d:	31 c0                	xor    %eax,%eax
8010188f:	66 89 43 50          	mov    %ax,0x50(%ebx)
80101893:	89 1c 24             	mov    %ebx,(%esp)
80101896:	e8 45 fd ff ff       	call   801015e0 <iupdate>
8010189b:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801018a2:	83 c4 10             	add    $0x10,%esp
801018a5:	e9 3c ff ff ff       	jmp    801017e6 <iput+0x26>
801018aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801018b0:	83 ec 08             	sub    $0x8,%esp
801018b3:	50                   	push   %eax
801018b4:	ff 33                	pushl  (%ebx)
801018b6:	e8 15 e8 ff ff       	call   801000d0 <bread>
801018bb:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018c1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018c7:	8d 70 5c             	lea    0x5c(%eax),%esi
801018ca:	83 c4 10             	add    $0x10,%esp
801018cd:	89 cf                	mov    %ecx,%edi
801018cf:	eb 0e                	jmp    801018df <iput+0x11f>
801018d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018d8:	83 c6 04             	add    $0x4,%esi
801018db:	39 fe                	cmp    %edi,%esi
801018dd:	74 0f                	je     801018ee <iput+0x12e>
801018df:	8b 16                	mov    (%esi),%edx
801018e1:	85 d2                	test   %edx,%edx
801018e3:	74 f3                	je     801018d8 <iput+0x118>
801018e5:	8b 03                	mov    (%ebx),%eax
801018e7:	e8 24 fb ff ff       	call   80101410 <bfree>
801018ec:	eb ea                	jmp    801018d8 <iput+0x118>
801018ee:	83 ec 0c             	sub    $0xc,%esp
801018f1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018f4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018f7:	e8 e4 e8 ff ff       	call   801001e0 <brelse>
801018fc:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
80101902:	8b 03                	mov    (%ebx),%eax
80101904:	e8 07 fb ff ff       	call   80101410 <bfree>
80101909:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80101910:	00 00 00 
80101913:	83 c4 10             	add    $0x10,%esp
80101916:	e9 62 ff ff ff       	jmp    8010187d <iput+0xbd>
8010191b:	90                   	nop
8010191c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101920 <iunlockput>:
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	53                   	push   %ebx
80101924:	83 ec 10             	sub    $0x10,%esp
80101927:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010192a:	53                   	push   %ebx
8010192b:	e8 40 fe ff ff       	call   80101770 <iunlock>
80101930:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101933:	83 c4 10             	add    $0x10,%esp
80101936:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101939:	c9                   	leave  
8010193a:	e9 81 fe ff ff       	jmp    801017c0 <iput>
8010193f:	90                   	nop

80101940 <stati>:
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	8b 55 08             	mov    0x8(%ebp),%edx
80101946:	8b 45 0c             	mov    0xc(%ebp),%eax
80101949:	8b 0a                	mov    (%edx),%ecx
8010194b:	89 48 04             	mov    %ecx,0x4(%eax)
8010194e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101951:	89 48 08             	mov    %ecx,0x8(%eax)
80101954:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101958:	66 89 08             	mov    %cx,(%eax)
8010195b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010195f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101963:	8b 52 58             	mov    0x58(%edx),%edx
80101966:	89 50 10             	mov    %edx,0x10(%eax)
80101969:	5d                   	pop    %ebp
8010196a:	c3                   	ret    
8010196b:	90                   	nop
8010196c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101970 <readi>:
80101970:	55                   	push   %ebp
80101971:	89 e5                	mov    %esp,%ebp
80101973:	57                   	push   %edi
80101974:	56                   	push   %esi
80101975:	53                   	push   %ebx
80101976:	83 ec 1c             	sub    $0x1c,%esp
80101979:	8b 45 08             	mov    0x8(%ebp),%eax
8010197c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010197f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101982:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101987:	89 75 e0             	mov    %esi,-0x20(%ebp)
8010198a:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010198d:	8b 75 10             	mov    0x10(%ebp),%esi
80101990:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101993:	0f 84 a7 00 00 00    	je     80101a40 <readi+0xd0>
80101999:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010199c:	8b 40 58             	mov    0x58(%eax),%eax
8010199f:	39 c6                	cmp    %eax,%esi
801019a1:	0f 87 ba 00 00 00    	ja     80101a61 <readi+0xf1>
801019a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019aa:	89 f9                	mov    %edi,%ecx
801019ac:	01 f1                	add    %esi,%ecx
801019ae:	0f 82 ad 00 00 00    	jb     80101a61 <readi+0xf1>
801019b4:	89 c2                	mov    %eax,%edx
801019b6:	29 f2                	sub    %esi,%edx
801019b8:	39 c8                	cmp    %ecx,%eax
801019ba:	0f 43 d7             	cmovae %edi,%edx
801019bd:	31 ff                	xor    %edi,%edi
801019bf:	85 d2                	test   %edx,%edx
801019c1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801019c4:	74 6c                	je     80101a32 <readi+0xc2>
801019c6:	8d 76 00             	lea    0x0(%esi),%esi
801019c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801019d0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019d3:	89 f2                	mov    %esi,%edx
801019d5:	c1 ea 09             	shr    $0x9,%edx
801019d8:	89 d8                	mov    %ebx,%eax
801019da:	e8 11 f9 ff ff       	call   801012f0 <bmap>
801019df:	83 ec 08             	sub    $0x8,%esp
801019e2:	50                   	push   %eax
801019e3:	ff 33                	pushl  (%ebx)
801019e5:	e8 e6 e6 ff ff       	call   801000d0 <bread>
801019ea:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801019ed:	89 c2                	mov    %eax,%edx
801019ef:	89 f0                	mov    %esi,%eax
801019f1:	25 ff 01 00 00       	and    $0x1ff,%eax
801019f6:	b9 00 02 00 00       	mov    $0x200,%ecx
801019fb:	83 c4 0c             	add    $0xc,%esp
801019fe:	29 c1                	sub    %eax,%ecx
80101a00:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101a04:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101a07:	29 fb                	sub    %edi,%ebx
80101a09:	39 d9                	cmp    %ebx,%ecx
80101a0b:	0f 46 d9             	cmovbe %ecx,%ebx
80101a0e:	53                   	push   %ebx
80101a0f:	50                   	push   %eax
80101a10:	01 df                	add    %ebx,%edi
80101a12:	ff 75 e0             	pushl  -0x20(%ebp)
80101a15:	01 de                	add    %ebx,%esi
80101a17:	e8 34 2c 00 00       	call   80104650 <memmove>
80101a1c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a1f:	89 14 24             	mov    %edx,(%esp)
80101a22:	e8 b9 e7 ff ff       	call   801001e0 <brelse>
80101a27:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a2a:	83 c4 10             	add    $0x10,%esp
80101a2d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a30:	77 9e                	ja     801019d0 <readi+0x60>
80101a32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a38:	5b                   	pop    %ebx
80101a39:	5e                   	pop    %esi
80101a3a:	5f                   	pop    %edi
80101a3b:	5d                   	pop    %ebp
80101a3c:	c3                   	ret    
80101a3d:	8d 76 00             	lea    0x0(%esi),%esi
80101a40:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a44:	66 83 f8 09          	cmp    $0x9,%ax
80101a48:	77 17                	ja     80101a61 <readi+0xf1>
80101a4a:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101a51:	85 c0                	test   %eax,%eax
80101a53:	74 0c                	je     80101a61 <readi+0xf1>
80101a55:	89 7d 10             	mov    %edi,0x10(%ebp)
80101a58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a5b:	5b                   	pop    %ebx
80101a5c:	5e                   	pop    %esi
80101a5d:	5f                   	pop    %edi
80101a5e:	5d                   	pop    %ebp
80101a5f:	ff e0                	jmp    *%eax
80101a61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a66:	eb cd                	jmp    80101a35 <readi+0xc5>
80101a68:	90                   	nop
80101a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101a70 <writei>:
80101a70:	55                   	push   %ebp
80101a71:	89 e5                	mov    %esp,%ebp
80101a73:	57                   	push   %edi
80101a74:	56                   	push   %esi
80101a75:	53                   	push   %ebx
80101a76:	83 ec 1c             	sub    $0x1c,%esp
80101a79:	8b 45 08             	mov    0x8(%ebp),%eax
80101a7c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a7f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a82:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a87:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a8a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a8d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a90:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a93:	0f 84 b7 00 00 00    	je     80101b50 <writei+0xe0>
80101a99:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a9c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a9f:	0f 82 eb 00 00 00    	jb     80101b90 <writei+0x120>
80101aa5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101aa8:	31 d2                	xor    %edx,%edx
80101aaa:	89 f8                	mov    %edi,%eax
80101aac:	01 f0                	add    %esi,%eax
80101aae:	0f 92 c2             	setb   %dl
80101ab1:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101ab6:	0f 87 d4 00 00 00    	ja     80101b90 <writei+0x120>
80101abc:	85 d2                	test   %edx,%edx
80101abe:	0f 85 cc 00 00 00    	jne    80101b90 <writei+0x120>
80101ac4:	85 ff                	test   %edi,%edi
80101ac6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101acd:	74 72                	je     80101b41 <writei+0xd1>
80101acf:	90                   	nop
80101ad0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ad3:	89 f2                	mov    %esi,%edx
80101ad5:	c1 ea 09             	shr    $0x9,%edx
80101ad8:	89 f8                	mov    %edi,%eax
80101ada:	e8 11 f8 ff ff       	call   801012f0 <bmap>
80101adf:	83 ec 08             	sub    $0x8,%esp
80101ae2:	50                   	push   %eax
80101ae3:	ff 37                	pushl  (%edi)
80101ae5:	e8 e6 e5 ff ff       	call   801000d0 <bread>
80101aea:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101aed:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
80101af0:	89 c7                	mov    %eax,%edi
80101af2:	89 f0                	mov    %esi,%eax
80101af4:	b9 00 02 00 00       	mov    $0x200,%ecx
80101af9:	83 c4 0c             	add    $0xc,%esp
80101afc:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b01:	29 c1                	sub    %eax,%ecx
80101b03:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101b07:	39 d9                	cmp    %ebx,%ecx
80101b09:	0f 46 d9             	cmovbe %ecx,%ebx
80101b0c:	53                   	push   %ebx
80101b0d:	ff 75 dc             	pushl  -0x24(%ebp)
80101b10:	01 de                	add    %ebx,%esi
80101b12:	50                   	push   %eax
80101b13:	e8 38 2b 00 00       	call   80104650 <memmove>
80101b18:	89 3c 24             	mov    %edi,(%esp)
80101b1b:	e8 60 12 00 00       	call   80102d80 <log_write>
80101b20:	89 3c 24             	mov    %edi,(%esp)
80101b23:	e8 b8 e6 ff ff       	call   801001e0 <brelse>
80101b28:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b2b:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b2e:	83 c4 10             	add    $0x10,%esp
80101b31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b34:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b37:	77 97                	ja     80101ad0 <writei+0x60>
80101b39:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b3c:	3b 70 58             	cmp    0x58(%eax),%esi
80101b3f:	77 37                	ja     80101b78 <writei+0x108>
80101b41:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b44:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b47:	5b                   	pop    %ebx
80101b48:	5e                   	pop    %esi
80101b49:	5f                   	pop    %edi
80101b4a:	5d                   	pop    %ebp
80101b4b:	c3                   	ret    
80101b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b50:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b54:	66 83 f8 09          	cmp    $0x9,%ax
80101b58:	77 36                	ja     80101b90 <writei+0x120>
80101b5a:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101b61:	85 c0                	test   %eax,%eax
80101b63:	74 2b                	je     80101b90 <writei+0x120>
80101b65:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b68:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b6b:	5b                   	pop    %ebx
80101b6c:	5e                   	pop    %esi
80101b6d:	5f                   	pop    %edi
80101b6e:	5d                   	pop    %ebp
80101b6f:	ff e0                	jmp    *%eax
80101b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b78:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b7b:	83 ec 0c             	sub    $0xc,%esp
80101b7e:	89 70 58             	mov    %esi,0x58(%eax)
80101b81:	50                   	push   %eax
80101b82:	e8 59 fa ff ff       	call   801015e0 <iupdate>
80101b87:	83 c4 10             	add    $0x10,%esp
80101b8a:	eb b5                	jmp    80101b41 <writei+0xd1>
80101b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b95:	eb ad                	jmp    80101b44 <writei+0xd4>
80101b97:	89 f6                	mov    %esi,%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <namecmp>:
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	83 ec 0c             	sub    $0xc,%esp
80101ba6:	6a 0e                	push   $0xe
80101ba8:	ff 75 0c             	pushl  0xc(%ebp)
80101bab:	ff 75 08             	pushl  0x8(%ebp)
80101bae:	e8 0d 2b 00 00       	call   801046c0 <strncmp>
80101bb3:	c9                   	leave  
80101bb4:	c3                   	ret    
80101bb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bc0 <dirlookup>:
80101bc0:	55                   	push   %ebp
80101bc1:	89 e5                	mov    %esp,%ebp
80101bc3:	57                   	push   %edi
80101bc4:	56                   	push   %esi
80101bc5:	53                   	push   %ebx
80101bc6:	83 ec 1c             	sub    $0x1c,%esp
80101bc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101bcc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bd1:	0f 85 85 00 00 00    	jne    80101c5c <dirlookup+0x9c>
80101bd7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bda:	31 ff                	xor    %edi,%edi
80101bdc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bdf:	85 d2                	test   %edx,%edx
80101be1:	74 3e                	je     80101c21 <dirlookup+0x61>
80101be3:	90                   	nop
80101be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101be8:	6a 10                	push   $0x10
80101bea:	57                   	push   %edi
80101beb:	56                   	push   %esi
80101bec:	53                   	push   %ebx
80101bed:	e8 7e fd ff ff       	call   80101970 <readi>
80101bf2:	83 c4 10             	add    $0x10,%esp
80101bf5:	83 f8 10             	cmp    $0x10,%eax
80101bf8:	75 55                	jne    80101c4f <dirlookup+0x8f>
80101bfa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bff:	74 18                	je     80101c19 <dirlookup+0x59>
80101c01:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c04:	83 ec 04             	sub    $0x4,%esp
80101c07:	6a 0e                	push   $0xe
80101c09:	50                   	push   %eax
80101c0a:	ff 75 0c             	pushl  0xc(%ebp)
80101c0d:	e8 ae 2a 00 00       	call   801046c0 <strncmp>
80101c12:	83 c4 10             	add    $0x10,%esp
80101c15:	85 c0                	test   %eax,%eax
80101c17:	74 17                	je     80101c30 <dirlookup+0x70>
80101c19:	83 c7 10             	add    $0x10,%edi
80101c1c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101c1f:	72 c7                	jb     80101be8 <dirlookup+0x28>
80101c21:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c24:	31 c0                	xor    %eax,%eax
80101c26:	5b                   	pop    %ebx
80101c27:	5e                   	pop    %esi
80101c28:	5f                   	pop    %edi
80101c29:	5d                   	pop    %ebp
80101c2a:	c3                   	ret    
80101c2b:	90                   	nop
80101c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c30:	8b 45 10             	mov    0x10(%ebp),%eax
80101c33:	85 c0                	test   %eax,%eax
80101c35:	74 05                	je     80101c3c <dirlookup+0x7c>
80101c37:	8b 45 10             	mov    0x10(%ebp),%eax
80101c3a:	89 38                	mov    %edi,(%eax)
80101c3c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c40:	8b 03                	mov    (%ebx),%eax
80101c42:	e8 d9 f5 ff ff       	call   80101220 <iget>
80101c47:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c4a:	5b                   	pop    %ebx
80101c4b:	5e                   	pop    %esi
80101c4c:	5f                   	pop    %edi
80101c4d:	5d                   	pop    %ebp
80101c4e:	c3                   	ret    
80101c4f:	83 ec 0c             	sub    $0xc,%esp
80101c52:	68 d9 71 10 80       	push   $0x801071d9
80101c57:	e8 34 e7 ff ff       	call   80100390 <panic>
80101c5c:	83 ec 0c             	sub    $0xc,%esp
80101c5f:	68 c7 71 10 80       	push   $0x801071c7
80101c64:	e8 27 e7 ff ff       	call   80100390 <panic>
80101c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101c70 <namex>:
80101c70:	55                   	push   %ebp
80101c71:	89 e5                	mov    %esp,%ebp
80101c73:	57                   	push   %edi
80101c74:	56                   	push   %esi
80101c75:	53                   	push   %ebx
80101c76:	89 cf                	mov    %ecx,%edi
80101c78:	89 c3                	mov    %eax,%ebx
80101c7a:	83 ec 1c             	sub    $0x1c,%esp
80101c7d:	80 38 2f             	cmpb   $0x2f,(%eax)
80101c80:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c83:	0f 84 67 01 00 00    	je     80101df0 <namex+0x180>
80101c89:	e8 62 1b 00 00       	call   801037f0 <myproc>
80101c8e:	83 ec 0c             	sub    $0xc,%esp
80101c91:	8b 70 68             	mov    0x68(%eax),%esi
80101c94:	68 e0 09 11 80       	push   $0x801109e0
80101c99:	e8 82 27 00 00       	call   80104420 <acquire>
80101c9e:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101ca2:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101ca9:	e8 92 28 00 00       	call   80104540 <release>
80101cae:	83 c4 10             	add    $0x10,%esp
80101cb1:	eb 08                	jmp    80101cbb <namex+0x4b>
80101cb3:	90                   	nop
80101cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101cb8:	83 c3 01             	add    $0x1,%ebx
80101cbb:	0f b6 03             	movzbl (%ebx),%eax
80101cbe:	3c 2f                	cmp    $0x2f,%al
80101cc0:	74 f6                	je     80101cb8 <namex+0x48>
80101cc2:	84 c0                	test   %al,%al
80101cc4:	0f 84 ee 00 00 00    	je     80101db8 <namex+0x148>
80101cca:	0f b6 03             	movzbl (%ebx),%eax
80101ccd:	3c 2f                	cmp    $0x2f,%al
80101ccf:	0f 84 b3 00 00 00    	je     80101d88 <namex+0x118>
80101cd5:	84 c0                	test   %al,%al
80101cd7:	89 da                	mov    %ebx,%edx
80101cd9:	75 09                	jne    80101ce4 <namex+0x74>
80101cdb:	e9 a8 00 00 00       	jmp    80101d88 <namex+0x118>
80101ce0:	84 c0                	test   %al,%al
80101ce2:	74 0a                	je     80101cee <namex+0x7e>
80101ce4:	83 c2 01             	add    $0x1,%edx
80101ce7:	0f b6 02             	movzbl (%edx),%eax
80101cea:	3c 2f                	cmp    $0x2f,%al
80101cec:	75 f2                	jne    80101ce0 <namex+0x70>
80101cee:	89 d1                	mov    %edx,%ecx
80101cf0:	29 d9                	sub    %ebx,%ecx
80101cf2:	83 f9 0d             	cmp    $0xd,%ecx
80101cf5:	0f 8e 91 00 00 00    	jle    80101d8c <namex+0x11c>
80101cfb:	83 ec 04             	sub    $0x4,%esp
80101cfe:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d01:	6a 0e                	push   $0xe
80101d03:	53                   	push   %ebx
80101d04:	57                   	push   %edi
80101d05:	e8 46 29 00 00       	call   80104650 <memmove>
80101d0a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d0d:	83 c4 10             	add    $0x10,%esp
80101d10:	89 d3                	mov    %edx,%ebx
80101d12:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d15:	75 11                	jne    80101d28 <namex+0xb8>
80101d17:	89 f6                	mov    %esi,%esi
80101d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101d20:	83 c3 01             	add    $0x1,%ebx
80101d23:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d26:	74 f8                	je     80101d20 <namex+0xb0>
80101d28:	83 ec 0c             	sub    $0xc,%esp
80101d2b:	56                   	push   %esi
80101d2c:	e8 5f f9 ff ff       	call   80101690 <ilock>
80101d31:	83 c4 10             	add    $0x10,%esp
80101d34:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d39:	0f 85 91 00 00 00    	jne    80101dd0 <namex+0x160>
80101d3f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d42:	85 d2                	test   %edx,%edx
80101d44:	74 09                	je     80101d4f <namex+0xdf>
80101d46:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d49:	0f 84 b7 00 00 00    	je     80101e06 <namex+0x196>
80101d4f:	83 ec 04             	sub    $0x4,%esp
80101d52:	6a 00                	push   $0x0
80101d54:	57                   	push   %edi
80101d55:	56                   	push   %esi
80101d56:	e8 65 fe ff ff       	call   80101bc0 <dirlookup>
80101d5b:	83 c4 10             	add    $0x10,%esp
80101d5e:	85 c0                	test   %eax,%eax
80101d60:	74 6e                	je     80101dd0 <namex+0x160>
80101d62:	83 ec 0c             	sub    $0xc,%esp
80101d65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d68:	56                   	push   %esi
80101d69:	e8 02 fa ff ff       	call   80101770 <iunlock>
80101d6e:	89 34 24             	mov    %esi,(%esp)
80101d71:	e8 4a fa ff ff       	call   801017c0 <iput>
80101d76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d79:	83 c4 10             	add    $0x10,%esp
80101d7c:	89 c6                	mov    %eax,%esi
80101d7e:	e9 38 ff ff ff       	jmp    80101cbb <namex+0x4b>
80101d83:	90                   	nop
80101d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d88:	89 da                	mov    %ebx,%edx
80101d8a:	31 c9                	xor    %ecx,%ecx
80101d8c:	83 ec 04             	sub    $0x4,%esp
80101d8f:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d92:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d95:	51                   	push   %ecx
80101d96:	53                   	push   %ebx
80101d97:	57                   	push   %edi
80101d98:	e8 b3 28 00 00       	call   80104650 <memmove>
80101d9d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101da0:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101da3:	83 c4 10             	add    $0x10,%esp
80101da6:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101daa:	89 d3                	mov    %edx,%ebx
80101dac:	e9 61 ff ff ff       	jmp    80101d12 <namex+0xa2>
80101db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101db8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101dbb:	85 c0                	test   %eax,%eax
80101dbd:	75 5d                	jne    80101e1c <namex+0x1ac>
80101dbf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dc2:	89 f0                	mov    %esi,%eax
80101dc4:	5b                   	pop    %ebx
80101dc5:	5e                   	pop    %esi
80101dc6:	5f                   	pop    %edi
80101dc7:	5d                   	pop    %ebp
80101dc8:	c3                   	ret    
80101dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101dd0:	83 ec 0c             	sub    $0xc,%esp
80101dd3:	56                   	push   %esi
80101dd4:	e8 97 f9 ff ff       	call   80101770 <iunlock>
80101dd9:	89 34 24             	mov    %esi,(%esp)
80101ddc:	31 f6                	xor    %esi,%esi
80101dde:	e8 dd f9 ff ff       	call   801017c0 <iput>
80101de3:	83 c4 10             	add    $0x10,%esp
80101de6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101de9:	89 f0                	mov    %esi,%eax
80101deb:	5b                   	pop    %ebx
80101dec:	5e                   	pop    %esi
80101ded:	5f                   	pop    %edi
80101dee:	5d                   	pop    %ebp
80101def:	c3                   	ret    
80101df0:	ba 01 00 00 00       	mov    $0x1,%edx
80101df5:	b8 01 00 00 00       	mov    $0x1,%eax
80101dfa:	e8 21 f4 ff ff       	call   80101220 <iget>
80101dff:	89 c6                	mov    %eax,%esi
80101e01:	e9 b5 fe ff ff       	jmp    80101cbb <namex+0x4b>
80101e06:	83 ec 0c             	sub    $0xc,%esp
80101e09:	56                   	push   %esi
80101e0a:	e8 61 f9 ff ff       	call   80101770 <iunlock>
80101e0f:	83 c4 10             	add    $0x10,%esp
80101e12:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e15:	89 f0                	mov    %esi,%eax
80101e17:	5b                   	pop    %ebx
80101e18:	5e                   	pop    %esi
80101e19:	5f                   	pop    %edi
80101e1a:	5d                   	pop    %ebp
80101e1b:	c3                   	ret    
80101e1c:	83 ec 0c             	sub    $0xc,%esp
80101e1f:	56                   	push   %esi
80101e20:	31 f6                	xor    %esi,%esi
80101e22:	e8 99 f9 ff ff       	call   801017c0 <iput>
80101e27:	83 c4 10             	add    $0x10,%esp
80101e2a:	eb 93                	jmp    80101dbf <namex+0x14f>
80101e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101e30 <dirlink>:
80101e30:	55                   	push   %ebp
80101e31:	89 e5                	mov    %esp,%ebp
80101e33:	57                   	push   %edi
80101e34:	56                   	push   %esi
80101e35:	53                   	push   %ebx
80101e36:	83 ec 20             	sub    $0x20,%esp
80101e39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101e3c:	6a 00                	push   $0x0
80101e3e:	ff 75 0c             	pushl  0xc(%ebp)
80101e41:	53                   	push   %ebx
80101e42:	e8 79 fd ff ff       	call   80101bc0 <dirlookup>
80101e47:	83 c4 10             	add    $0x10,%esp
80101e4a:	85 c0                	test   %eax,%eax
80101e4c:	75 67                	jne    80101eb5 <dirlink+0x85>
80101e4e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e51:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e54:	85 ff                	test   %edi,%edi
80101e56:	74 29                	je     80101e81 <dirlink+0x51>
80101e58:	31 ff                	xor    %edi,%edi
80101e5a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e5d:	eb 09                	jmp    80101e68 <dirlink+0x38>
80101e5f:	90                   	nop
80101e60:	83 c7 10             	add    $0x10,%edi
80101e63:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101e66:	73 19                	jae    80101e81 <dirlink+0x51>
80101e68:	6a 10                	push   $0x10
80101e6a:	57                   	push   %edi
80101e6b:	56                   	push   %esi
80101e6c:	53                   	push   %ebx
80101e6d:	e8 fe fa ff ff       	call   80101970 <readi>
80101e72:	83 c4 10             	add    $0x10,%esp
80101e75:	83 f8 10             	cmp    $0x10,%eax
80101e78:	75 4e                	jne    80101ec8 <dirlink+0x98>
80101e7a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e7f:	75 df                	jne    80101e60 <dirlink+0x30>
80101e81:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e84:	83 ec 04             	sub    $0x4,%esp
80101e87:	6a 0e                	push   $0xe
80101e89:	ff 75 0c             	pushl  0xc(%ebp)
80101e8c:	50                   	push   %eax
80101e8d:	e8 8e 28 00 00       	call   80104720 <strncpy>
80101e92:	8b 45 10             	mov    0x10(%ebp),%eax
80101e95:	6a 10                	push   $0x10
80101e97:	57                   	push   %edi
80101e98:	56                   	push   %esi
80101e99:	53                   	push   %ebx
80101e9a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e9e:	e8 cd fb ff ff       	call   80101a70 <writei>
80101ea3:	83 c4 20             	add    $0x20,%esp
80101ea6:	83 f8 10             	cmp    $0x10,%eax
80101ea9:	75 2a                	jne    80101ed5 <dirlink+0xa5>
80101eab:	31 c0                	xor    %eax,%eax
80101ead:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101eb0:	5b                   	pop    %ebx
80101eb1:	5e                   	pop    %esi
80101eb2:	5f                   	pop    %edi
80101eb3:	5d                   	pop    %ebp
80101eb4:	c3                   	ret    
80101eb5:	83 ec 0c             	sub    $0xc,%esp
80101eb8:	50                   	push   %eax
80101eb9:	e8 02 f9 ff ff       	call   801017c0 <iput>
80101ebe:	83 c4 10             	add    $0x10,%esp
80101ec1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ec6:	eb e5                	jmp    80101ead <dirlink+0x7d>
80101ec8:	83 ec 0c             	sub    $0xc,%esp
80101ecb:	68 e8 71 10 80       	push   $0x801071e8
80101ed0:	e8 bb e4 ff ff       	call   80100390 <panic>
80101ed5:	83 ec 0c             	sub    $0xc,%esp
80101ed8:	68 4a 78 10 80       	push   $0x8010784a
80101edd:	e8 ae e4 ff ff       	call   80100390 <panic>
80101ee2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ef0 <namei>:
80101ef0:	55                   	push   %ebp
80101ef1:	31 d2                	xor    %edx,%edx
80101ef3:	89 e5                	mov    %esp,%ebp
80101ef5:	83 ec 18             	sub    $0x18,%esp
80101ef8:	8b 45 08             	mov    0x8(%ebp),%eax
80101efb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101efe:	e8 6d fd ff ff       	call   80101c70 <namex>
80101f03:	c9                   	leave  
80101f04:	c3                   	ret    
80101f05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f10 <nameiparent>:
80101f10:	55                   	push   %ebp
80101f11:	ba 01 00 00 00       	mov    $0x1,%edx
80101f16:	89 e5                	mov    %esp,%ebp
80101f18:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f1b:	8b 45 08             	mov    0x8(%ebp),%eax
80101f1e:	5d                   	pop    %ebp
80101f1f:	e9 4c fd ff ff       	jmp    80101c70 <namex>
80101f24:	66 90                	xchg   %ax,%ax
80101f26:	66 90                	xchg   %ax,%ax
80101f28:	66 90                	xchg   %ax,%ax
80101f2a:	66 90                	xchg   %ax,%ax
80101f2c:	66 90                	xchg   %ax,%ax
80101f2e:	66 90                	xchg   %ax,%ax

80101f30 <idestart>:
80101f30:	55                   	push   %ebp
80101f31:	89 e5                	mov    %esp,%ebp
80101f33:	57                   	push   %edi
80101f34:	56                   	push   %esi
80101f35:	53                   	push   %ebx
80101f36:	83 ec 0c             	sub    $0xc,%esp
80101f39:	85 c0                	test   %eax,%eax
80101f3b:	0f 84 b4 00 00 00    	je     80101ff5 <idestart+0xc5>
80101f41:	8b 58 08             	mov    0x8(%eax),%ebx
80101f44:	89 c6                	mov    %eax,%esi
80101f46:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f4c:	0f 87 96 00 00 00    	ja     80101fe8 <idestart+0xb8>
80101f52:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80101f57:	89 f6                	mov    %esi,%esi
80101f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101f60:	89 ca                	mov    %ecx,%edx
80101f62:	ec                   	in     (%dx),%al
80101f63:	83 e0 c0             	and    $0xffffffc0,%eax
80101f66:	3c 40                	cmp    $0x40,%al
80101f68:	75 f6                	jne    80101f60 <idestart+0x30>
80101f6a:	31 ff                	xor    %edi,%edi
80101f6c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f71:	89 f8                	mov    %edi,%eax
80101f73:	ee                   	out    %al,(%dx)
80101f74:	b8 01 00 00 00       	mov    $0x1,%eax
80101f79:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f7e:	ee                   	out    %al,(%dx)
80101f7f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f84:	89 d8                	mov    %ebx,%eax
80101f86:	ee                   	out    %al,(%dx)
80101f87:	89 d8                	mov    %ebx,%eax
80101f89:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f8e:	c1 f8 08             	sar    $0x8,%eax
80101f91:	ee                   	out    %al,(%dx)
80101f92:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f97:	89 f8                	mov    %edi,%eax
80101f99:	ee                   	out    %al,(%dx)
80101f9a:	0f b6 46 04          	movzbl 0x4(%esi),%eax
80101f9e:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fa3:	c1 e0 04             	shl    $0x4,%eax
80101fa6:	83 e0 10             	and    $0x10,%eax
80101fa9:	83 c8 e0             	or     $0xffffffe0,%eax
80101fac:	ee                   	out    %al,(%dx)
80101fad:	f6 06 04             	testb  $0x4,(%esi)
80101fb0:	75 16                	jne    80101fc8 <idestart+0x98>
80101fb2:	b8 20 00 00 00       	mov    $0x20,%eax
80101fb7:	89 ca                	mov    %ecx,%edx
80101fb9:	ee                   	out    %al,(%dx)
80101fba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fbd:	5b                   	pop    %ebx
80101fbe:	5e                   	pop    %esi
80101fbf:	5f                   	pop    %edi
80101fc0:	5d                   	pop    %ebp
80101fc1:	c3                   	ret    
80101fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101fc8:	b8 30 00 00 00       	mov    $0x30,%eax
80101fcd:	89 ca                	mov    %ecx,%edx
80101fcf:	ee                   	out    %al,(%dx)
80101fd0:	b9 80 00 00 00       	mov    $0x80,%ecx
80101fd5:	83 c6 5c             	add    $0x5c,%esi
80101fd8:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101fdd:	fc                   	cld    
80101fde:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101fe0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101fe3:	5b                   	pop    %ebx
80101fe4:	5e                   	pop    %esi
80101fe5:	5f                   	pop    %edi
80101fe6:	5d                   	pop    %ebp
80101fe7:	c3                   	ret    
80101fe8:	83 ec 0c             	sub    $0xc,%esp
80101feb:	68 54 72 10 80       	push   $0x80107254
80101ff0:	e8 9b e3 ff ff       	call   80100390 <panic>
80101ff5:	83 ec 0c             	sub    $0xc,%esp
80101ff8:	68 4b 72 10 80       	push   $0x8010724b
80101ffd:	e8 8e e3 ff ff       	call   80100390 <panic>
80102002:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102010 <ideinit>:
80102010:	55                   	push   %ebp
80102011:	89 e5                	mov    %esp,%ebp
80102013:	83 ec 10             	sub    $0x10,%esp
80102016:	68 66 72 10 80       	push   $0x80107266
8010201b:	68 80 a5 10 80       	push   $0x8010a580
80102020:	e8 0b 23 00 00       	call   80104330 <initlock>
80102025:	58                   	pop    %eax
80102026:	a1 e0 28 11 80       	mov    0x801128e0,%eax
8010202b:	5a                   	pop    %edx
8010202c:	83 e8 01             	sub    $0x1,%eax
8010202f:	50                   	push   %eax
80102030:	6a 0e                	push   $0xe
80102032:	e8 a9 02 00 00       	call   801022e0 <ioapicenable>
80102037:	83 c4 10             	add    $0x10,%esp
8010203a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010203f:	90                   	nop
80102040:	ec                   	in     (%dx),%al
80102041:	83 e0 c0             	and    $0xffffffc0,%eax
80102044:	3c 40                	cmp    $0x40,%al
80102046:	75 f8                	jne    80102040 <ideinit+0x30>
80102048:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010204d:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102052:	ee                   	out    %al,(%dx)
80102053:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102058:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010205d:	eb 06                	jmp    80102065 <ideinit+0x55>
8010205f:	90                   	nop
80102060:	83 e9 01             	sub    $0x1,%ecx
80102063:	74 0f                	je     80102074 <ideinit+0x64>
80102065:	ec                   	in     (%dx),%al
80102066:	84 c0                	test   %al,%al
80102068:	74 f6                	je     80102060 <ideinit+0x50>
8010206a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102071:	00 00 00 
80102074:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102079:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010207e:	ee                   	out    %al,(%dx)
8010207f:	c9                   	leave  
80102080:	c3                   	ret    
80102081:	eb 0d                	jmp    80102090 <ideintr>
80102083:	90                   	nop
80102084:	90                   	nop
80102085:	90                   	nop
80102086:	90                   	nop
80102087:	90                   	nop
80102088:	90                   	nop
80102089:	90                   	nop
8010208a:	90                   	nop
8010208b:	90                   	nop
8010208c:	90                   	nop
8010208d:	90                   	nop
8010208e:	90                   	nop
8010208f:	90                   	nop

80102090 <ideintr>:
80102090:	55                   	push   %ebp
80102091:	89 e5                	mov    %esp,%ebp
80102093:	57                   	push   %edi
80102094:	56                   	push   %esi
80102095:	53                   	push   %ebx
80102096:	83 ec 18             	sub    $0x18,%esp
80102099:	68 80 a5 10 80       	push   $0x8010a580
8010209e:	e8 7d 23 00 00       	call   80104420 <acquire>
801020a3:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
801020a9:	83 c4 10             	add    $0x10,%esp
801020ac:	85 db                	test   %ebx,%ebx
801020ae:	74 67                	je     80102117 <ideintr+0x87>
801020b0:	8b 43 58             	mov    0x58(%ebx),%eax
801020b3:	a3 64 a5 10 80       	mov    %eax,0x8010a564
801020b8:	8b 3b                	mov    (%ebx),%edi
801020ba:	f7 c7 04 00 00 00    	test   $0x4,%edi
801020c0:	75 31                	jne    801020f3 <ideintr+0x63>
801020c2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020c7:	89 f6                	mov    %esi,%esi
801020c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801020d0:	ec                   	in     (%dx),%al
801020d1:	89 c6                	mov    %eax,%esi
801020d3:	83 e6 c0             	and    $0xffffffc0,%esi
801020d6:	89 f1                	mov    %esi,%ecx
801020d8:	80 f9 40             	cmp    $0x40,%cl
801020db:	75 f3                	jne    801020d0 <ideintr+0x40>
801020dd:	a8 21                	test   $0x21,%al
801020df:	75 12                	jne    801020f3 <ideintr+0x63>
801020e1:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801020e4:	b9 80 00 00 00       	mov    $0x80,%ecx
801020e9:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020ee:	fc                   	cld    
801020ef:	f3 6d                	rep insl (%dx),%es:(%edi)
801020f1:	8b 3b                	mov    (%ebx),%edi
801020f3:	83 e7 fb             	and    $0xfffffffb,%edi
801020f6:	83 ec 0c             	sub    $0xc,%esp
801020f9:	89 f9                	mov    %edi,%ecx
801020fb:	83 c9 02             	or     $0x2,%ecx
801020fe:	89 0b                	mov    %ecx,(%ebx)
80102100:	53                   	push   %ebx
80102101:	e8 5a 1e 00 00       	call   80103f60 <wakeup>
80102106:	a1 64 a5 10 80       	mov    0x8010a564,%eax
8010210b:	83 c4 10             	add    $0x10,%esp
8010210e:	85 c0                	test   %eax,%eax
80102110:	74 05                	je     80102117 <ideintr+0x87>
80102112:	e8 19 fe ff ff       	call   80101f30 <idestart>
80102117:	83 ec 0c             	sub    $0xc,%esp
8010211a:	68 80 a5 10 80       	push   $0x8010a580
8010211f:	e8 1c 24 00 00       	call   80104540 <release>
80102124:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102127:	5b                   	pop    %ebx
80102128:	5e                   	pop    %esi
80102129:	5f                   	pop    %edi
8010212a:	5d                   	pop    %ebp
8010212b:	c3                   	ret    
8010212c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102130 <iderw>:
80102130:	55                   	push   %ebp
80102131:	89 e5                	mov    %esp,%ebp
80102133:	53                   	push   %ebx
80102134:	83 ec 10             	sub    $0x10,%esp
80102137:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010213a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010213d:	50                   	push   %eax
8010213e:	e8 bd 21 00 00       	call   80104300 <holdingsleep>
80102143:	83 c4 10             	add    $0x10,%esp
80102146:	85 c0                	test   %eax,%eax
80102148:	0f 84 c6 00 00 00    	je     80102214 <iderw+0xe4>
8010214e:	8b 03                	mov    (%ebx),%eax
80102150:	83 e0 06             	and    $0x6,%eax
80102153:	83 f8 02             	cmp    $0x2,%eax
80102156:	0f 84 ab 00 00 00    	je     80102207 <iderw+0xd7>
8010215c:	8b 53 04             	mov    0x4(%ebx),%edx
8010215f:	85 d2                	test   %edx,%edx
80102161:	74 0d                	je     80102170 <iderw+0x40>
80102163:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102168:	85 c0                	test   %eax,%eax
8010216a:	0f 84 b1 00 00 00    	je     80102221 <iderw+0xf1>
80102170:	83 ec 0c             	sub    $0xc,%esp
80102173:	68 80 a5 10 80       	push   $0x8010a580
80102178:	e8 a3 22 00 00       	call   80104420 <acquire>
8010217d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102183:	83 c4 10             	add    $0x10,%esp
80102186:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010218d:	85 d2                	test   %edx,%edx
8010218f:	75 09                	jne    8010219a <iderw+0x6a>
80102191:	eb 6d                	jmp    80102200 <iderw+0xd0>
80102193:	90                   	nop
80102194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102198:	89 c2                	mov    %eax,%edx
8010219a:	8b 42 58             	mov    0x58(%edx),%eax
8010219d:	85 c0                	test   %eax,%eax
8010219f:	75 f7                	jne    80102198 <iderw+0x68>
801021a1:	83 c2 58             	add    $0x58,%edx
801021a4:	89 1a                	mov    %ebx,(%edx)
801021a6:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
801021ac:	74 42                	je     801021f0 <iderw+0xc0>
801021ae:	8b 03                	mov    (%ebx),%eax
801021b0:	83 e0 06             	and    $0x6,%eax
801021b3:	83 f8 02             	cmp    $0x2,%eax
801021b6:	74 23                	je     801021db <iderw+0xab>
801021b8:	90                   	nop
801021b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021c0:	83 ec 08             	sub    $0x8,%esp
801021c3:	68 80 a5 10 80       	push   $0x8010a580
801021c8:	53                   	push   %ebx
801021c9:	e8 e2 1b 00 00       	call   80103db0 <sleep>
801021ce:	8b 03                	mov    (%ebx),%eax
801021d0:	83 c4 10             	add    $0x10,%esp
801021d3:	83 e0 06             	and    $0x6,%eax
801021d6:	83 f8 02             	cmp    $0x2,%eax
801021d9:	75 e5                	jne    801021c0 <iderw+0x90>
801021db:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
801021e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021e5:	c9                   	leave  
801021e6:	e9 55 23 00 00       	jmp    80104540 <release>
801021eb:	90                   	nop
801021ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801021f0:	89 d8                	mov    %ebx,%eax
801021f2:	e8 39 fd ff ff       	call   80101f30 <idestart>
801021f7:	eb b5                	jmp    801021ae <iderw+0x7e>
801021f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102200:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102205:	eb 9d                	jmp    801021a4 <iderw+0x74>
80102207:	83 ec 0c             	sub    $0xc,%esp
8010220a:	68 80 72 10 80       	push   $0x80107280
8010220f:	e8 7c e1 ff ff       	call   80100390 <panic>
80102214:	83 ec 0c             	sub    $0xc,%esp
80102217:	68 6a 72 10 80       	push   $0x8010726a
8010221c:	e8 6f e1 ff ff       	call   80100390 <panic>
80102221:	83 ec 0c             	sub    $0xc,%esp
80102224:	68 95 72 10 80       	push   $0x80107295
80102229:	e8 62 e1 ff ff       	call   80100390 <panic>
8010222e:	66 90                	xchg   %ax,%ax

80102230 <ioapicinit>:
80102230:	55                   	push   %ebp
80102231:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
80102238:	00 c0 fe 
8010223b:	89 e5                	mov    %esp,%ebp
8010223d:	56                   	push   %esi
8010223e:	53                   	push   %ebx
8010223f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102246:	00 00 00 
80102249:	a1 34 26 11 80       	mov    0x80112634,%eax
8010224e:	8b 58 10             	mov    0x10(%eax),%ebx
80102251:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80102257:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010225d:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
80102264:	c1 eb 10             	shr    $0x10,%ebx
80102267:	8b 41 10             	mov    0x10(%ecx),%eax
8010226a:	0f b6 db             	movzbl %bl,%ebx
8010226d:	c1 e8 18             	shr    $0x18,%eax
80102270:	39 c2                	cmp    %eax,%edx
80102272:	74 16                	je     8010228a <ioapicinit+0x5a>
80102274:	83 ec 0c             	sub    $0xc,%esp
80102277:	68 b4 72 10 80       	push   $0x801072b4
8010227c:	e8 df e3 ff ff       	call   80100660 <cprintf>
80102281:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102287:	83 c4 10             	add    $0x10,%esp
8010228a:	83 c3 21             	add    $0x21,%ebx
8010228d:	ba 10 00 00 00       	mov    $0x10,%edx
80102292:	b8 20 00 00 00       	mov    $0x20,%eax
80102297:	89 f6                	mov    %esi,%esi
80102299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801022a0:	89 11                	mov    %edx,(%ecx)
801022a2:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022a8:	89 c6                	mov    %eax,%esi
801022aa:	81 ce 00 00 01 00    	or     $0x10000,%esi
801022b0:	83 c0 01             	add    $0x1,%eax
801022b3:	89 71 10             	mov    %esi,0x10(%ecx)
801022b6:	8d 72 01             	lea    0x1(%edx),%esi
801022b9:	83 c2 02             	add    $0x2,%edx
801022bc:	39 d8                	cmp    %ebx,%eax
801022be:	89 31                	mov    %esi,(%ecx)
801022c0:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022c6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
801022cd:	75 d1                	jne    801022a0 <ioapicinit+0x70>
801022cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801022d2:	5b                   	pop    %ebx
801022d3:	5e                   	pop    %esi
801022d4:	5d                   	pop    %ebp
801022d5:	c3                   	ret    
801022d6:	8d 76 00             	lea    0x0(%esi),%esi
801022d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022e0 <ioapicenable>:
801022e0:	55                   	push   %ebp
801022e1:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022e7:	89 e5                	mov    %esp,%ebp
801022e9:	8b 45 08             	mov    0x8(%ebp),%eax
801022ec:	8d 50 20             	lea    0x20(%eax),%edx
801022ef:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022f3:	89 01                	mov    %eax,(%ecx)
801022f5:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801022fb:	83 c0 01             	add    $0x1,%eax
801022fe:	89 51 10             	mov    %edx,0x10(%ecx)
80102301:	8b 55 0c             	mov    0xc(%ebp),%edx
80102304:	89 01                	mov    %eax,(%ecx)
80102306:	a1 34 26 11 80       	mov    0x80112634,%eax
8010230b:	c1 e2 18             	shl    $0x18,%edx
8010230e:	89 50 10             	mov    %edx,0x10(%eax)
80102311:	5d                   	pop    %ebp
80102312:	c3                   	ret    
80102313:	66 90                	xchg   %ax,%ax
80102315:	66 90                	xchg   %ax,%ax
80102317:	66 90                	xchg   %ax,%ax
80102319:	66 90                	xchg   %ax,%ax
8010231b:	66 90                	xchg   %ax,%ax
8010231d:	66 90                	xchg   %ax,%ax
8010231f:	90                   	nop

80102320 <kfree>:
80102320:	55                   	push   %ebp
80102321:	89 e5                	mov    %esp,%ebp
80102323:	53                   	push   %ebx
80102324:	83 ec 04             	sub    $0x4,%esp
80102327:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010232a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102330:	75 70                	jne    801023a2 <kfree+0x82>
80102332:	81 fb 88 51 11 80    	cmp    $0x80115188,%ebx
80102338:	72 68                	jb     801023a2 <kfree+0x82>
8010233a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102340:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102345:	77 5b                	ja     801023a2 <kfree+0x82>
80102347:	83 ec 04             	sub    $0x4,%esp
8010234a:	68 00 10 00 00       	push   $0x1000
8010234f:	6a 01                	push   $0x1
80102351:	53                   	push   %ebx
80102352:	e8 49 22 00 00       	call   801045a0 <memset>
80102357:	8b 15 74 26 11 80    	mov    0x80112674,%edx
8010235d:	83 c4 10             	add    $0x10,%esp
80102360:	85 d2                	test   %edx,%edx
80102362:	75 2c                	jne    80102390 <kfree+0x70>
80102364:	a1 78 26 11 80       	mov    0x80112678,%eax
80102369:	89 03                	mov    %eax,(%ebx)
8010236b:	a1 74 26 11 80       	mov    0x80112674,%eax
80102370:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
80102376:	85 c0                	test   %eax,%eax
80102378:	75 06                	jne    80102380 <kfree+0x60>
8010237a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010237d:	c9                   	leave  
8010237e:	c3                   	ret    
8010237f:	90                   	nop
80102380:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
80102387:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010238a:	c9                   	leave  
8010238b:	e9 b0 21 00 00       	jmp    80104540 <release>
80102390:	83 ec 0c             	sub    $0xc,%esp
80102393:	68 40 26 11 80       	push   $0x80112640
80102398:	e8 83 20 00 00       	call   80104420 <acquire>
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	eb c2                	jmp    80102364 <kfree+0x44>
801023a2:	83 ec 0c             	sub    $0xc,%esp
801023a5:	68 e6 72 10 80       	push   $0x801072e6
801023aa:	e8 e1 df ff ff       	call   80100390 <panic>
801023af:	90                   	nop

801023b0 <freerange>:
801023b0:	55                   	push   %ebp
801023b1:	89 e5                	mov    %esp,%ebp
801023b3:	56                   	push   %esi
801023b4:	53                   	push   %ebx
801023b5:	8b 45 08             	mov    0x8(%ebp),%eax
801023b8:	8b 75 0c             	mov    0xc(%ebp),%esi
801023bb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023c1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023c7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023cd:	39 de                	cmp    %ebx,%esi
801023cf:	72 23                	jb     801023f4 <freerange+0x44>
801023d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801023d8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023de:	83 ec 0c             	sub    $0xc,%esp
801023e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023e7:	50                   	push   %eax
801023e8:	e8 33 ff ff ff       	call   80102320 <kfree>
801023ed:	83 c4 10             	add    $0x10,%esp
801023f0:	39 f3                	cmp    %esi,%ebx
801023f2:	76 e4                	jbe    801023d8 <freerange+0x28>
801023f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023f7:	5b                   	pop    %ebx
801023f8:	5e                   	pop    %esi
801023f9:	5d                   	pop    %ebp
801023fa:	c3                   	ret    
801023fb:	90                   	nop
801023fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102400 <kinit1>:
80102400:	55                   	push   %ebp
80102401:	89 e5                	mov    %esp,%ebp
80102403:	56                   	push   %esi
80102404:	53                   	push   %ebx
80102405:	8b 75 0c             	mov    0xc(%ebp),%esi
80102408:	83 ec 08             	sub    $0x8,%esp
8010240b:	68 ec 72 10 80       	push   $0x801072ec
80102410:	68 40 26 11 80       	push   $0x80112640
80102415:	e8 16 1f 00 00       	call   80104330 <initlock>
8010241a:	8b 45 08             	mov    0x8(%ebp),%eax
8010241d:	83 c4 10             	add    $0x10,%esp
80102420:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
80102427:	00 00 00 
8010242a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102430:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102436:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010243c:	39 de                	cmp    %ebx,%esi
8010243e:	72 1c                	jb     8010245c <kinit1+0x5c>
80102440:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102446:	83 ec 0c             	sub    $0xc,%esp
80102449:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010244f:	50                   	push   %eax
80102450:	e8 cb fe ff ff       	call   80102320 <kfree>
80102455:	83 c4 10             	add    $0x10,%esp
80102458:	39 de                	cmp    %ebx,%esi
8010245a:	73 e4                	jae    80102440 <kinit1+0x40>
8010245c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010245f:	5b                   	pop    %ebx
80102460:	5e                   	pop    %esi
80102461:	5d                   	pop    %ebp
80102462:	c3                   	ret    
80102463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102470 <kinit2>:
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	56                   	push   %esi
80102474:	53                   	push   %ebx
80102475:	8b 45 08             	mov    0x8(%ebp),%eax
80102478:	8b 75 0c             	mov    0xc(%ebp),%esi
8010247b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102481:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102487:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010248d:	39 de                	cmp    %ebx,%esi
8010248f:	72 23                	jb     801024b4 <kinit2+0x44>
80102491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102498:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010249e:	83 ec 0c             	sub    $0xc,%esp
801024a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024a7:	50                   	push   %eax
801024a8:	e8 73 fe ff ff       	call   80102320 <kfree>
801024ad:	83 c4 10             	add    $0x10,%esp
801024b0:	39 de                	cmp    %ebx,%esi
801024b2:	73 e4                	jae    80102498 <kinit2+0x28>
801024b4:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
801024bb:	00 00 00 
801024be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024c1:	5b                   	pop    %ebx
801024c2:	5e                   	pop    %esi
801024c3:	5d                   	pop    %ebp
801024c4:	c3                   	ret    
801024c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024d0 <kalloc>:
801024d0:	a1 74 26 11 80       	mov    0x80112674,%eax
801024d5:	85 c0                	test   %eax,%eax
801024d7:	75 1f                	jne    801024f8 <kalloc+0x28>
801024d9:	a1 78 26 11 80       	mov    0x80112678,%eax
801024de:	85 c0                	test   %eax,%eax
801024e0:	74 0e                	je     801024f0 <kalloc+0x20>
801024e2:	8b 10                	mov    (%eax),%edx
801024e4:	89 15 78 26 11 80    	mov    %edx,0x80112678
801024ea:	c3                   	ret    
801024eb:	90                   	nop
801024ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024f0:	f3 c3                	repz ret 
801024f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801024f8:	55                   	push   %ebp
801024f9:	89 e5                	mov    %esp,%ebp
801024fb:	83 ec 24             	sub    $0x24,%esp
801024fe:	68 40 26 11 80       	push   $0x80112640
80102503:	e8 18 1f 00 00       	call   80104420 <acquire>
80102508:	a1 78 26 11 80       	mov    0x80112678,%eax
8010250d:	83 c4 10             	add    $0x10,%esp
80102510:	8b 15 74 26 11 80    	mov    0x80112674,%edx
80102516:	85 c0                	test   %eax,%eax
80102518:	74 08                	je     80102522 <kalloc+0x52>
8010251a:	8b 08                	mov    (%eax),%ecx
8010251c:	89 0d 78 26 11 80    	mov    %ecx,0x80112678
80102522:	85 d2                	test   %edx,%edx
80102524:	74 16                	je     8010253c <kalloc+0x6c>
80102526:	83 ec 0c             	sub    $0xc,%esp
80102529:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010252c:	68 40 26 11 80       	push   $0x80112640
80102531:	e8 0a 20 00 00       	call   80104540 <release>
80102536:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102539:	83 c4 10             	add    $0x10,%esp
8010253c:	c9                   	leave  
8010253d:	c3                   	ret    
8010253e:	66 90                	xchg   %ax,%ax

80102540 <kbdgetc>:
80102540:	ba 64 00 00 00       	mov    $0x64,%edx
80102545:	ec                   	in     (%dx),%al
80102546:	a8 01                	test   $0x1,%al
80102548:	0f 84 c2 00 00 00    	je     80102610 <kbdgetc+0xd0>
8010254e:	ba 60 00 00 00       	mov    $0x60,%edx
80102553:	ec                   	in     (%dx),%al
80102554:	0f b6 d0             	movzbl %al,%edx
80102557:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010255d:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102563:	0f 84 7f 00 00 00    	je     801025e8 <kbdgetc+0xa8>
80102569:	55                   	push   %ebp
8010256a:	89 e5                	mov    %esp,%ebp
8010256c:	53                   	push   %ebx
8010256d:	89 cb                	mov    %ecx,%ebx
8010256f:	83 e3 40             	and    $0x40,%ebx
80102572:	84 c0                	test   %al,%al
80102574:	78 4a                	js     801025c0 <kbdgetc+0x80>
80102576:	85 db                	test   %ebx,%ebx
80102578:	74 09                	je     80102583 <kbdgetc+0x43>
8010257a:	83 c8 80             	or     $0xffffff80,%eax
8010257d:	83 e1 bf             	and    $0xffffffbf,%ecx
80102580:	0f b6 d0             	movzbl %al,%edx
80102583:	0f b6 82 20 74 10 80 	movzbl -0x7fef8be0(%edx),%eax
8010258a:	09 c1                	or     %eax,%ecx
8010258c:	0f b6 82 20 73 10 80 	movzbl -0x7fef8ce0(%edx),%eax
80102593:	31 c1                	xor    %eax,%ecx
80102595:	89 c8                	mov    %ecx,%eax
80102597:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
8010259d:	83 e0 03             	and    $0x3,%eax
801025a0:	83 e1 08             	and    $0x8,%ecx
801025a3:	8b 04 85 00 73 10 80 	mov    -0x7fef8d00(,%eax,4),%eax
801025aa:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
801025ae:	74 31                	je     801025e1 <kbdgetc+0xa1>
801025b0:	8d 50 9f             	lea    -0x61(%eax),%edx
801025b3:	83 fa 19             	cmp    $0x19,%edx
801025b6:	77 40                	ja     801025f8 <kbdgetc+0xb8>
801025b8:	83 e8 20             	sub    $0x20,%eax
801025bb:	5b                   	pop    %ebx
801025bc:	5d                   	pop    %ebp
801025bd:	c3                   	ret    
801025be:	66 90                	xchg   %ax,%ax
801025c0:	83 e0 7f             	and    $0x7f,%eax
801025c3:	85 db                	test   %ebx,%ebx
801025c5:	0f 44 d0             	cmove  %eax,%edx
801025c8:	0f b6 82 20 74 10 80 	movzbl -0x7fef8be0(%edx),%eax
801025cf:	83 c8 40             	or     $0x40,%eax
801025d2:	0f b6 c0             	movzbl %al,%eax
801025d5:	f7 d0                	not    %eax
801025d7:	21 c1                	and    %eax,%ecx
801025d9:	31 c0                	xor    %eax,%eax
801025db:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
801025e1:	5b                   	pop    %ebx
801025e2:	5d                   	pop    %ebp
801025e3:	c3                   	ret    
801025e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025e8:	83 c9 40             	or     $0x40,%ecx
801025eb:	31 c0                	xor    %eax,%eax
801025ed:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
801025f3:	c3                   	ret    
801025f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025f8:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025fb:	8d 50 20             	lea    0x20(%eax),%edx
801025fe:	5b                   	pop    %ebx
801025ff:	83 f9 1a             	cmp    $0x1a,%ecx
80102602:	0f 42 c2             	cmovb  %edx,%eax
80102605:	5d                   	pop    %ebp
80102606:	c3                   	ret    
80102607:	89 f6                	mov    %esi,%esi
80102609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102610:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102615:	c3                   	ret    
80102616:	8d 76 00             	lea    0x0(%esi),%esi
80102619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102620 <kbdintr>:
80102620:	55                   	push   %ebp
80102621:	89 e5                	mov    %esp,%ebp
80102623:	83 ec 14             	sub    $0x14,%esp
80102626:	68 40 25 10 80       	push   $0x80102540
8010262b:	e8 e0 e1 ff ff       	call   80100810 <consoleintr>
80102630:	83 c4 10             	add    $0x10,%esp
80102633:	c9                   	leave  
80102634:	c3                   	ret    
80102635:	66 90                	xchg   %ax,%ax
80102637:	66 90                	xchg   %ax,%ax
80102639:	66 90                	xchg   %ax,%ax
8010263b:	66 90                	xchg   %ax,%ax
8010263d:	66 90                	xchg   %ax,%ax
8010263f:	90                   	nop

80102640 <lapicinit>:
80102640:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102645:	55                   	push   %ebp
80102646:	89 e5                	mov    %esp,%ebp
80102648:	85 c0                	test   %eax,%eax
8010264a:	0f 84 c8 00 00 00    	je     80102718 <lapicinit+0xd8>
80102650:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102657:	01 00 00 
8010265a:	8b 50 20             	mov    0x20(%eax),%edx
8010265d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102664:	00 00 00 
80102667:	8b 50 20             	mov    0x20(%eax),%edx
8010266a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102671:	00 02 00 
80102674:	8b 50 20             	mov    0x20(%eax),%edx
80102677:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010267e:	96 98 00 
80102681:	8b 50 20             	mov    0x20(%eax),%edx
80102684:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010268b:	00 01 00 
8010268e:	8b 50 20             	mov    0x20(%eax),%edx
80102691:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102698:	00 01 00 
8010269b:	8b 50 20             	mov    0x20(%eax),%edx
8010269e:	8b 50 30             	mov    0x30(%eax),%edx
801026a1:	c1 ea 10             	shr    $0x10,%edx
801026a4:	80 fa 03             	cmp    $0x3,%dl
801026a7:	77 77                	ja     80102720 <lapicinit+0xe0>
801026a9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026b0:	00 00 00 
801026b3:	8b 50 20             	mov    0x20(%eax),%edx
801026b6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026bd:	00 00 00 
801026c0:	8b 50 20             	mov    0x20(%eax),%edx
801026c3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ca:	00 00 00 
801026cd:	8b 50 20             	mov    0x20(%eax),%edx
801026d0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026d7:	00 00 00 
801026da:	8b 50 20             	mov    0x20(%eax),%edx
801026dd:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026e4:	00 00 00 
801026e7:	8b 50 20             	mov    0x20(%eax),%edx
801026ea:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026f1:	85 08 00 
801026f4:	8b 50 20             	mov    0x20(%eax),%edx
801026f7:	89 f6                	mov    %esi,%esi
801026f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102700:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102706:	80 e6 10             	and    $0x10,%dh
80102709:	75 f5                	jne    80102700 <lapicinit+0xc0>
8010270b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102712:	00 00 00 
80102715:	8b 40 20             	mov    0x20(%eax),%eax
80102718:	5d                   	pop    %ebp
80102719:	c3                   	ret    
8010271a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102720:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102727:	00 01 00 
8010272a:	8b 50 20             	mov    0x20(%eax),%edx
8010272d:	e9 77 ff ff ff       	jmp    801026a9 <lapicinit+0x69>
80102732:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102740 <lapicid>:
80102740:	8b 15 7c 26 11 80    	mov    0x8011267c,%edx
80102746:	55                   	push   %ebp
80102747:	31 c0                	xor    %eax,%eax
80102749:	89 e5                	mov    %esp,%ebp
8010274b:	85 d2                	test   %edx,%edx
8010274d:	74 06                	je     80102755 <lapicid+0x15>
8010274f:	8b 42 20             	mov    0x20(%edx),%eax
80102752:	c1 e8 18             	shr    $0x18,%eax
80102755:	5d                   	pop    %ebp
80102756:	c3                   	ret    
80102757:	89 f6                	mov    %esi,%esi
80102759:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102760 <lapiceoi>:
80102760:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102765:	55                   	push   %ebp
80102766:	89 e5                	mov    %esp,%ebp
80102768:	85 c0                	test   %eax,%eax
8010276a:	74 0d                	je     80102779 <lapiceoi+0x19>
8010276c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102773:	00 00 00 
80102776:	8b 40 20             	mov    0x20(%eax),%eax
80102779:	5d                   	pop    %ebp
8010277a:	c3                   	ret    
8010277b:	90                   	nop
8010277c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102780 <microdelay>:
80102780:	55                   	push   %ebp
80102781:	89 e5                	mov    %esp,%ebp
80102783:	5d                   	pop    %ebp
80102784:	c3                   	ret    
80102785:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102790 <lapicstartap>:
80102790:	55                   	push   %ebp
80102791:	b8 0f 00 00 00       	mov    $0xf,%eax
80102796:	ba 70 00 00 00       	mov    $0x70,%edx
8010279b:	89 e5                	mov    %esp,%ebp
8010279d:	53                   	push   %ebx
8010279e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801027a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801027a4:	ee                   	out    %al,(%dx)
801027a5:	b8 0a 00 00 00       	mov    $0xa,%eax
801027aa:	ba 71 00 00 00       	mov    $0x71,%edx
801027af:	ee                   	out    %al,(%dx)
801027b0:	31 c0                	xor    %eax,%eax
801027b2:	c1 e3 18             	shl    $0x18,%ebx
801027b5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
801027bb:	89 c8                	mov    %ecx,%eax
801027bd:	c1 e9 0c             	shr    $0xc,%ecx
801027c0:	c1 e8 04             	shr    $0x4,%eax
801027c3:	89 da                	mov    %ebx,%edx
801027c5:	80 cd 06             	or     $0x6,%ch
801027c8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801027ce:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801027d3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
801027d9:	8b 58 20             	mov    0x20(%eax),%ebx
801027dc:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027e3:	c5 00 00 
801027e6:	8b 58 20             	mov    0x20(%eax),%ebx
801027e9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027f0:	85 00 00 
801027f3:	8b 58 20             	mov    0x20(%eax),%ebx
801027f6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027fc:	8b 58 20             	mov    0x20(%eax),%ebx
801027ff:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102805:	8b 58 20             	mov    0x20(%eax),%ebx
80102808:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010280e:	8b 50 20             	mov    0x20(%eax),%edx
80102811:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102817:	8b 40 20             	mov    0x20(%eax),%eax
8010281a:	5b                   	pop    %ebx
8010281b:	5d                   	pop    %ebp
8010281c:	c3                   	ret    
8010281d:	8d 76 00             	lea    0x0(%esi),%esi

80102820 <cmostime>:
80102820:	55                   	push   %ebp
80102821:	b8 0b 00 00 00       	mov    $0xb,%eax
80102826:	ba 70 00 00 00       	mov    $0x70,%edx
8010282b:	89 e5                	mov    %esp,%ebp
8010282d:	57                   	push   %edi
8010282e:	56                   	push   %esi
8010282f:	53                   	push   %ebx
80102830:	83 ec 4c             	sub    $0x4c,%esp
80102833:	ee                   	out    %al,(%dx)
80102834:	ba 71 00 00 00       	mov    $0x71,%edx
80102839:	ec                   	in     (%dx),%al
8010283a:	83 e0 04             	and    $0x4,%eax
8010283d:	bb 70 00 00 00       	mov    $0x70,%ebx
80102842:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102845:	8d 76 00             	lea    0x0(%esi),%esi
80102848:	31 c0                	xor    %eax,%eax
8010284a:	89 da                	mov    %ebx,%edx
8010284c:	ee                   	out    %al,(%dx)
8010284d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102852:	89 ca                	mov    %ecx,%edx
80102854:	ec                   	in     (%dx),%al
80102855:	88 45 b7             	mov    %al,-0x49(%ebp)
80102858:	89 da                	mov    %ebx,%edx
8010285a:	b8 02 00 00 00       	mov    $0x2,%eax
8010285f:	ee                   	out    %al,(%dx)
80102860:	89 ca                	mov    %ecx,%edx
80102862:	ec                   	in     (%dx),%al
80102863:	88 45 b6             	mov    %al,-0x4a(%ebp)
80102866:	89 da                	mov    %ebx,%edx
80102868:	b8 04 00 00 00       	mov    $0x4,%eax
8010286d:	ee                   	out    %al,(%dx)
8010286e:	89 ca                	mov    %ecx,%edx
80102870:	ec                   	in     (%dx),%al
80102871:	88 45 b5             	mov    %al,-0x4b(%ebp)
80102874:	89 da                	mov    %ebx,%edx
80102876:	b8 07 00 00 00       	mov    $0x7,%eax
8010287b:	ee                   	out    %al,(%dx)
8010287c:	89 ca                	mov    %ecx,%edx
8010287e:	ec                   	in     (%dx),%al
8010287f:	88 45 b4             	mov    %al,-0x4c(%ebp)
80102882:	89 da                	mov    %ebx,%edx
80102884:	b8 08 00 00 00       	mov    $0x8,%eax
80102889:	ee                   	out    %al,(%dx)
8010288a:	89 ca                	mov    %ecx,%edx
8010288c:	ec                   	in     (%dx),%al
8010288d:	89 c7                	mov    %eax,%edi
8010288f:	89 da                	mov    %ebx,%edx
80102891:	b8 09 00 00 00       	mov    $0x9,%eax
80102896:	ee                   	out    %al,(%dx)
80102897:	89 ca                	mov    %ecx,%edx
80102899:	ec                   	in     (%dx),%al
8010289a:	89 c6                	mov    %eax,%esi
8010289c:	89 da                	mov    %ebx,%edx
8010289e:	b8 0a 00 00 00       	mov    $0xa,%eax
801028a3:	ee                   	out    %al,(%dx)
801028a4:	89 ca                	mov    %ecx,%edx
801028a6:	ec                   	in     (%dx),%al
801028a7:	84 c0                	test   %al,%al
801028a9:	78 9d                	js     80102848 <cmostime+0x28>
801028ab:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
801028af:	89 fa                	mov    %edi,%edx
801028b1:	0f b6 fa             	movzbl %dl,%edi
801028b4:	89 f2                	mov    %esi,%edx
801028b6:	0f b6 f2             	movzbl %dl,%esi
801028b9:	89 7d c8             	mov    %edi,-0x38(%ebp)
801028bc:	89 da                	mov    %ebx,%edx
801028be:	89 75 cc             	mov    %esi,-0x34(%ebp)
801028c1:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028c4:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
801028c8:	89 45 bc             	mov    %eax,-0x44(%ebp)
801028cb:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
801028cf:	89 45 c0             	mov    %eax,-0x40(%ebp)
801028d2:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
801028d6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801028d9:	31 c0                	xor    %eax,%eax
801028db:	ee                   	out    %al,(%dx)
801028dc:	89 ca                	mov    %ecx,%edx
801028de:	ec                   	in     (%dx),%al
801028df:	0f b6 c0             	movzbl %al,%eax
801028e2:	89 da                	mov    %ebx,%edx
801028e4:	89 45 d0             	mov    %eax,-0x30(%ebp)
801028e7:	b8 02 00 00 00       	mov    $0x2,%eax
801028ec:	ee                   	out    %al,(%dx)
801028ed:	89 ca                	mov    %ecx,%edx
801028ef:	ec                   	in     (%dx),%al
801028f0:	0f b6 c0             	movzbl %al,%eax
801028f3:	89 da                	mov    %ebx,%edx
801028f5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028f8:	b8 04 00 00 00       	mov    $0x4,%eax
801028fd:	ee                   	out    %al,(%dx)
801028fe:	89 ca                	mov    %ecx,%edx
80102900:	ec                   	in     (%dx),%al
80102901:	0f b6 c0             	movzbl %al,%eax
80102904:	89 da                	mov    %ebx,%edx
80102906:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102909:	b8 07 00 00 00       	mov    $0x7,%eax
8010290e:	ee                   	out    %al,(%dx)
8010290f:	89 ca                	mov    %ecx,%edx
80102911:	ec                   	in     (%dx),%al
80102912:	0f b6 c0             	movzbl %al,%eax
80102915:	89 da                	mov    %ebx,%edx
80102917:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010291a:	b8 08 00 00 00       	mov    $0x8,%eax
8010291f:	ee                   	out    %al,(%dx)
80102920:	89 ca                	mov    %ecx,%edx
80102922:	ec                   	in     (%dx),%al
80102923:	0f b6 c0             	movzbl %al,%eax
80102926:	89 da                	mov    %ebx,%edx
80102928:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010292b:	b8 09 00 00 00       	mov    $0x9,%eax
80102930:	ee                   	out    %al,(%dx)
80102931:	89 ca                	mov    %ecx,%edx
80102933:	ec                   	in     (%dx),%al
80102934:	0f b6 c0             	movzbl %al,%eax
80102937:	83 ec 04             	sub    $0x4,%esp
8010293a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010293d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102940:	6a 18                	push   $0x18
80102942:	50                   	push   %eax
80102943:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102946:	50                   	push   %eax
80102947:	e8 a4 1c 00 00       	call   801045f0 <memcmp>
8010294c:	83 c4 10             	add    $0x10,%esp
8010294f:	85 c0                	test   %eax,%eax
80102951:	0f 85 f1 fe ff ff    	jne    80102848 <cmostime+0x28>
80102957:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
8010295b:	75 78                	jne    801029d5 <cmostime+0x1b5>
8010295d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102960:	89 c2                	mov    %eax,%edx
80102962:	83 e0 0f             	and    $0xf,%eax
80102965:	c1 ea 04             	shr    $0x4,%edx
80102968:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010296b:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010296e:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102971:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102974:	89 c2                	mov    %eax,%edx
80102976:	83 e0 0f             	and    $0xf,%eax
80102979:	c1 ea 04             	shr    $0x4,%edx
8010297c:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010297f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102982:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102985:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102988:	89 c2                	mov    %eax,%edx
8010298a:	83 e0 0f             	and    $0xf,%eax
8010298d:	c1 ea 04             	shr    $0x4,%edx
80102990:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102993:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102996:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102999:	8b 45 c4             	mov    -0x3c(%ebp),%eax
8010299c:	89 c2                	mov    %eax,%edx
8010299e:	83 e0 0f             	and    $0xf,%eax
801029a1:	c1 ea 04             	shr    $0x4,%edx
801029a4:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029a7:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029aa:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801029ad:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029b0:	89 c2                	mov    %eax,%edx
801029b2:	83 e0 0f             	and    $0xf,%eax
801029b5:	c1 ea 04             	shr    $0x4,%edx
801029b8:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029bb:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029be:	89 45 c8             	mov    %eax,-0x38(%ebp)
801029c1:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029c4:	89 c2                	mov    %eax,%edx
801029c6:	83 e0 0f             	and    $0xf,%eax
801029c9:	c1 ea 04             	shr    $0x4,%edx
801029cc:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029cf:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029d2:	89 45 cc             	mov    %eax,-0x34(%ebp)
801029d5:	8b 75 08             	mov    0x8(%ebp),%esi
801029d8:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029db:	89 06                	mov    %eax,(%esi)
801029dd:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029e0:	89 46 04             	mov    %eax,0x4(%esi)
801029e3:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029e6:	89 46 08             	mov    %eax,0x8(%esi)
801029e9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029ec:	89 46 0c             	mov    %eax,0xc(%esi)
801029ef:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029f2:	89 46 10             	mov    %eax,0x10(%esi)
801029f5:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029f8:	89 46 14             	mov    %eax,0x14(%esi)
801029fb:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
80102a02:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a05:	5b                   	pop    %ebx
80102a06:	5e                   	pop    %esi
80102a07:	5f                   	pop    %edi
80102a08:	5d                   	pop    %ebp
80102a09:	c3                   	ret    
80102a0a:	66 90                	xchg   %ax,%ax
80102a0c:	66 90                	xchg   %ax,%ax
80102a0e:	66 90                	xchg   %ax,%ax

80102a10 <install_trans>:
80102a10:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102a16:	85 c9                	test   %ecx,%ecx
80102a18:	0f 8e 8a 00 00 00    	jle    80102aa8 <install_trans+0x98>
80102a1e:	55                   	push   %ebp
80102a1f:	89 e5                	mov    %esp,%ebp
80102a21:	57                   	push   %edi
80102a22:	56                   	push   %esi
80102a23:	53                   	push   %ebx
80102a24:	31 db                	xor    %ebx,%ebx
80102a26:	83 ec 0c             	sub    $0xc,%esp
80102a29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a30:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102a35:	83 ec 08             	sub    $0x8,%esp
80102a38:	01 d8                	add    %ebx,%eax
80102a3a:	83 c0 01             	add    $0x1,%eax
80102a3d:	50                   	push   %eax
80102a3e:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102a44:	e8 87 d6 ff ff       	call   801000d0 <bread>
80102a49:	89 c7                	mov    %eax,%edi
80102a4b:	58                   	pop    %eax
80102a4c:	5a                   	pop    %edx
80102a4d:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102a54:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102a5a:	83 c3 01             	add    $0x1,%ebx
80102a5d:	e8 6e d6 ff ff       	call   801000d0 <bread>
80102a62:	89 c6                	mov    %eax,%esi
80102a64:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a67:	83 c4 0c             	add    $0xc,%esp
80102a6a:	68 00 02 00 00       	push   $0x200
80102a6f:	50                   	push   %eax
80102a70:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a73:	50                   	push   %eax
80102a74:	e8 d7 1b 00 00       	call   80104650 <memmove>
80102a79:	89 34 24             	mov    %esi,(%esp)
80102a7c:	e8 1f d7 ff ff       	call   801001a0 <bwrite>
80102a81:	89 3c 24             	mov    %edi,(%esp)
80102a84:	e8 57 d7 ff ff       	call   801001e0 <brelse>
80102a89:	89 34 24             	mov    %esi,(%esp)
80102a8c:	e8 4f d7 ff ff       	call   801001e0 <brelse>
80102a91:	83 c4 10             	add    $0x10,%esp
80102a94:	39 1d c8 26 11 80    	cmp    %ebx,0x801126c8
80102a9a:	7f 94                	jg     80102a30 <install_trans+0x20>
80102a9c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a9f:	5b                   	pop    %ebx
80102aa0:	5e                   	pop    %esi
80102aa1:	5f                   	pop    %edi
80102aa2:	5d                   	pop    %ebp
80102aa3:	c3                   	ret    
80102aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102aa8:	f3 c3                	repz ret 
80102aaa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102ab0 <write_head>:
80102ab0:	55                   	push   %ebp
80102ab1:	89 e5                	mov    %esp,%ebp
80102ab3:	56                   	push   %esi
80102ab4:	53                   	push   %ebx
80102ab5:	83 ec 08             	sub    $0x8,%esp
80102ab8:	ff 35 b4 26 11 80    	pushl  0x801126b4
80102abe:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102ac4:	e8 07 d6 ff ff       	call   801000d0 <bread>
80102ac9:	8b 1d c8 26 11 80    	mov    0x801126c8,%ebx
80102acf:	83 c4 10             	add    $0x10,%esp
80102ad2:	89 c6                	mov    %eax,%esi
80102ad4:	85 db                	test   %ebx,%ebx
80102ad6:	89 58 5c             	mov    %ebx,0x5c(%eax)
80102ad9:	7e 16                	jle    80102af1 <write_head+0x41>
80102adb:	c1 e3 02             	shl    $0x2,%ebx
80102ade:	31 d2                	xor    %edx,%edx
80102ae0:	8b 8a cc 26 11 80    	mov    -0x7feed934(%edx),%ecx
80102ae6:	89 4c 16 60          	mov    %ecx,0x60(%esi,%edx,1)
80102aea:	83 c2 04             	add    $0x4,%edx
80102aed:	39 da                	cmp    %ebx,%edx
80102aef:	75 ef                	jne    80102ae0 <write_head+0x30>
80102af1:	83 ec 0c             	sub    $0xc,%esp
80102af4:	56                   	push   %esi
80102af5:	e8 a6 d6 ff ff       	call   801001a0 <bwrite>
80102afa:	89 34 24             	mov    %esi,(%esp)
80102afd:	e8 de d6 ff ff       	call   801001e0 <brelse>
80102b02:	83 c4 10             	add    $0x10,%esp
80102b05:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102b08:	5b                   	pop    %ebx
80102b09:	5e                   	pop    %esi
80102b0a:	5d                   	pop    %ebp
80102b0b:	c3                   	ret    
80102b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102b10 <initlog>:
80102b10:	55                   	push   %ebp
80102b11:	89 e5                	mov    %esp,%ebp
80102b13:	53                   	push   %ebx
80102b14:	83 ec 2c             	sub    $0x2c,%esp
80102b17:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102b1a:	68 20 75 10 80       	push   $0x80107520
80102b1f:	68 80 26 11 80       	push   $0x80112680
80102b24:	e8 07 18 00 00       	call   80104330 <initlock>
80102b29:	58                   	pop    %eax
80102b2a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b2d:	5a                   	pop    %edx
80102b2e:	50                   	push   %eax
80102b2f:	53                   	push   %ebx
80102b30:	e8 9b e8 ff ff       	call   801013d0 <readsb>
80102b35:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102b38:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102b3b:	59                   	pop    %ecx
80102b3c:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4
80102b42:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
80102b48:	a3 b4 26 11 80       	mov    %eax,0x801126b4
80102b4d:	5a                   	pop    %edx
80102b4e:	50                   	push   %eax
80102b4f:	53                   	push   %ebx
80102b50:	e8 7b d5 ff ff       	call   801000d0 <bread>
80102b55:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102b58:	83 c4 10             	add    $0x10,%esp
80102b5b:	85 db                	test   %ebx,%ebx
80102b5d:	89 1d c8 26 11 80    	mov    %ebx,0x801126c8
80102b63:	7e 1c                	jle    80102b81 <initlog+0x71>
80102b65:	c1 e3 02             	shl    $0x2,%ebx
80102b68:	31 d2                	xor    %edx,%edx
80102b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b70:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b74:	83 c2 04             	add    $0x4,%edx
80102b77:	89 8a c8 26 11 80    	mov    %ecx,-0x7feed938(%edx)
80102b7d:	39 d3                	cmp    %edx,%ebx
80102b7f:	75 ef                	jne    80102b70 <initlog+0x60>
80102b81:	83 ec 0c             	sub    $0xc,%esp
80102b84:	50                   	push   %eax
80102b85:	e8 56 d6 ff ff       	call   801001e0 <brelse>
80102b8a:	e8 81 fe ff ff       	call   80102a10 <install_trans>
80102b8f:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102b96:	00 00 00 
80102b99:	e8 12 ff ff ff       	call   80102ab0 <write_head>
80102b9e:	83 c4 10             	add    $0x10,%esp
80102ba1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102ba4:	c9                   	leave  
80102ba5:	c3                   	ret    
80102ba6:	8d 76 00             	lea    0x0(%esi),%esi
80102ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102bb0 <begin_op>:
80102bb0:	55                   	push   %ebp
80102bb1:	89 e5                	mov    %esp,%ebp
80102bb3:	83 ec 14             	sub    $0x14,%esp
80102bb6:	68 80 26 11 80       	push   $0x80112680
80102bbb:	e8 60 18 00 00       	call   80104420 <acquire>
80102bc0:	83 c4 10             	add    $0x10,%esp
80102bc3:	eb 18                	jmp    80102bdd <begin_op+0x2d>
80102bc5:	8d 76 00             	lea    0x0(%esi),%esi
80102bc8:	83 ec 08             	sub    $0x8,%esp
80102bcb:	68 80 26 11 80       	push   $0x80112680
80102bd0:	68 80 26 11 80       	push   $0x80112680
80102bd5:	e8 d6 11 00 00       	call   80103db0 <sleep>
80102bda:	83 c4 10             	add    $0x10,%esp
80102bdd:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102be2:	85 c0                	test   %eax,%eax
80102be4:	75 e2                	jne    80102bc8 <begin_op+0x18>
80102be6:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102beb:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102bf1:	83 c0 01             	add    $0x1,%eax
80102bf4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bf7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bfa:	83 fa 1e             	cmp    $0x1e,%edx
80102bfd:	7f c9                	jg     80102bc8 <begin_op+0x18>
80102bff:	83 ec 0c             	sub    $0xc,%esp
80102c02:	a3 bc 26 11 80       	mov    %eax,0x801126bc
80102c07:	68 80 26 11 80       	push   $0x80112680
80102c0c:	e8 2f 19 00 00       	call   80104540 <release>
80102c11:	83 c4 10             	add    $0x10,%esp
80102c14:	c9                   	leave  
80102c15:	c3                   	ret    
80102c16:	8d 76 00             	lea    0x0(%esi),%esi
80102c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c20 <end_op>:
80102c20:	55                   	push   %ebp
80102c21:	89 e5                	mov    %esp,%ebp
80102c23:	57                   	push   %edi
80102c24:	56                   	push   %esi
80102c25:	53                   	push   %ebx
80102c26:	83 ec 18             	sub    $0x18,%esp
80102c29:	68 80 26 11 80       	push   $0x80112680
80102c2e:	e8 ed 17 00 00       	call   80104420 <acquire>
80102c33:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102c38:	8b 35 c0 26 11 80    	mov    0x801126c0,%esi
80102c3e:	83 c4 10             	add    $0x10,%esp
80102c41:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102c44:	85 f6                	test   %esi,%esi
80102c46:	89 1d bc 26 11 80    	mov    %ebx,0x801126bc
80102c4c:	0f 85 1a 01 00 00    	jne    80102d6c <end_op+0x14c>
80102c52:	85 db                	test   %ebx,%ebx
80102c54:	0f 85 ee 00 00 00    	jne    80102d48 <end_op+0x128>
80102c5a:	83 ec 0c             	sub    $0xc,%esp
80102c5d:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102c64:	00 00 00 
80102c67:	68 80 26 11 80       	push   $0x80112680
80102c6c:	e8 cf 18 00 00       	call   80104540 <release>
80102c71:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102c77:	83 c4 10             	add    $0x10,%esp
80102c7a:	85 c9                	test   %ecx,%ecx
80102c7c:	0f 8e 85 00 00 00    	jle    80102d07 <end_op+0xe7>
80102c82:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102c87:	83 ec 08             	sub    $0x8,%esp
80102c8a:	01 d8                	add    %ebx,%eax
80102c8c:	83 c0 01             	add    $0x1,%eax
80102c8f:	50                   	push   %eax
80102c90:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102c96:	e8 35 d4 ff ff       	call   801000d0 <bread>
80102c9b:	89 c6                	mov    %eax,%esi
80102c9d:	58                   	pop    %eax
80102c9e:	5a                   	pop    %edx
80102c9f:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102ca6:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102cac:	83 c3 01             	add    $0x1,%ebx
80102caf:	e8 1c d4 ff ff       	call   801000d0 <bread>
80102cb4:	89 c7                	mov    %eax,%edi
80102cb6:	8d 40 5c             	lea    0x5c(%eax),%eax
80102cb9:	83 c4 0c             	add    $0xc,%esp
80102cbc:	68 00 02 00 00       	push   $0x200
80102cc1:	50                   	push   %eax
80102cc2:	8d 46 5c             	lea    0x5c(%esi),%eax
80102cc5:	50                   	push   %eax
80102cc6:	e8 85 19 00 00       	call   80104650 <memmove>
80102ccb:	89 34 24             	mov    %esi,(%esp)
80102cce:	e8 cd d4 ff ff       	call   801001a0 <bwrite>
80102cd3:	89 3c 24             	mov    %edi,(%esp)
80102cd6:	e8 05 d5 ff ff       	call   801001e0 <brelse>
80102cdb:	89 34 24             	mov    %esi,(%esp)
80102cde:	e8 fd d4 ff ff       	call   801001e0 <brelse>
80102ce3:	83 c4 10             	add    $0x10,%esp
80102ce6:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102cec:	7c 94                	jl     80102c82 <end_op+0x62>
80102cee:	e8 bd fd ff ff       	call   80102ab0 <write_head>
80102cf3:	e8 18 fd ff ff       	call   80102a10 <install_trans>
80102cf8:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102cff:	00 00 00 
80102d02:	e8 a9 fd ff ff       	call   80102ab0 <write_head>
80102d07:	83 ec 0c             	sub    $0xc,%esp
80102d0a:	68 80 26 11 80       	push   $0x80112680
80102d0f:	e8 0c 17 00 00       	call   80104420 <acquire>
80102d14:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102d1b:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102d22:	00 00 00 
80102d25:	e8 36 12 00 00       	call   80103f60 <wakeup>
80102d2a:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102d31:	e8 0a 18 00 00       	call   80104540 <release>
80102d36:	83 c4 10             	add    $0x10,%esp
80102d39:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d3c:	5b                   	pop    %ebx
80102d3d:	5e                   	pop    %esi
80102d3e:	5f                   	pop    %edi
80102d3f:	5d                   	pop    %ebp
80102d40:	c3                   	ret    
80102d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102d48:	83 ec 0c             	sub    $0xc,%esp
80102d4b:	68 80 26 11 80       	push   $0x80112680
80102d50:	e8 0b 12 00 00       	call   80103f60 <wakeup>
80102d55:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102d5c:	e8 df 17 00 00       	call   80104540 <release>
80102d61:	83 c4 10             	add    $0x10,%esp
80102d64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d67:	5b                   	pop    %ebx
80102d68:	5e                   	pop    %esi
80102d69:	5f                   	pop    %edi
80102d6a:	5d                   	pop    %ebp
80102d6b:	c3                   	ret    
80102d6c:	83 ec 0c             	sub    $0xc,%esp
80102d6f:	68 24 75 10 80       	push   $0x80107524
80102d74:	e8 17 d6 ff ff       	call   80100390 <panic>
80102d79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102d80 <log_write>:
80102d80:	55                   	push   %ebp
80102d81:	89 e5                	mov    %esp,%ebp
80102d83:	53                   	push   %ebx
80102d84:	83 ec 04             	sub    $0x4,%esp
80102d87:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d8d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d90:	83 fa 1d             	cmp    $0x1d,%edx
80102d93:	0f 8f 9d 00 00 00    	jg     80102e36 <log_write+0xb6>
80102d99:	a1 b8 26 11 80       	mov    0x801126b8,%eax
80102d9e:	83 e8 01             	sub    $0x1,%eax
80102da1:	39 c2                	cmp    %eax,%edx
80102da3:	0f 8d 8d 00 00 00    	jge    80102e36 <log_write+0xb6>
80102da9:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102dae:	85 c0                	test   %eax,%eax
80102db0:	0f 8e 8d 00 00 00    	jle    80102e43 <log_write+0xc3>
80102db6:	83 ec 0c             	sub    $0xc,%esp
80102db9:	68 80 26 11 80       	push   $0x80112680
80102dbe:	e8 5d 16 00 00       	call   80104420 <acquire>
80102dc3:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102dc9:	83 c4 10             	add    $0x10,%esp
80102dcc:	83 f9 00             	cmp    $0x0,%ecx
80102dcf:	7e 57                	jle    80102e28 <log_write+0xa8>
80102dd1:	8b 53 08             	mov    0x8(%ebx),%edx
80102dd4:	31 c0                	xor    %eax,%eax
80102dd6:	3b 15 cc 26 11 80    	cmp    0x801126cc,%edx
80102ddc:	75 0b                	jne    80102de9 <log_write+0x69>
80102dde:	eb 38                	jmp    80102e18 <log_write+0x98>
80102de0:	39 14 85 cc 26 11 80 	cmp    %edx,-0x7feed934(,%eax,4)
80102de7:	74 2f                	je     80102e18 <log_write+0x98>
80102de9:	83 c0 01             	add    $0x1,%eax
80102dec:	39 c1                	cmp    %eax,%ecx
80102dee:	75 f0                	jne    80102de0 <log_write+0x60>
80102df0:	89 14 85 cc 26 11 80 	mov    %edx,-0x7feed934(,%eax,4)
80102df7:	83 c0 01             	add    $0x1,%eax
80102dfa:	a3 c8 26 11 80       	mov    %eax,0x801126c8
80102dff:	83 0b 04             	orl    $0x4,(%ebx)
80102e02:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
80102e09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e0c:	c9                   	leave  
80102e0d:	e9 2e 17 00 00       	jmp    80104540 <release>
80102e12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102e18:	89 14 85 cc 26 11 80 	mov    %edx,-0x7feed934(,%eax,4)
80102e1f:	eb de                	jmp    80102dff <log_write+0x7f>
80102e21:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102e28:	8b 43 08             	mov    0x8(%ebx),%eax
80102e2b:	a3 cc 26 11 80       	mov    %eax,0x801126cc
80102e30:	75 cd                	jne    80102dff <log_write+0x7f>
80102e32:	31 c0                	xor    %eax,%eax
80102e34:	eb c1                	jmp    80102df7 <log_write+0x77>
80102e36:	83 ec 0c             	sub    $0xc,%esp
80102e39:	68 33 75 10 80       	push   $0x80107533
80102e3e:	e8 4d d5 ff ff       	call   80100390 <panic>
80102e43:	83 ec 0c             	sub    $0xc,%esp
80102e46:	68 49 75 10 80       	push   $0x80107549
80102e4b:	e8 40 d5 ff ff       	call   80100390 <panic>

80102e50 <mpmain>:
80102e50:	55                   	push   %ebp
80102e51:	89 e5                	mov    %esp,%ebp
80102e53:	53                   	push   %ebx
80102e54:	83 ec 04             	sub    $0x4,%esp
80102e57:	e8 74 09 00 00       	call   801037d0 <cpuid>
80102e5c:	89 c3                	mov    %eax,%ebx
80102e5e:	e8 6d 09 00 00       	call   801037d0 <cpuid>
80102e63:	83 ec 04             	sub    $0x4,%esp
80102e66:	53                   	push   %ebx
80102e67:	50                   	push   %eax
80102e68:	68 64 75 10 80       	push   $0x80107564
80102e6d:	e8 ee d7 ff ff       	call   80100660 <cprintf>
80102e72:	e8 29 2a 00 00       	call   801058a0 <idtinit>
80102e77:	e8 e4 08 00 00       	call   80103760 <mycpu>
80102e7c:	89 c2                	mov    %eax,%edx
80102e7e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e83:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102e8a:	e8 21 0c 00 00       	call   80103ab0 <scheduler>
80102e8f:	90                   	nop

80102e90 <mpenter>:
80102e90:	55                   	push   %ebp
80102e91:	89 e5                	mov    %esp,%ebp
80102e93:	83 ec 08             	sub    $0x8,%esp
80102e96:	e8 f5 3a 00 00       	call   80106990 <switchkvm>
80102e9b:	e8 60 3a 00 00       	call   80106900 <seginit>
80102ea0:	e8 9b f7 ff ff       	call   80102640 <lapicinit>
80102ea5:	e8 a6 ff ff ff       	call   80102e50 <mpmain>
80102eaa:	66 90                	xchg   %ax,%ax
80102eac:	66 90                	xchg   %ax,%ax
80102eae:	66 90                	xchg   %ax,%ax

80102eb0 <main>:
80102eb0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102eb4:	83 e4 f0             	and    $0xfffffff0,%esp
80102eb7:	ff 71 fc             	pushl  -0x4(%ecx)
80102eba:	55                   	push   %ebp
80102ebb:	89 e5                	mov    %esp,%ebp
80102ebd:	53                   	push   %ebx
80102ebe:	51                   	push   %ecx
80102ebf:	83 ec 08             	sub    $0x8,%esp
80102ec2:	68 00 00 40 80       	push   $0x80400000
80102ec7:	68 88 51 11 80       	push   $0x80115188
80102ecc:	e8 2f f5 ff ff       	call   80102400 <kinit1>
80102ed1:	e8 8a 3f 00 00       	call   80106e60 <kvmalloc>
80102ed6:	e8 75 01 00 00       	call   80103050 <mpinit>
80102edb:	e8 60 f7 ff ff       	call   80102640 <lapicinit>
80102ee0:	e8 1b 3a 00 00       	call   80106900 <seginit>
80102ee5:	e8 46 03 00 00       	call   80103230 <picinit>
80102eea:	e8 41 f3 ff ff       	call   80102230 <ioapicinit>
80102eef:	e8 cc da ff ff       	call   801009c0 <consoleinit>
80102ef4:	e8 d7 2c 00 00       	call   80105bd0 <uartinit>
80102ef9:	e8 42 08 00 00       	call   80103740 <pinit>
80102efe:	e8 1d 29 00 00       	call   80105820 <tvinit>
80102f03:	e8 38 d1 ff ff       	call   80100040 <binit>
80102f08:	e8 53 de ff ff       	call   80100d60 <fileinit>
80102f0d:	e8 fe f0 ff ff       	call   80102010 <ideinit>
80102f12:	83 c4 0c             	add    $0xc,%esp
80102f15:	68 8a 00 00 00       	push   $0x8a
80102f1a:	68 8c a4 10 80       	push   $0x8010a48c
80102f1f:	68 00 70 00 80       	push   $0x80007000
80102f24:	e8 27 17 00 00       	call   80104650 <memmove>
80102f29:	69 05 e0 28 11 80 b0 	imul   $0xb0,0x801128e0,%eax
80102f30:	00 00 00 
80102f33:	83 c4 10             	add    $0x10,%esp
80102f36:	05 80 27 11 80       	add    $0x80112780,%eax
80102f3b:	3d 80 27 11 80       	cmp    $0x80112780,%eax
80102f40:	76 71                	jbe    80102fb3 <main+0x103>
80102f42:	bb 80 27 11 80       	mov    $0x80112780,%ebx
80102f47:	89 f6                	mov    %esi,%esi
80102f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102f50:	e8 0b 08 00 00       	call   80103760 <mycpu>
80102f55:	39 d8                	cmp    %ebx,%eax
80102f57:	74 41                	je     80102f9a <main+0xea>
80102f59:	e8 72 f5 ff ff       	call   801024d0 <kalloc>
80102f5e:	05 00 10 00 00       	add    $0x1000,%eax
80102f63:	c7 05 f8 6f 00 80 90 	movl   $0x80102e90,0x80006ff8
80102f6a:	2e 10 80 
80102f6d:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80102f74:	90 10 00 
80102f77:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102f7c:	0f b6 03             	movzbl (%ebx),%eax
80102f7f:	83 ec 08             	sub    $0x8,%esp
80102f82:	68 00 70 00 00       	push   $0x7000
80102f87:	50                   	push   %eax
80102f88:	e8 03 f8 ff ff       	call   80102790 <lapicstartap>
80102f8d:	83 c4 10             	add    $0x10,%esp
80102f90:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f96:	85 c0                	test   %eax,%eax
80102f98:	74 f6                	je     80102f90 <main+0xe0>
80102f9a:	69 05 e0 28 11 80 b0 	imul   $0xb0,0x801128e0,%eax
80102fa1:	00 00 00 
80102fa4:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102faa:	05 80 27 11 80       	add    $0x80112780,%eax
80102faf:	39 c3                	cmp    %eax,%ebx
80102fb1:	72 9d                	jb     80102f50 <main+0xa0>
80102fb3:	83 ec 08             	sub    $0x8,%esp
80102fb6:	68 00 00 00 8e       	push   $0x8e000000
80102fbb:	68 00 00 40 80       	push   $0x80400000
80102fc0:	e8 ab f4 ff ff       	call   80102470 <kinit2>
80102fc5:	e8 56 08 00 00       	call   80103820 <userinit>
80102fca:	e8 81 fe ff ff       	call   80102e50 <mpmain>
80102fcf:	90                   	nop

80102fd0 <mpsearch1>:
80102fd0:	55                   	push   %ebp
80102fd1:	89 e5                	mov    %esp,%ebp
80102fd3:	57                   	push   %edi
80102fd4:	56                   	push   %esi
80102fd5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102fdb:	53                   	push   %ebx
80102fdc:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
80102fdf:	83 ec 0c             	sub    $0xc,%esp
80102fe2:	39 de                	cmp    %ebx,%esi
80102fe4:	72 10                	jb     80102ff6 <mpsearch1+0x26>
80102fe6:	eb 50                	jmp    80103038 <mpsearch1+0x68>
80102fe8:	90                   	nop
80102fe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102ff0:	39 fb                	cmp    %edi,%ebx
80102ff2:	89 fe                	mov    %edi,%esi
80102ff4:	76 42                	jbe    80103038 <mpsearch1+0x68>
80102ff6:	83 ec 04             	sub    $0x4,%esp
80102ff9:	8d 7e 10             	lea    0x10(%esi),%edi
80102ffc:	6a 04                	push   $0x4
80102ffe:	68 78 75 10 80       	push   $0x80107578
80103003:	56                   	push   %esi
80103004:	e8 e7 15 00 00       	call   801045f0 <memcmp>
80103009:	83 c4 10             	add    $0x10,%esp
8010300c:	85 c0                	test   %eax,%eax
8010300e:	75 e0                	jne    80102ff0 <mpsearch1+0x20>
80103010:	89 f1                	mov    %esi,%ecx
80103012:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103018:	0f b6 11             	movzbl (%ecx),%edx
8010301b:	83 c1 01             	add    $0x1,%ecx
8010301e:	01 d0                	add    %edx,%eax
80103020:	39 f9                	cmp    %edi,%ecx
80103022:	75 f4                	jne    80103018 <mpsearch1+0x48>
80103024:	84 c0                	test   %al,%al
80103026:	75 c8                	jne    80102ff0 <mpsearch1+0x20>
80103028:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010302b:	89 f0                	mov    %esi,%eax
8010302d:	5b                   	pop    %ebx
8010302e:	5e                   	pop    %esi
8010302f:	5f                   	pop    %edi
80103030:	5d                   	pop    %ebp
80103031:	c3                   	ret    
80103032:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103038:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010303b:	31 f6                	xor    %esi,%esi
8010303d:	89 f0                	mov    %esi,%eax
8010303f:	5b                   	pop    %ebx
80103040:	5e                   	pop    %esi
80103041:	5f                   	pop    %edi
80103042:	5d                   	pop    %ebp
80103043:	c3                   	ret    
80103044:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010304a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103050 <mpinit>:
80103050:	55                   	push   %ebp
80103051:	89 e5                	mov    %esp,%ebp
80103053:	57                   	push   %edi
80103054:	56                   	push   %esi
80103055:	53                   	push   %ebx
80103056:	83 ec 1c             	sub    $0x1c,%esp
80103059:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103060:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103067:	c1 e0 08             	shl    $0x8,%eax
8010306a:	09 d0                	or     %edx,%eax
8010306c:	c1 e0 04             	shl    $0x4,%eax
8010306f:	85 c0                	test   %eax,%eax
80103071:	75 1b                	jne    8010308e <mpinit+0x3e>
80103073:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010307a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103081:	c1 e0 08             	shl    $0x8,%eax
80103084:	09 d0                	or     %edx,%eax
80103086:	c1 e0 0a             	shl    $0xa,%eax
80103089:	2d 00 04 00 00       	sub    $0x400,%eax
8010308e:	ba 00 04 00 00       	mov    $0x400,%edx
80103093:	e8 38 ff ff ff       	call   80102fd0 <mpsearch1>
80103098:	85 c0                	test   %eax,%eax
8010309a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010309d:	0f 84 3d 01 00 00    	je     801031e0 <mpinit+0x190>
801030a3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801030a6:	8b 58 04             	mov    0x4(%eax),%ebx
801030a9:	85 db                	test   %ebx,%ebx
801030ab:	0f 84 4f 01 00 00    	je     80103200 <mpinit+0x1b0>
801030b1:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
801030b7:	83 ec 04             	sub    $0x4,%esp
801030ba:	6a 04                	push   $0x4
801030bc:	68 95 75 10 80       	push   $0x80107595
801030c1:	56                   	push   %esi
801030c2:	e8 29 15 00 00       	call   801045f0 <memcmp>
801030c7:	83 c4 10             	add    $0x10,%esp
801030ca:	85 c0                	test   %eax,%eax
801030cc:	0f 85 2e 01 00 00    	jne    80103200 <mpinit+0x1b0>
801030d2:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
801030d9:	3c 01                	cmp    $0x1,%al
801030db:	0f 95 c2             	setne  %dl
801030de:	3c 04                	cmp    $0x4,%al
801030e0:	0f 95 c0             	setne  %al
801030e3:	20 c2                	and    %al,%dl
801030e5:	0f 85 15 01 00 00    	jne    80103200 <mpinit+0x1b0>
801030eb:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
801030f2:	66 85 ff             	test   %di,%di
801030f5:	74 1a                	je     80103111 <mpinit+0xc1>
801030f7:	89 f0                	mov    %esi,%eax
801030f9:	01 f7                	add    %esi,%edi
801030fb:	31 d2                	xor    %edx,%edx
801030fd:	8d 76 00             	lea    0x0(%esi),%esi
80103100:	0f b6 08             	movzbl (%eax),%ecx
80103103:	83 c0 01             	add    $0x1,%eax
80103106:	01 ca                	add    %ecx,%edx
80103108:	39 c7                	cmp    %eax,%edi
8010310a:	75 f4                	jne    80103100 <mpinit+0xb0>
8010310c:	84 d2                	test   %dl,%dl
8010310e:	0f 95 c2             	setne  %dl
80103111:	85 f6                	test   %esi,%esi
80103113:	0f 84 e7 00 00 00    	je     80103200 <mpinit+0x1b0>
80103119:	84 d2                	test   %dl,%dl
8010311b:	0f 85 df 00 00 00    	jne    80103200 <mpinit+0x1b0>
80103121:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103127:	a3 7c 26 11 80       	mov    %eax,0x8011267c
8010312c:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
80103133:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
80103139:	bb 01 00 00 00       	mov    $0x1,%ebx
8010313e:	01 d6                	add    %edx,%esi
80103140:	39 c6                	cmp    %eax,%esi
80103142:	76 23                	jbe    80103167 <mpinit+0x117>
80103144:	0f b6 10             	movzbl (%eax),%edx
80103147:	80 fa 04             	cmp    $0x4,%dl
8010314a:	0f 87 ca 00 00 00    	ja     8010321a <mpinit+0x1ca>
80103150:	ff 24 95 bc 75 10 80 	jmp    *-0x7fef8a44(,%edx,4)
80103157:	89 f6                	mov    %esi,%esi
80103159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103160:	83 c0 08             	add    $0x8,%eax
80103163:	39 c6                	cmp    %eax,%esi
80103165:	77 dd                	ja     80103144 <mpinit+0xf4>
80103167:	85 db                	test   %ebx,%ebx
80103169:	0f 84 9e 00 00 00    	je     8010320d <mpinit+0x1bd>
8010316f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103172:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103176:	74 15                	je     8010318d <mpinit+0x13d>
80103178:	b8 70 00 00 00       	mov    $0x70,%eax
8010317d:	ba 22 00 00 00       	mov    $0x22,%edx
80103182:	ee                   	out    %al,(%dx)
80103183:	ba 23 00 00 00       	mov    $0x23,%edx
80103188:	ec                   	in     (%dx),%al
80103189:	83 c8 01             	or     $0x1,%eax
8010318c:	ee                   	out    %al,(%dx)
8010318d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103190:	5b                   	pop    %ebx
80103191:	5e                   	pop    %esi
80103192:	5f                   	pop    %edi
80103193:	5d                   	pop    %ebp
80103194:	c3                   	ret    
80103195:	8d 76 00             	lea    0x0(%esi),%esi
80103198:	8b 0d e0 28 11 80    	mov    0x801128e0,%ecx
8010319e:	83 f9 01             	cmp    $0x1,%ecx
801031a1:	7f 19                	jg     801031bc <mpinit+0x16c>
801031a3:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801031a7:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
801031ad:	83 c1 01             	add    $0x1,%ecx
801031b0:	89 0d e0 28 11 80    	mov    %ecx,0x801128e0
801031b6:	88 97 80 27 11 80    	mov    %dl,-0x7feed880(%edi)
801031bc:	83 c0 14             	add    $0x14,%eax
801031bf:	e9 7c ff ff ff       	jmp    80103140 <mpinit+0xf0>
801031c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801031c8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801031cc:	83 c0 08             	add    $0x8,%eax
801031cf:	88 15 60 27 11 80    	mov    %dl,0x80112760
801031d5:	e9 66 ff ff ff       	jmp    80103140 <mpinit+0xf0>
801031da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801031e0:	ba 00 00 01 00       	mov    $0x10000,%edx
801031e5:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801031ea:	e8 e1 fd ff ff       	call   80102fd0 <mpsearch1>
801031ef:	85 c0                	test   %eax,%eax
801031f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801031f4:	0f 85 a9 fe ff ff    	jne    801030a3 <mpinit+0x53>
801031fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103200:	83 ec 0c             	sub    $0xc,%esp
80103203:	68 7d 75 10 80       	push   $0x8010757d
80103208:	e8 83 d1 ff ff       	call   80100390 <panic>
8010320d:	83 ec 0c             	sub    $0xc,%esp
80103210:	68 9c 75 10 80       	push   $0x8010759c
80103215:	e8 76 d1 ff ff       	call   80100390 <panic>
8010321a:	31 db                	xor    %ebx,%ebx
8010321c:	e9 26 ff ff ff       	jmp    80103147 <mpinit+0xf7>
80103221:	66 90                	xchg   %ax,%ax
80103223:	66 90                	xchg   %ax,%ax
80103225:	66 90                	xchg   %ax,%ax
80103227:	66 90                	xchg   %ax,%ax
80103229:	66 90                	xchg   %ax,%ax
8010322b:	66 90                	xchg   %ax,%ax
8010322d:	66 90                	xchg   %ax,%ax
8010322f:	90                   	nop

80103230 <picinit>:
80103230:	55                   	push   %ebp
80103231:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103236:	ba 21 00 00 00       	mov    $0x21,%edx
8010323b:	89 e5                	mov    %esp,%ebp
8010323d:	ee                   	out    %al,(%dx)
8010323e:	ba a1 00 00 00       	mov    $0xa1,%edx
80103243:	ee                   	out    %al,(%dx)
80103244:	5d                   	pop    %ebp
80103245:	c3                   	ret    
80103246:	66 90                	xchg   %ax,%ax
80103248:	66 90                	xchg   %ax,%ax
8010324a:	66 90                	xchg   %ax,%ax
8010324c:	66 90                	xchg   %ax,%ax
8010324e:	66 90                	xchg   %ax,%ax

80103250 <pipealloc>:
80103250:	55                   	push   %ebp
80103251:	89 e5                	mov    %esp,%ebp
80103253:	57                   	push   %edi
80103254:	56                   	push   %esi
80103255:	53                   	push   %ebx
80103256:	83 ec 0c             	sub    $0xc,%esp
80103259:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010325c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010325f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103265:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010326b:	e8 10 db ff ff       	call   80100d80 <filealloc>
80103270:	85 c0                	test   %eax,%eax
80103272:	89 03                	mov    %eax,(%ebx)
80103274:	74 22                	je     80103298 <pipealloc+0x48>
80103276:	e8 05 db ff ff       	call   80100d80 <filealloc>
8010327b:	85 c0                	test   %eax,%eax
8010327d:	89 06                	mov    %eax,(%esi)
8010327f:	74 3f                	je     801032c0 <pipealloc+0x70>
80103281:	e8 4a f2 ff ff       	call   801024d0 <kalloc>
80103286:	85 c0                	test   %eax,%eax
80103288:	89 c7                	mov    %eax,%edi
8010328a:	75 54                	jne    801032e0 <pipealloc+0x90>
8010328c:	8b 03                	mov    (%ebx),%eax
8010328e:	85 c0                	test   %eax,%eax
80103290:	75 34                	jne    801032c6 <pipealloc+0x76>
80103292:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103298:	8b 06                	mov    (%esi),%eax
8010329a:	85 c0                	test   %eax,%eax
8010329c:	74 0c                	je     801032aa <pipealloc+0x5a>
8010329e:	83 ec 0c             	sub    $0xc,%esp
801032a1:	50                   	push   %eax
801032a2:	e8 99 db ff ff       	call   80100e40 <fileclose>
801032a7:	83 c4 10             	add    $0x10,%esp
801032aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801032b2:	5b                   	pop    %ebx
801032b3:	5e                   	pop    %esi
801032b4:	5f                   	pop    %edi
801032b5:	5d                   	pop    %ebp
801032b6:	c3                   	ret    
801032b7:	89 f6                	mov    %esi,%esi
801032b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801032c0:	8b 03                	mov    (%ebx),%eax
801032c2:	85 c0                	test   %eax,%eax
801032c4:	74 e4                	je     801032aa <pipealloc+0x5a>
801032c6:	83 ec 0c             	sub    $0xc,%esp
801032c9:	50                   	push   %eax
801032ca:	e8 71 db ff ff       	call   80100e40 <fileclose>
801032cf:	8b 06                	mov    (%esi),%eax
801032d1:	83 c4 10             	add    $0x10,%esp
801032d4:	85 c0                	test   %eax,%eax
801032d6:	75 c6                	jne    8010329e <pipealloc+0x4e>
801032d8:	eb d0                	jmp    801032aa <pipealloc+0x5a>
801032da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801032e0:	83 ec 08             	sub    $0x8,%esp
801032e3:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801032ea:	00 00 00 
801032ed:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801032f4:	00 00 00 
801032f7:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
801032fe:	00 00 00 
80103301:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103308:	00 00 00 
8010330b:	68 d0 75 10 80       	push   $0x801075d0
80103310:	50                   	push   %eax
80103311:	e8 1a 10 00 00       	call   80104330 <initlock>
80103316:	8b 03                	mov    (%ebx),%eax
80103318:	83 c4 10             	add    $0x10,%esp
8010331b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103321:	8b 03                	mov    (%ebx),%eax
80103323:	c6 40 08 01          	movb   $0x1,0x8(%eax)
80103327:	8b 03                	mov    (%ebx),%eax
80103329:	c6 40 09 00          	movb   $0x0,0x9(%eax)
8010332d:	8b 03                	mov    (%ebx),%eax
8010332f:	89 78 0c             	mov    %edi,0xc(%eax)
80103332:	8b 06                	mov    (%esi),%eax
80103334:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
8010333a:	8b 06                	mov    (%esi),%eax
8010333c:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103340:	8b 06                	mov    (%esi),%eax
80103342:	c6 40 09 01          	movb   $0x1,0x9(%eax)
80103346:	8b 06                	mov    (%esi),%eax
80103348:	89 78 0c             	mov    %edi,0xc(%eax)
8010334b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010334e:	31 c0                	xor    %eax,%eax
80103350:	5b                   	pop    %ebx
80103351:	5e                   	pop    %esi
80103352:	5f                   	pop    %edi
80103353:	5d                   	pop    %ebp
80103354:	c3                   	ret    
80103355:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103360 <pipeclose>:
80103360:	55                   	push   %ebp
80103361:	89 e5                	mov    %esp,%ebp
80103363:	56                   	push   %esi
80103364:	53                   	push   %ebx
80103365:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103368:	8b 75 0c             	mov    0xc(%ebp),%esi
8010336b:	83 ec 0c             	sub    $0xc,%esp
8010336e:	53                   	push   %ebx
8010336f:	e8 ac 10 00 00       	call   80104420 <acquire>
80103374:	83 c4 10             	add    $0x10,%esp
80103377:	85 f6                	test   %esi,%esi
80103379:	74 45                	je     801033c0 <pipeclose+0x60>
8010337b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103381:	83 ec 0c             	sub    $0xc,%esp
80103384:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010338b:	00 00 00 
8010338e:	50                   	push   %eax
8010338f:	e8 cc 0b 00 00       	call   80103f60 <wakeup>
80103394:	83 c4 10             	add    $0x10,%esp
80103397:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010339d:	85 d2                	test   %edx,%edx
8010339f:	75 0a                	jne    801033ab <pipeclose+0x4b>
801033a1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801033a7:	85 c0                	test   %eax,%eax
801033a9:	74 35                	je     801033e0 <pipeclose+0x80>
801033ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
801033ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
801033b1:	5b                   	pop    %ebx
801033b2:	5e                   	pop    %esi
801033b3:	5d                   	pop    %ebp
801033b4:	e9 87 11 00 00       	jmp    80104540 <release>
801033b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801033c0:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801033c6:	83 ec 0c             	sub    $0xc,%esp
801033c9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801033d0:	00 00 00 
801033d3:	50                   	push   %eax
801033d4:	e8 87 0b 00 00       	call   80103f60 <wakeup>
801033d9:	83 c4 10             	add    $0x10,%esp
801033dc:	eb b9                	jmp    80103397 <pipeclose+0x37>
801033de:	66 90                	xchg   %ax,%ax
801033e0:	83 ec 0c             	sub    $0xc,%esp
801033e3:	53                   	push   %ebx
801033e4:	e8 57 11 00 00       	call   80104540 <release>
801033e9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801033ec:	83 c4 10             	add    $0x10,%esp
801033ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801033f2:	5b                   	pop    %ebx
801033f3:	5e                   	pop    %esi
801033f4:	5d                   	pop    %ebp
801033f5:	e9 26 ef ff ff       	jmp    80102320 <kfree>
801033fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103400 <pipewrite>:
80103400:	55                   	push   %ebp
80103401:	89 e5                	mov    %esp,%ebp
80103403:	57                   	push   %edi
80103404:	56                   	push   %esi
80103405:	53                   	push   %ebx
80103406:	83 ec 28             	sub    $0x28,%esp
80103409:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010340c:	53                   	push   %ebx
8010340d:	e8 0e 10 00 00       	call   80104420 <acquire>
80103412:	8b 45 10             	mov    0x10(%ebp),%eax
80103415:	83 c4 10             	add    $0x10,%esp
80103418:	85 c0                	test   %eax,%eax
8010341a:	0f 8e c9 00 00 00    	jle    801034e9 <pipewrite+0xe9>
80103420:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103423:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103429:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
8010342f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103432:	03 4d 10             	add    0x10(%ebp),%ecx
80103435:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80103438:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
8010343e:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
80103444:	39 d0                	cmp    %edx,%eax
80103446:	75 71                	jne    801034b9 <pipewrite+0xb9>
80103448:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010344e:	85 c0                	test   %eax,%eax
80103450:	74 4e                	je     801034a0 <pipewrite+0xa0>
80103452:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103458:	eb 3a                	jmp    80103494 <pipewrite+0x94>
8010345a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103460:	83 ec 0c             	sub    $0xc,%esp
80103463:	57                   	push   %edi
80103464:	e8 f7 0a 00 00       	call   80103f60 <wakeup>
80103469:	5a                   	pop    %edx
8010346a:	59                   	pop    %ecx
8010346b:	53                   	push   %ebx
8010346c:	56                   	push   %esi
8010346d:	e8 3e 09 00 00       	call   80103db0 <sleep>
80103472:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103478:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010347e:	83 c4 10             	add    $0x10,%esp
80103481:	05 00 02 00 00       	add    $0x200,%eax
80103486:	39 c2                	cmp    %eax,%edx
80103488:	75 36                	jne    801034c0 <pipewrite+0xc0>
8010348a:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
80103490:	85 c0                	test   %eax,%eax
80103492:	74 0c                	je     801034a0 <pipewrite+0xa0>
80103494:	e8 57 03 00 00       	call   801037f0 <myproc>
80103499:	8b 40 24             	mov    0x24(%eax),%eax
8010349c:	85 c0                	test   %eax,%eax
8010349e:	74 c0                	je     80103460 <pipewrite+0x60>
801034a0:	83 ec 0c             	sub    $0xc,%esp
801034a3:	53                   	push   %ebx
801034a4:	e8 97 10 00 00       	call   80104540 <release>
801034a9:	83 c4 10             	add    $0x10,%esp
801034ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801034b1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801034b4:	5b                   	pop    %ebx
801034b5:	5e                   	pop    %esi
801034b6:	5f                   	pop    %edi
801034b7:	5d                   	pop    %ebp
801034b8:	c3                   	ret    
801034b9:	89 c2                	mov    %eax,%edx
801034bb:	90                   	nop
801034bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801034c0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801034c3:	8d 42 01             	lea    0x1(%edx),%eax
801034c6:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801034cc:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
801034d2:	83 c6 01             	add    $0x1,%esi
801034d5:	0f b6 4e ff          	movzbl -0x1(%esi),%ecx
801034d9:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801034dc:	89 75 e4             	mov    %esi,-0x1c(%ebp)
801034df:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
801034e3:	0f 85 4f ff ff ff    	jne    80103438 <pipewrite+0x38>
801034e9:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801034ef:	83 ec 0c             	sub    $0xc,%esp
801034f2:	50                   	push   %eax
801034f3:	e8 68 0a 00 00       	call   80103f60 <wakeup>
801034f8:	89 1c 24             	mov    %ebx,(%esp)
801034fb:	e8 40 10 00 00       	call   80104540 <release>
80103500:	83 c4 10             	add    $0x10,%esp
80103503:	8b 45 10             	mov    0x10(%ebp),%eax
80103506:	eb a9                	jmp    801034b1 <pipewrite+0xb1>
80103508:	90                   	nop
80103509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103510 <piperead>:
80103510:	55                   	push   %ebp
80103511:	89 e5                	mov    %esp,%ebp
80103513:	57                   	push   %edi
80103514:	56                   	push   %esi
80103515:	53                   	push   %ebx
80103516:	83 ec 18             	sub    $0x18,%esp
80103519:	8b 75 08             	mov    0x8(%ebp),%esi
8010351c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010351f:	56                   	push   %esi
80103520:	e8 fb 0e 00 00       	call   80104420 <acquire>
80103525:	83 c4 10             	add    $0x10,%esp
80103528:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
8010352e:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103534:	75 6a                	jne    801035a0 <piperead+0x90>
80103536:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010353c:	85 db                	test   %ebx,%ebx
8010353e:	0f 84 c4 00 00 00    	je     80103608 <piperead+0xf8>
80103544:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
8010354a:	eb 2d                	jmp    80103579 <piperead+0x69>
8010354c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103550:	83 ec 08             	sub    $0x8,%esp
80103553:	56                   	push   %esi
80103554:	53                   	push   %ebx
80103555:	e8 56 08 00 00       	call   80103db0 <sleep>
8010355a:	83 c4 10             	add    $0x10,%esp
8010355d:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103563:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103569:	75 35                	jne    801035a0 <piperead+0x90>
8010356b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103571:	85 d2                	test   %edx,%edx
80103573:	0f 84 8f 00 00 00    	je     80103608 <piperead+0xf8>
80103579:	e8 72 02 00 00       	call   801037f0 <myproc>
8010357e:	8b 48 24             	mov    0x24(%eax),%ecx
80103581:	85 c9                	test   %ecx,%ecx
80103583:	74 cb                	je     80103550 <piperead+0x40>
80103585:	83 ec 0c             	sub    $0xc,%esp
80103588:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010358d:	56                   	push   %esi
8010358e:	e8 ad 0f 00 00       	call   80104540 <release>
80103593:	83 c4 10             	add    $0x10,%esp
80103596:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103599:	89 d8                	mov    %ebx,%eax
8010359b:	5b                   	pop    %ebx
8010359c:	5e                   	pop    %esi
8010359d:	5f                   	pop    %edi
8010359e:	5d                   	pop    %ebp
8010359f:	c3                   	ret    
801035a0:	8b 45 10             	mov    0x10(%ebp),%eax
801035a3:	85 c0                	test   %eax,%eax
801035a5:	7e 61                	jle    80103608 <piperead+0xf8>
801035a7:	31 db                	xor    %ebx,%ebx
801035a9:	eb 13                	jmp    801035be <piperead+0xae>
801035ab:	90                   	nop
801035ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035b0:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801035b6:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801035bc:	74 1f                	je     801035dd <piperead+0xcd>
801035be:	8d 41 01             	lea    0x1(%ecx),%eax
801035c1:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801035c7:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
801035cd:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
801035d2:	88 04 1f             	mov    %al,(%edi,%ebx,1)
801035d5:	83 c3 01             	add    $0x1,%ebx
801035d8:	39 5d 10             	cmp    %ebx,0x10(%ebp)
801035db:	75 d3                	jne    801035b0 <piperead+0xa0>
801035dd:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
801035e3:	83 ec 0c             	sub    $0xc,%esp
801035e6:	50                   	push   %eax
801035e7:	e8 74 09 00 00       	call   80103f60 <wakeup>
801035ec:	89 34 24             	mov    %esi,(%esp)
801035ef:	e8 4c 0f 00 00       	call   80104540 <release>
801035f4:	83 c4 10             	add    $0x10,%esp
801035f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035fa:	89 d8                	mov    %ebx,%eax
801035fc:	5b                   	pop    %ebx
801035fd:	5e                   	pop    %esi
801035fe:	5f                   	pop    %edi
801035ff:	5d                   	pop    %ebp
80103600:	c3                   	ret    
80103601:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103608:	31 db                	xor    %ebx,%ebx
8010360a:	eb d1                	jmp    801035dd <piperead+0xcd>
8010360c:	66 90                	xchg   %ax,%ax
8010360e:	66 90                	xchg   %ax,%ax

80103610 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103610:	55                   	push   %ebp
80103611:	89 e5                	mov    %esp,%ebp
80103613:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103614:	bb 34 29 11 80       	mov    $0x80112934,%ebx
{
80103619:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
8010361c:	68 00 29 11 80       	push   $0x80112900
80103621:	e8 fa 0d 00 00       	call   80104420 <acquire>
80103626:	83 c4 10             	add    $0x10,%esp
80103629:	eb 14                	jmp    8010363f <allocproc+0x2f>
8010362b:	90                   	nop
8010362c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103630:	83 eb 80             	sub    $0xffffff80,%ebx
80103633:	81 fb 34 49 11 80    	cmp    $0x80114934,%ebx
80103639:	0f 83 81 00 00 00    	jae    801036c0 <allocproc+0xb0>
    if(p->state == UNUSED)
8010363f:	8b 43 0c             	mov    0xc(%ebx),%eax
80103642:	85 c0                	test   %eax,%eax
80103644:	75 ea                	jne    80103630 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103646:	a1 04 a0 10 80       	mov    0x8010a004,%eax
  p->priority = 10; // Default priority

  release(&ptable.lock);
8010364b:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
8010364e:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->priority = 10; // Default priority
80103655:	c7 43 7c 0a 00 00 00 	movl   $0xa,0x7c(%ebx)
  p->pid = nextpid++;
8010365c:	8d 50 01             	lea    0x1(%eax),%edx
8010365f:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
80103662:	68 00 29 11 80       	push   $0x80112900
  p->pid = nextpid++;
80103667:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  release(&ptable.lock);
8010366d:	e8 ce 0e 00 00       	call   80104540 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103672:	e8 59 ee ff ff       	call   801024d0 <kalloc>
80103677:	83 c4 10             	add    $0x10,%esp
8010367a:	85 c0                	test   %eax,%eax
8010367c:	89 43 08             	mov    %eax,0x8(%ebx)
8010367f:	74 58                	je     801036d9 <allocproc+0xc9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103681:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103687:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
8010368a:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
8010368f:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
80103692:	c7 40 14 0b 58 10 80 	movl   $0x8010580b,0x14(%eax)
  p->context = (struct context*)sp;
80103699:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010369c:	6a 14                	push   $0x14
8010369e:	6a 00                	push   $0x0
801036a0:	50                   	push   %eax
801036a1:	e8 fa 0e 00 00       	call   801045a0 <memset>
  p->context->eip = (uint)forkret;
801036a6:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
801036a9:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
801036ac:	c7 40 10 f0 36 10 80 	movl   $0x801036f0,0x10(%eax)
}
801036b3:	89 d8                	mov    %ebx,%eax
801036b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801036b8:	c9                   	leave  
801036b9:	c3                   	ret    
801036ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
801036c0:	83 ec 0c             	sub    $0xc,%esp
  return 0;
801036c3:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
801036c5:	68 00 29 11 80       	push   $0x80112900
801036ca:	e8 71 0e 00 00       	call   80104540 <release>
}
801036cf:	89 d8                	mov    %ebx,%eax
  return 0;
801036d1:	83 c4 10             	add    $0x10,%esp
}
801036d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801036d7:	c9                   	leave  
801036d8:	c3                   	ret    
    p->state = UNUSED;
801036d9:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
801036e0:	31 db                	xor    %ebx,%ebx
801036e2:	eb cf                	jmp    801036b3 <allocproc+0xa3>
801036e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801036ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801036f0 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
801036f0:	55                   	push   %ebp
801036f1:	89 e5                	mov    %esp,%ebp
801036f3:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
801036f6:	68 00 29 11 80       	push   $0x80112900
801036fb:	e8 40 0e 00 00       	call   80104540 <release>

  if (first) {
80103700:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103705:	83 c4 10             	add    $0x10,%esp
80103708:	85 c0                	test   %eax,%eax
8010370a:	75 04                	jne    80103710 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010370c:	c9                   	leave  
8010370d:	c3                   	ret    
8010370e:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
80103710:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
80103713:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010371a:	00 00 00 
    iinit(ROOTDEV);
8010371d:	6a 01                	push   $0x1
8010371f:	e8 6c dd ff ff       	call   80101490 <iinit>
    initlog(ROOTDEV);
80103724:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010372b:	e8 e0 f3 ff ff       	call   80102b10 <initlog>
80103730:	83 c4 10             	add    $0x10,%esp
}
80103733:	c9                   	leave  
80103734:	c3                   	ret    
80103735:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103740 <pinit>:
{
80103740:	55                   	push   %ebp
80103741:	89 e5                	mov    %esp,%ebp
80103743:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103746:	68 d5 75 10 80       	push   $0x801075d5
8010374b:	68 00 29 11 80       	push   $0x80112900
80103750:	e8 db 0b 00 00       	call   80104330 <initlock>
}
80103755:	83 c4 10             	add    $0x10,%esp
80103758:	c9                   	leave  
80103759:	c3                   	ret    
8010375a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103760 <mycpu>:
{
80103760:	55                   	push   %ebp
80103761:	89 e5                	mov    %esp,%ebp
80103763:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103766:	9c                   	pushf  
80103767:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103768:	f6 c4 02             	test   $0x2,%ah
8010376b:	75 4a                	jne    801037b7 <mycpu+0x57>
  apicid = lapicid();
8010376d:	e8 ce ef ff ff       	call   80102740 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103772:	8b 15 e0 28 11 80    	mov    0x801128e0,%edx
80103778:	85 d2                	test   %edx,%edx
8010377a:	7e 1b                	jle    80103797 <mycpu+0x37>
    if (cpus[i].apicid == apicid)
8010377c:	0f b6 0d 80 27 11 80 	movzbl 0x80112780,%ecx
80103783:	39 c8                	cmp    %ecx,%eax
80103785:	74 21                	je     801037a8 <mycpu+0x48>
  for (i = 0; i < ncpu; ++i) {
80103787:	83 fa 01             	cmp    $0x1,%edx
8010378a:	74 0b                	je     80103797 <mycpu+0x37>
    if (cpus[i].apicid == apicid)
8010378c:	0f b6 15 30 28 11 80 	movzbl 0x80112830,%edx
80103793:	39 d0                	cmp    %edx,%eax
80103795:	74 19                	je     801037b0 <mycpu+0x50>
  panic("unknown apicid\n");
80103797:	83 ec 0c             	sub    $0xc,%esp
8010379a:	68 dc 75 10 80       	push   $0x801075dc
8010379f:	e8 ec cb ff ff       	call   80100390 <panic>
801037a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (cpus[i].apicid == apicid)
801037a8:	b8 80 27 11 80       	mov    $0x80112780,%eax
}
801037ad:	c9                   	leave  
801037ae:	c3                   	ret    
801037af:	90                   	nop
    if (cpus[i].apicid == apicid)
801037b0:	b8 30 28 11 80       	mov    $0x80112830,%eax
}
801037b5:	c9                   	leave  
801037b6:	c3                   	ret    
    panic("mycpu called with interrupts enabled\n");
801037b7:	83 ec 0c             	sub    $0xc,%esp
801037ba:	68 04 77 10 80       	push   $0x80107704
801037bf:	e8 cc cb ff ff       	call   80100390 <panic>
801037c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037d0 <cpuid>:
cpuid() {
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
801037d6:	e8 85 ff ff ff       	call   80103760 <mycpu>
801037db:	2d 80 27 11 80       	sub    $0x80112780,%eax
}
801037e0:	c9                   	leave  
  return mycpu()-cpus;
801037e1:	c1 f8 04             	sar    $0x4,%eax
801037e4:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
801037ea:	c3                   	ret    
801037eb:	90                   	nop
801037ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801037f0 <myproc>:
myproc(void) {
801037f0:	55                   	push   %ebp
801037f1:	89 e5                	mov    %esp,%ebp
801037f3:	53                   	push   %ebx
801037f4:	83 ec 04             	sub    $0x4,%esp
  pushcli();
801037f7:	e8 e4 0b 00 00       	call   801043e0 <pushcli>
  c = mycpu();
801037fc:	e8 5f ff ff ff       	call   80103760 <mycpu>
  p = c->proc;
80103801:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103807:	e8 d4 0c 00 00       	call   801044e0 <popcli>
}
8010380c:	83 c4 04             	add    $0x4,%esp
8010380f:	89 d8                	mov    %ebx,%eax
80103811:	5b                   	pop    %ebx
80103812:	5d                   	pop    %ebp
80103813:	c3                   	ret    
80103814:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010381a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103820 <userinit>:
{
80103820:	55                   	push   %ebp
80103821:	89 e5                	mov    %esp,%ebp
80103823:	53                   	push   %ebx
80103824:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
80103827:	e8 e4 fd ff ff       	call   80103610 <allocproc>
8010382c:	89 c3                	mov    %eax,%ebx
  initproc = p;
8010382e:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
80103833:	e8 a8 35 00 00       	call   80106de0 <setupkvm>
80103838:	85 c0                	test   %eax,%eax
8010383a:	89 43 04             	mov    %eax,0x4(%ebx)
8010383d:	0f 84 bd 00 00 00    	je     80103900 <userinit+0xe0>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103843:	83 ec 04             	sub    $0x4,%esp
80103846:	68 2c 00 00 00       	push   $0x2c
8010384b:	68 60 a4 10 80       	push   $0x8010a460
80103850:	50                   	push   %eax
80103851:	e8 6a 32 00 00       	call   80106ac0 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
80103856:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103859:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010385f:	6a 4c                	push   $0x4c
80103861:	6a 00                	push   $0x0
80103863:	ff 73 18             	pushl  0x18(%ebx)
80103866:	e8 35 0d 00 00       	call   801045a0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010386b:	8b 43 18             	mov    0x18(%ebx),%eax
8010386e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103873:	b9 23 00 00 00       	mov    $0x23,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
80103878:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010387b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010387f:	8b 43 18             	mov    0x18(%ebx),%eax
80103882:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103886:	8b 43 18             	mov    0x18(%ebx),%eax
80103889:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010388d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103891:	8b 43 18             	mov    0x18(%ebx),%eax
80103894:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103898:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010389c:	8b 43 18             	mov    0x18(%ebx),%eax
8010389f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
801038a6:	8b 43 18             	mov    0x18(%ebx),%eax
801038a9:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
801038b0:	8b 43 18             	mov    0x18(%ebx),%eax
801038b3:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
801038ba:	8d 43 6c             	lea    0x6c(%ebx),%eax
801038bd:	6a 10                	push   $0x10
801038bf:	68 05 76 10 80       	push   $0x80107605
801038c4:	50                   	push   %eax
801038c5:	e8 b6 0e 00 00       	call   80104780 <safestrcpy>
  p->cwd = namei("/");
801038ca:	c7 04 24 0e 76 10 80 	movl   $0x8010760e,(%esp)
801038d1:	e8 1a e6 ff ff       	call   80101ef0 <namei>
801038d6:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
801038d9:	c7 04 24 00 29 11 80 	movl   $0x80112900,(%esp)
801038e0:	e8 3b 0b 00 00       	call   80104420 <acquire>
  p->state = RUNNABLE;
801038e5:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
801038ec:	c7 04 24 00 29 11 80 	movl   $0x80112900,(%esp)
801038f3:	e8 48 0c 00 00       	call   80104540 <release>
}
801038f8:	83 c4 10             	add    $0x10,%esp
801038fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038fe:	c9                   	leave  
801038ff:	c3                   	ret    
    panic("userinit: out of memory?");
80103900:	83 ec 0c             	sub    $0xc,%esp
80103903:	68 ec 75 10 80       	push   $0x801075ec
80103908:	e8 83 ca ff ff       	call   80100390 <panic>
8010390d:	8d 76 00             	lea    0x0(%esi),%esi

80103910 <growproc>:
{
80103910:	55                   	push   %ebp
80103911:	89 e5                	mov    %esp,%ebp
80103913:	56                   	push   %esi
80103914:	53                   	push   %ebx
80103915:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
80103918:	e8 c3 0a 00 00       	call   801043e0 <pushcli>
  c = mycpu();
8010391d:	e8 3e fe ff ff       	call   80103760 <mycpu>
  p = c->proc;
80103922:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103928:	e8 b3 0b 00 00       	call   801044e0 <popcli>
  if(n > 0){
8010392d:	83 fe 00             	cmp    $0x0,%esi
  sz = curproc->sz;
80103930:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
80103932:	7f 1c                	jg     80103950 <growproc+0x40>
  } else if(n < 0){
80103934:	75 3a                	jne    80103970 <growproc+0x60>
  switchuvm(curproc);
80103936:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
80103939:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
8010393b:	53                   	push   %ebx
8010393c:	e8 6f 30 00 00       	call   801069b0 <switchuvm>
  return 0;
80103941:	83 c4 10             	add    $0x10,%esp
80103944:	31 c0                	xor    %eax,%eax
}
80103946:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103949:	5b                   	pop    %ebx
8010394a:	5e                   	pop    %esi
8010394b:	5d                   	pop    %ebp
8010394c:	c3                   	ret    
8010394d:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103950:	83 ec 04             	sub    $0x4,%esp
80103953:	01 c6                	add    %eax,%esi
80103955:	56                   	push   %esi
80103956:	50                   	push   %eax
80103957:	ff 73 04             	pushl  0x4(%ebx)
8010395a:	e8 a1 32 00 00       	call   80106c00 <allocuvm>
8010395f:	83 c4 10             	add    $0x10,%esp
80103962:	85 c0                	test   %eax,%eax
80103964:	75 d0                	jne    80103936 <growproc+0x26>
      return -1;
80103966:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010396b:	eb d9                	jmp    80103946 <growproc+0x36>
8010396d:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103970:	83 ec 04             	sub    $0x4,%esp
80103973:	01 c6                	add    %eax,%esi
80103975:	56                   	push   %esi
80103976:	50                   	push   %eax
80103977:	ff 73 04             	pushl  0x4(%ebx)
8010397a:	e8 b1 33 00 00       	call   80106d30 <deallocuvm>
8010397f:	83 c4 10             	add    $0x10,%esp
80103982:	85 c0                	test   %eax,%eax
80103984:	75 b0                	jne    80103936 <growproc+0x26>
80103986:	eb de                	jmp    80103966 <growproc+0x56>
80103988:	90                   	nop
80103989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103990 <fork>:
{
80103990:	55                   	push   %ebp
80103991:	89 e5                	mov    %esp,%ebp
80103993:	57                   	push   %edi
80103994:	56                   	push   %esi
80103995:	53                   	push   %ebx
80103996:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103999:	e8 42 0a 00 00       	call   801043e0 <pushcli>
  c = mycpu();
8010399e:	e8 bd fd ff ff       	call   80103760 <mycpu>
  p = c->proc;
801039a3:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
801039a9:	e8 32 0b 00 00       	call   801044e0 <popcli>
  if((np = allocproc()) == 0){
801039ae:	e8 5d fc ff ff       	call   80103610 <allocproc>
801039b3:	85 c0                	test   %eax,%eax
801039b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801039b8:	0f 84 b7 00 00 00    	je     80103a75 <fork+0xe5>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
801039be:	83 ec 08             	sub    $0x8,%esp
801039c1:	ff 33                	pushl  (%ebx)
801039c3:	ff 73 04             	pushl  0x4(%ebx)
801039c6:	89 c7                	mov    %eax,%edi
801039c8:	e8 e3 34 00 00       	call   80106eb0 <copyuvm>
801039cd:	83 c4 10             	add    $0x10,%esp
801039d0:	85 c0                	test   %eax,%eax
801039d2:	89 47 04             	mov    %eax,0x4(%edi)
801039d5:	0f 84 a1 00 00 00    	je     80103a7c <fork+0xec>
  np->sz = curproc->sz;
801039db:	8b 03                	mov    (%ebx),%eax
801039dd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801039e0:	89 01                	mov    %eax,(%ecx)
  np->parent = curproc;
801039e2:	89 59 14             	mov    %ebx,0x14(%ecx)
801039e5:	89 c8                	mov    %ecx,%eax
  *np->tf = *curproc->tf;
801039e7:	8b 79 18             	mov    0x18(%ecx),%edi
801039ea:	8b 73 18             	mov    0x18(%ebx),%esi
801039ed:	b9 13 00 00 00       	mov    $0x13,%ecx
801039f2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
801039f4:	31 f6                	xor    %esi,%esi
  np->tf->eax = 0;
801039f6:	8b 40 18             	mov    0x18(%eax),%eax
801039f9:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
    if(curproc->ofile[i])
80103a00:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103a04:	85 c0                	test   %eax,%eax
80103a06:	74 13                	je     80103a1b <fork+0x8b>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103a08:	83 ec 0c             	sub    $0xc,%esp
80103a0b:	50                   	push   %eax
80103a0c:	e8 df d3 ff ff       	call   80100df0 <filedup>
80103a11:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103a14:	83 c4 10             	add    $0x10,%esp
80103a17:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103a1b:	83 c6 01             	add    $0x1,%esi
80103a1e:	83 fe 10             	cmp    $0x10,%esi
80103a21:	75 dd                	jne    80103a00 <fork+0x70>
  np->cwd = idup(curproc->cwd);
80103a23:	83 ec 0c             	sub    $0xc,%esp
80103a26:	ff 73 68             	pushl  0x68(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a29:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
80103a2c:	e8 2f dc ff ff       	call   80101660 <idup>
80103a31:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a34:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103a37:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103a3a:	8d 47 6c             	lea    0x6c(%edi),%eax
80103a3d:	6a 10                	push   $0x10
80103a3f:	53                   	push   %ebx
80103a40:	50                   	push   %eax
80103a41:	e8 3a 0d 00 00       	call   80104780 <safestrcpy>
  pid = np->pid;
80103a46:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
80103a49:	c7 04 24 00 29 11 80 	movl   $0x80112900,(%esp)
80103a50:	e8 cb 09 00 00       	call   80104420 <acquire>
  np->state = RUNNABLE;
80103a55:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
80103a5c:	c7 04 24 00 29 11 80 	movl   $0x80112900,(%esp)
80103a63:	e8 d8 0a 00 00       	call   80104540 <release>
  return pid;
80103a68:	83 c4 10             	add    $0x10,%esp
}
80103a6b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103a6e:	89 d8                	mov    %ebx,%eax
80103a70:	5b                   	pop    %ebx
80103a71:	5e                   	pop    %esi
80103a72:	5f                   	pop    %edi
80103a73:	5d                   	pop    %ebp
80103a74:	c3                   	ret    
    return -1;
80103a75:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103a7a:	eb ef                	jmp    80103a6b <fork+0xdb>
    kfree(np->kstack);
80103a7c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103a7f:	83 ec 0c             	sub    $0xc,%esp
80103a82:	ff 73 08             	pushl  0x8(%ebx)
80103a85:	e8 96 e8 ff ff       	call   80102320 <kfree>
    np->kstack = 0;
80103a8a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103a91:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103a98:	83 c4 10             	add    $0x10,%esp
80103a9b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103aa0:	eb c9                	jmp    80103a6b <fork+0xdb>
80103aa2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ab0 <scheduler>:
{
80103ab0:	55                   	push   %ebp
80103ab1:	89 e5                	mov    %esp,%ebp
80103ab3:	57                   	push   %edi
80103ab4:	56                   	push   %esi
80103ab5:	53                   	push   %ebx
80103ab6:	83 ec 0c             	sub    $0xc,%esp
  struct cpu *c = mycpu();
80103ab9:	e8 a2 fc ff ff       	call   80103760 <mycpu>
80103abe:	8d 70 04             	lea    0x4(%eax),%esi
80103ac1:	89 c3                	mov    %eax,%ebx
  c->proc = 0;
80103ac3:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103aca:	00 00 00 
}

static inline void
sti(void)
{
  asm volatile("sti");
80103acd:	fb                   	sti    
    acquire(&ptable.lock);
80103ace:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ad1:	bf 34 29 11 80       	mov    $0x80112934,%edi
    acquire(&ptable.lock);
80103ad6:	68 00 29 11 80       	push   $0x80112900
80103adb:	e8 40 09 00 00       	call   80104420 <acquire>
80103ae0:	83 c4 10             	add    $0x10,%esp
80103ae3:	eb 0e                	jmp    80103af3 <scheduler+0x43>
80103ae5:	8d 76 00             	lea    0x0(%esi),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ae8:	83 ef 80             	sub    $0xffffff80,%edi
80103aeb:	81 ff 34 49 11 80    	cmp    $0x80114934,%edi
80103af1:	73 64                	jae    80103b57 <scheduler+0xa7>
      if(p->state != RUNNABLE)
80103af3:	83 7f 0c 03          	cmpl   $0x3,0xc(%edi)
80103af7:	75 ef                	jne    80103ae8 <scheduler+0x38>
      for(p1=ptable.proc; p1<&ptable.proc[NPROC];p1++){
80103af9:	b8 34 29 11 80       	mov    $0x80112934,%eax
80103afe:	66 90                	xchg   %ax,%ax
          if(p1->state != RUNNABLE)
80103b00:	83 78 0c 03          	cmpl   $0x3,0xc(%eax)
80103b04:	75 09                	jne    80103b0f <scheduler+0x5f>
          if(highP->priority > p1->priority) // larger value, lower priority
80103b06:	8b 50 7c             	mov    0x7c(%eax),%edx
80103b09:	39 57 7c             	cmp    %edx,0x7c(%edi)
80103b0c:	0f 4f f8             	cmovg  %eax,%edi
      for(p1=ptable.proc; p1<&ptable.proc[NPROC];p1++){
80103b0f:	83 e8 80             	sub    $0xffffff80,%eax
80103b12:	3d 34 49 11 80       	cmp    $0x80114934,%eax
80103b17:	72 e7                	jb     80103b00 <scheduler+0x50>
      switchuvm(p);
80103b19:	83 ec 0c             	sub    $0xc,%esp
      c->proc = p;
80103b1c:	89 bb ac 00 00 00    	mov    %edi,0xac(%ebx)
      switchuvm(p);
80103b22:	57                   	push   %edi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b23:	83 ef 80             	sub    $0xffffff80,%edi
      switchuvm(p);
80103b26:	e8 85 2e 00 00       	call   801069b0 <switchuvm>
      p->state = RUNNING;
80103b2b:	c7 47 8c 04 00 00 00 	movl   $0x4,-0x74(%edi)
      swtch(&(c->scheduler), p->context);
80103b32:	58                   	pop    %eax
80103b33:	5a                   	pop    %edx
80103b34:	ff 77 9c             	pushl  -0x64(%edi)
80103b37:	56                   	push   %esi
80103b38:	e8 9e 0c 00 00       	call   801047db <swtch>
      switchkvm();
80103b3d:	e8 4e 2e 00 00       	call   80106990 <switchkvm>
      c->proc = 0;
80103b42:	83 c4 10             	add    $0x10,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b45:	81 ff 34 49 11 80    	cmp    $0x80114934,%edi
      c->proc = 0;
80103b4b:	c7 83 ac 00 00 00 00 	movl   $0x0,0xac(%ebx)
80103b52:	00 00 00 
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103b55:	72 9c                	jb     80103af3 <scheduler+0x43>
    release(&ptable.lock);
80103b57:	83 ec 0c             	sub    $0xc,%esp
80103b5a:	68 00 29 11 80       	push   $0x80112900
80103b5f:	e8 dc 09 00 00       	call   80104540 <release>
  for(;;){
80103b64:	83 c4 10             	add    $0x10,%esp
80103b67:	e9 61 ff ff ff       	jmp    80103acd <scheduler+0x1d>
80103b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103b70 <sched>:
{
80103b70:	55                   	push   %ebp
80103b71:	89 e5                	mov    %esp,%ebp
80103b73:	56                   	push   %esi
80103b74:	53                   	push   %ebx
  pushcli();
80103b75:	e8 66 08 00 00       	call   801043e0 <pushcli>
  c = mycpu();
80103b7a:	e8 e1 fb ff ff       	call   80103760 <mycpu>
  p = c->proc;
80103b7f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103b85:	e8 56 09 00 00       	call   801044e0 <popcli>
  if(!holding(&ptable.lock))
80103b8a:	83 ec 0c             	sub    $0xc,%esp
80103b8d:	68 00 29 11 80       	push   $0x80112900
80103b92:	e8 09 08 00 00       	call   801043a0 <holding>
80103b97:	83 c4 10             	add    $0x10,%esp
80103b9a:	85 c0                	test   %eax,%eax
80103b9c:	74 4f                	je     80103bed <sched+0x7d>
  if(mycpu()->ncli != 1)
80103b9e:	e8 bd fb ff ff       	call   80103760 <mycpu>
80103ba3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103baa:	75 68                	jne    80103c14 <sched+0xa4>
  if(p->state == RUNNING)
80103bac:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103bb0:	74 55                	je     80103c07 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103bb2:	9c                   	pushf  
80103bb3:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103bb4:	f6 c4 02             	test   $0x2,%ah
80103bb7:	75 41                	jne    80103bfa <sched+0x8a>
  intena = mycpu()->intena;
80103bb9:	e8 a2 fb ff ff       	call   80103760 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103bbe:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103bc1:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103bc7:	e8 94 fb ff ff       	call   80103760 <mycpu>
80103bcc:	83 ec 08             	sub    $0x8,%esp
80103bcf:	ff 70 04             	pushl  0x4(%eax)
80103bd2:	53                   	push   %ebx
80103bd3:	e8 03 0c 00 00       	call   801047db <swtch>
  mycpu()->intena = intena;
80103bd8:	e8 83 fb ff ff       	call   80103760 <mycpu>
}
80103bdd:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103be0:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103be6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103be9:	5b                   	pop    %ebx
80103bea:	5e                   	pop    %esi
80103beb:	5d                   	pop    %ebp
80103bec:	c3                   	ret    
    panic("sched ptable.lock");
80103bed:	83 ec 0c             	sub    $0xc,%esp
80103bf0:	68 10 76 10 80       	push   $0x80107610
80103bf5:	e8 96 c7 ff ff       	call   80100390 <panic>
    panic("sched interruptible");
80103bfa:	83 ec 0c             	sub    $0xc,%esp
80103bfd:	68 3c 76 10 80       	push   $0x8010763c
80103c02:	e8 89 c7 ff ff       	call   80100390 <panic>
    panic("sched running");
80103c07:	83 ec 0c             	sub    $0xc,%esp
80103c0a:	68 2e 76 10 80       	push   $0x8010762e
80103c0f:	e8 7c c7 ff ff       	call   80100390 <panic>
    panic("sched locks");
80103c14:	83 ec 0c             	sub    $0xc,%esp
80103c17:	68 22 76 10 80       	push   $0x80107622
80103c1c:	e8 6f c7 ff ff       	call   80100390 <panic>
80103c21:	eb 0d                	jmp    80103c30 <exit>
80103c23:	90                   	nop
80103c24:	90                   	nop
80103c25:	90                   	nop
80103c26:	90                   	nop
80103c27:	90                   	nop
80103c28:	90                   	nop
80103c29:	90                   	nop
80103c2a:	90                   	nop
80103c2b:	90                   	nop
80103c2c:	90                   	nop
80103c2d:	90                   	nop
80103c2e:	90                   	nop
80103c2f:	90                   	nop

80103c30 <exit>:
{
80103c30:	55                   	push   %ebp
80103c31:	89 e5                	mov    %esp,%ebp
80103c33:	57                   	push   %edi
80103c34:	56                   	push   %esi
80103c35:	53                   	push   %ebx
80103c36:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
80103c39:	e8 a2 07 00 00       	call   801043e0 <pushcli>
  c = mycpu();
80103c3e:	e8 1d fb ff ff       	call   80103760 <mycpu>
  p = c->proc;
80103c43:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103c49:	e8 92 08 00 00       	call   801044e0 <popcli>
  if(curproc == initproc)
80103c4e:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103c54:	8d 5e 28             	lea    0x28(%esi),%ebx
80103c57:	8d 7e 68             	lea    0x68(%esi),%edi
80103c5a:	0f 84 e7 00 00 00    	je     80103d47 <exit+0x117>
    if(curproc->ofile[fd]){
80103c60:	8b 03                	mov    (%ebx),%eax
80103c62:	85 c0                	test   %eax,%eax
80103c64:	74 12                	je     80103c78 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103c66:	83 ec 0c             	sub    $0xc,%esp
80103c69:	50                   	push   %eax
80103c6a:	e8 d1 d1 ff ff       	call   80100e40 <fileclose>
      curproc->ofile[fd] = 0;
80103c6f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103c75:	83 c4 10             	add    $0x10,%esp
80103c78:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
80103c7b:	39 fb                	cmp    %edi,%ebx
80103c7d:	75 e1                	jne    80103c60 <exit+0x30>
  begin_op();
80103c7f:	e8 2c ef ff ff       	call   80102bb0 <begin_op>
  iput(curproc->cwd);
80103c84:	83 ec 0c             	sub    $0xc,%esp
80103c87:	ff 76 68             	pushl  0x68(%esi)
80103c8a:	e8 31 db ff ff       	call   801017c0 <iput>
  end_op();
80103c8f:	e8 8c ef ff ff       	call   80102c20 <end_op>
  curproc->cwd = 0;
80103c94:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80103c9b:	c7 04 24 00 29 11 80 	movl   $0x80112900,(%esp)
80103ca2:	e8 79 07 00 00       	call   80104420 <acquire>
  wakeup1(curproc->parent);
80103ca7:	8b 56 14             	mov    0x14(%esi),%edx
80103caa:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cad:	b8 34 29 11 80       	mov    $0x80112934,%eax
80103cb2:	eb 0e                	jmp    80103cc2 <exit+0x92>
80103cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103cb8:	83 e8 80             	sub    $0xffffff80,%eax
80103cbb:	3d 34 49 11 80       	cmp    $0x80114934,%eax
80103cc0:	73 1c                	jae    80103cde <exit+0xae>
    if(p->state == SLEEPING && p->chan == chan)
80103cc2:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103cc6:	75 f0                	jne    80103cb8 <exit+0x88>
80103cc8:	3b 50 20             	cmp    0x20(%eax),%edx
80103ccb:	75 eb                	jne    80103cb8 <exit+0x88>
      p->state = RUNNABLE;
80103ccd:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103cd4:	83 e8 80             	sub    $0xffffff80,%eax
80103cd7:	3d 34 49 11 80       	cmp    $0x80114934,%eax
80103cdc:	72 e4                	jb     80103cc2 <exit+0x92>
      p->parent = initproc;
80103cde:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ce4:	ba 34 29 11 80       	mov    $0x80112934,%edx
80103ce9:	eb 10                	jmp    80103cfb <exit+0xcb>
80103ceb:	90                   	nop
80103cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103cf0:	83 ea 80             	sub    $0xffffff80,%edx
80103cf3:	81 fa 34 49 11 80    	cmp    $0x80114934,%edx
80103cf9:	73 33                	jae    80103d2e <exit+0xfe>
    if(p->parent == curproc){
80103cfb:	39 72 14             	cmp    %esi,0x14(%edx)
80103cfe:	75 f0                	jne    80103cf0 <exit+0xc0>
      if(p->state == ZOMBIE)
80103d00:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103d04:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103d07:	75 e7                	jne    80103cf0 <exit+0xc0>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d09:	b8 34 29 11 80       	mov    $0x80112934,%eax
80103d0e:	eb 0a                	jmp    80103d1a <exit+0xea>
80103d10:	83 e8 80             	sub    $0xffffff80,%eax
80103d13:	3d 34 49 11 80       	cmp    $0x80114934,%eax
80103d18:	73 d6                	jae    80103cf0 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103d1a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103d1e:	75 f0                	jne    80103d10 <exit+0xe0>
80103d20:	3b 48 20             	cmp    0x20(%eax),%ecx
80103d23:	75 eb                	jne    80103d10 <exit+0xe0>
      p->state = RUNNABLE;
80103d25:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103d2c:	eb e2                	jmp    80103d10 <exit+0xe0>
  curproc->state = ZOMBIE;
80103d2e:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103d35:	e8 36 fe ff ff       	call   80103b70 <sched>
  panic("zombie exit");
80103d3a:	83 ec 0c             	sub    $0xc,%esp
80103d3d:	68 5d 76 10 80       	push   $0x8010765d
80103d42:	e8 49 c6 ff ff       	call   80100390 <panic>
    panic("init exiting");
80103d47:	83 ec 0c             	sub    $0xc,%esp
80103d4a:	68 50 76 10 80       	push   $0x80107650
80103d4f:	e8 3c c6 ff ff       	call   80100390 <panic>
80103d54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103d5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103d60 <yield>:
{
80103d60:	55                   	push   %ebp
80103d61:	89 e5                	mov    %esp,%ebp
80103d63:	53                   	push   %ebx
80103d64:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103d67:	68 00 29 11 80       	push   $0x80112900
80103d6c:	e8 af 06 00 00       	call   80104420 <acquire>
  pushcli();
80103d71:	e8 6a 06 00 00       	call   801043e0 <pushcli>
  c = mycpu();
80103d76:	e8 e5 f9 ff ff       	call   80103760 <mycpu>
  p = c->proc;
80103d7b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103d81:	e8 5a 07 00 00       	call   801044e0 <popcli>
  myproc()->state = RUNNABLE;
80103d86:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103d8d:	e8 de fd ff ff       	call   80103b70 <sched>
  release(&ptable.lock);
80103d92:	c7 04 24 00 29 11 80 	movl   $0x80112900,(%esp)
80103d99:	e8 a2 07 00 00       	call   80104540 <release>
}
80103d9e:	83 c4 10             	add    $0x10,%esp
80103da1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103da4:	c9                   	leave  
80103da5:	c3                   	ret    
80103da6:	8d 76 00             	lea    0x0(%esi),%esi
80103da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103db0 <sleep>:
{
80103db0:	55                   	push   %ebp
80103db1:	89 e5                	mov    %esp,%ebp
80103db3:	57                   	push   %edi
80103db4:	56                   	push   %esi
80103db5:	53                   	push   %ebx
80103db6:	83 ec 0c             	sub    $0xc,%esp
80103db9:	8b 7d 08             	mov    0x8(%ebp),%edi
80103dbc:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
80103dbf:	e8 1c 06 00 00       	call   801043e0 <pushcli>
  c = mycpu();
80103dc4:	e8 97 f9 ff ff       	call   80103760 <mycpu>
  p = c->proc;
80103dc9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103dcf:	e8 0c 07 00 00       	call   801044e0 <popcli>
  if(p == 0)
80103dd4:	85 db                	test   %ebx,%ebx
80103dd6:	0f 84 87 00 00 00    	je     80103e63 <sleep+0xb3>
  if(lk == 0)
80103ddc:	85 f6                	test   %esi,%esi
80103dde:	74 76                	je     80103e56 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103de0:	81 fe 00 29 11 80    	cmp    $0x80112900,%esi
80103de6:	74 50                	je     80103e38 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103de8:	83 ec 0c             	sub    $0xc,%esp
80103deb:	68 00 29 11 80       	push   $0x80112900
80103df0:	e8 2b 06 00 00       	call   80104420 <acquire>
    release(lk);
80103df5:	89 34 24             	mov    %esi,(%esp)
80103df8:	e8 43 07 00 00       	call   80104540 <release>
  p->chan = chan;
80103dfd:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103e00:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103e07:	e8 64 fd ff ff       	call   80103b70 <sched>
  p->chan = 0;
80103e0c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
80103e13:	c7 04 24 00 29 11 80 	movl   $0x80112900,(%esp)
80103e1a:	e8 21 07 00 00       	call   80104540 <release>
    acquire(lk);
80103e1f:	89 75 08             	mov    %esi,0x8(%ebp)
80103e22:	83 c4 10             	add    $0x10,%esp
}
80103e25:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e28:	5b                   	pop    %ebx
80103e29:	5e                   	pop    %esi
80103e2a:	5f                   	pop    %edi
80103e2b:	5d                   	pop    %ebp
    acquire(lk);
80103e2c:	e9 ef 05 00 00       	jmp    80104420 <acquire>
80103e31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80103e38:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103e3b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103e42:	e8 29 fd ff ff       	call   80103b70 <sched>
  p->chan = 0;
80103e47:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
80103e4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103e51:	5b                   	pop    %ebx
80103e52:	5e                   	pop    %esi
80103e53:	5f                   	pop    %edi
80103e54:	5d                   	pop    %ebp
80103e55:	c3                   	ret    
    panic("sleep without lk");
80103e56:	83 ec 0c             	sub    $0xc,%esp
80103e59:	68 6f 76 10 80       	push   $0x8010766f
80103e5e:	e8 2d c5 ff ff       	call   80100390 <panic>
    panic("sleep");
80103e63:	83 ec 0c             	sub    $0xc,%esp
80103e66:	68 69 76 10 80       	push   $0x80107669
80103e6b:	e8 20 c5 ff ff       	call   80100390 <panic>

80103e70 <wait>:
{
80103e70:	55                   	push   %ebp
80103e71:	89 e5                	mov    %esp,%ebp
80103e73:	56                   	push   %esi
80103e74:	53                   	push   %ebx
  pushcli();
80103e75:	e8 66 05 00 00       	call   801043e0 <pushcli>
  c = mycpu();
80103e7a:	e8 e1 f8 ff ff       	call   80103760 <mycpu>
  p = c->proc;
80103e7f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103e85:	e8 56 06 00 00       	call   801044e0 <popcli>
  acquire(&ptable.lock);
80103e8a:	83 ec 0c             	sub    $0xc,%esp
80103e8d:	68 00 29 11 80       	push   $0x80112900
80103e92:	e8 89 05 00 00       	call   80104420 <acquire>
80103e97:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
80103e9a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e9c:	bb 34 29 11 80       	mov    $0x80112934,%ebx
80103ea1:	eb 10                	jmp    80103eb3 <wait+0x43>
80103ea3:	90                   	nop
80103ea4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103ea8:	83 eb 80             	sub    $0xffffff80,%ebx
80103eab:	81 fb 34 49 11 80    	cmp    $0x80114934,%ebx
80103eb1:	73 1b                	jae    80103ece <wait+0x5e>
      if(p->parent != curproc)
80103eb3:	39 73 14             	cmp    %esi,0x14(%ebx)
80103eb6:	75 f0                	jne    80103ea8 <wait+0x38>
      if(p->state == ZOMBIE){
80103eb8:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103ebc:	74 32                	je     80103ef0 <wait+0x80>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ebe:	83 eb 80             	sub    $0xffffff80,%ebx
      havekids = 1;
80103ec1:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103ec6:	81 fb 34 49 11 80    	cmp    $0x80114934,%ebx
80103ecc:	72 e5                	jb     80103eb3 <wait+0x43>
    if(!havekids || curproc->killed){
80103ece:	85 c0                	test   %eax,%eax
80103ed0:	74 74                	je     80103f46 <wait+0xd6>
80103ed2:	8b 46 24             	mov    0x24(%esi),%eax
80103ed5:	85 c0                	test   %eax,%eax
80103ed7:	75 6d                	jne    80103f46 <wait+0xd6>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103ed9:	83 ec 08             	sub    $0x8,%esp
80103edc:	68 00 29 11 80       	push   $0x80112900
80103ee1:	56                   	push   %esi
80103ee2:	e8 c9 fe ff ff       	call   80103db0 <sleep>
    havekids = 0;
80103ee7:	83 c4 10             	add    $0x10,%esp
80103eea:	eb ae                	jmp    80103e9a <wait+0x2a>
80103eec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        kfree(p->kstack);
80103ef0:	83 ec 0c             	sub    $0xc,%esp
80103ef3:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
80103ef6:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103ef9:	e8 22 e4 ff ff       	call   80102320 <kfree>
        freevm(p->pgdir);
80103efe:	5a                   	pop    %edx
80103eff:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
80103f02:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103f09:	e8 52 2e 00 00       	call   80106d60 <freevm>
        release(&ptable.lock);
80103f0e:	c7 04 24 00 29 11 80 	movl   $0x80112900,(%esp)
        p->pid = 0;
80103f15:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103f1c:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103f23:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103f27:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103f2e:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80103f35:	e8 06 06 00 00       	call   80104540 <release>
        return pid;
80103f3a:	83 c4 10             	add    $0x10,%esp
}
80103f3d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f40:	89 f0                	mov    %esi,%eax
80103f42:	5b                   	pop    %ebx
80103f43:	5e                   	pop    %esi
80103f44:	5d                   	pop    %ebp
80103f45:	c3                   	ret    
      release(&ptable.lock);
80103f46:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80103f49:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
80103f4e:	68 00 29 11 80       	push   $0x80112900
80103f53:	e8 e8 05 00 00       	call   80104540 <release>
      return -1;
80103f58:	83 c4 10             	add    $0x10,%esp
80103f5b:	eb e0                	jmp    80103f3d <wait+0xcd>
80103f5d:	8d 76 00             	lea    0x0(%esi),%esi

80103f60 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80103f60:	55                   	push   %ebp
80103f61:	89 e5                	mov    %esp,%ebp
80103f63:	53                   	push   %ebx
80103f64:	83 ec 10             	sub    $0x10,%esp
80103f67:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
80103f6a:	68 00 29 11 80       	push   $0x80112900
80103f6f:	e8 ac 04 00 00       	call   80104420 <acquire>
80103f74:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f77:	b8 34 29 11 80       	mov    $0x80112934,%eax
80103f7c:	eb 0c                	jmp    80103f8a <wakeup+0x2a>
80103f7e:	66 90                	xchg   %ax,%ax
80103f80:	83 e8 80             	sub    $0xffffff80,%eax
80103f83:	3d 34 49 11 80       	cmp    $0x80114934,%eax
80103f88:	73 1c                	jae    80103fa6 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
80103f8a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103f8e:	75 f0                	jne    80103f80 <wakeup+0x20>
80103f90:	3b 58 20             	cmp    0x20(%eax),%ebx
80103f93:	75 eb                	jne    80103f80 <wakeup+0x20>
      p->state = RUNNABLE;
80103f95:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103f9c:	83 e8 80             	sub    $0xffffff80,%eax
80103f9f:	3d 34 49 11 80       	cmp    $0x80114934,%eax
80103fa4:	72 e4                	jb     80103f8a <wakeup+0x2a>
  wakeup1(chan);
  release(&ptable.lock);
80103fa6:	c7 45 08 00 29 11 80 	movl   $0x80112900,0x8(%ebp)
}
80103fad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103fb0:	c9                   	leave  
  release(&ptable.lock);
80103fb1:	e9 8a 05 00 00       	jmp    80104540 <release>
80103fb6:	8d 76 00             	lea    0x0(%esi),%esi
80103fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103fc0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80103fc0:	55                   	push   %ebp
80103fc1:	89 e5                	mov    %esp,%ebp
80103fc3:	53                   	push   %ebx
80103fc4:	83 ec 10             	sub    $0x10,%esp
80103fc7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
80103fca:	68 00 29 11 80       	push   $0x80112900
80103fcf:	e8 4c 04 00 00       	call   80104420 <acquire>
80103fd4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fd7:	b8 34 29 11 80       	mov    $0x80112934,%eax
80103fdc:	eb 0c                	jmp    80103fea <kill+0x2a>
80103fde:	66 90                	xchg   %ax,%ax
80103fe0:	83 e8 80             	sub    $0xffffff80,%eax
80103fe3:	3d 34 49 11 80       	cmp    $0x80114934,%eax
80103fe8:	73 36                	jae    80104020 <kill+0x60>
    if(p->pid == pid){
80103fea:	39 58 10             	cmp    %ebx,0x10(%eax)
80103fed:	75 f1                	jne    80103fe0 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
80103fef:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
80103ff3:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
80103ffa:	75 07                	jne    80104003 <kill+0x43>
        p->state = RUNNABLE;
80103ffc:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
80104003:	83 ec 0c             	sub    $0xc,%esp
80104006:	68 00 29 11 80       	push   $0x80112900
8010400b:	e8 30 05 00 00       	call   80104540 <release>
      return 0;
80104010:	83 c4 10             	add    $0x10,%esp
80104013:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104015:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104018:	c9                   	leave  
80104019:	c3                   	ret    
8010401a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80104020:	83 ec 0c             	sub    $0xc,%esp
80104023:	68 00 29 11 80       	push   $0x80112900
80104028:	e8 13 05 00 00       	call   80104540 <release>
  return -1;
8010402d:	83 c4 10             	add    $0x10,%esp
80104030:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104035:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104038:	c9                   	leave  
80104039:	c3                   	ret    
8010403a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104040 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104040:	55                   	push   %ebp
80104041:	89 e5                	mov    %esp,%ebp
80104043:	57                   	push   %edi
80104044:	56                   	push   %esi
80104045:	53                   	push   %ebx
80104046:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104049:	bb 34 29 11 80       	mov    $0x80112934,%ebx
{
8010404e:	83 ec 3c             	sub    $0x3c,%esp
80104051:	eb 24                	jmp    80104077 <procdump+0x37>
80104053:	90                   	nop
80104054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104058:	83 ec 0c             	sub    $0xc,%esp
8010405b:	68 63 7a 10 80       	push   $0x80107a63
80104060:	e8 fb c5 ff ff       	call   80100660 <cprintf>
80104065:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104068:	83 eb 80             	sub    $0xffffff80,%ebx
8010406b:	81 fb 34 49 11 80    	cmp    $0x80114934,%ebx
80104071:	0f 83 81 00 00 00    	jae    801040f8 <procdump+0xb8>
    if(p->state == UNUSED)
80104077:	8b 43 0c             	mov    0xc(%ebx),%eax
8010407a:	85 c0                	test   %eax,%eax
8010407c:	74 ea                	je     80104068 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010407e:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
80104081:	ba 80 76 10 80       	mov    $0x80107680,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104086:	77 11                	ja     80104099 <procdump+0x59>
80104088:	8b 14 85 50 77 10 80 	mov    -0x7fef88b0(,%eax,4),%edx
      state = "???";
8010408f:	b8 80 76 10 80       	mov    $0x80107680,%eax
80104094:	85 d2                	test   %edx,%edx
80104096:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
80104099:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010409c:	50                   	push   %eax
8010409d:	52                   	push   %edx
8010409e:	ff 73 10             	pushl  0x10(%ebx)
801040a1:	68 84 76 10 80       	push   $0x80107684
801040a6:	e8 b5 c5 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
801040ab:	83 c4 10             	add    $0x10,%esp
801040ae:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
801040b2:	75 a4                	jne    80104058 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801040b4:	8d 45 c0             	lea    -0x40(%ebp),%eax
801040b7:	83 ec 08             	sub    $0x8,%esp
801040ba:	8d 7d c0             	lea    -0x40(%ebp),%edi
801040bd:	50                   	push   %eax
801040be:	8b 43 1c             	mov    0x1c(%ebx),%eax
801040c1:	8b 40 0c             	mov    0xc(%eax),%eax
801040c4:	83 c0 08             	add    $0x8,%eax
801040c7:	50                   	push   %eax
801040c8:	e8 83 02 00 00       	call   80104350 <getcallerpcs>
801040cd:	83 c4 10             	add    $0x10,%esp
      for(i=0; i<10 && pc[i] != 0; i++)
801040d0:	8b 17                	mov    (%edi),%edx
801040d2:	85 d2                	test   %edx,%edx
801040d4:	74 82                	je     80104058 <procdump+0x18>
        cprintf(" %p", pc[i]);
801040d6:	83 ec 08             	sub    $0x8,%esp
801040d9:	83 c7 04             	add    $0x4,%edi
801040dc:	52                   	push   %edx
801040dd:	68 c1 70 10 80       	push   $0x801070c1
801040e2:	e8 79 c5 ff ff       	call   80100660 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
801040e7:	83 c4 10             	add    $0x10,%esp
801040ea:	39 fe                	cmp    %edi,%esi
801040ec:	75 e2                	jne    801040d0 <procdump+0x90>
801040ee:	e9 65 ff ff ff       	jmp    80104058 <procdump+0x18>
801040f3:	90                   	nop
801040f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
}
801040f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801040fb:	5b                   	pop    %ebx
801040fc:	5e                   	pop    %esi
801040fd:	5f                   	pop    %edi
801040fe:	5d                   	pop    %ebp
801040ff:	c3                   	ret    

80104100 <cps>:

int
cps()
{
80104100:	55                   	push   %ebp
80104101:	89 e5                	mov    %esp,%ebp
80104103:	53                   	push   %ebx
80104104:	83 ec 10             	sub    $0x10,%esp
  asm volatile("sti");
80104107:	fb                   	sti    

    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process with pid.
    acquire(&ptable.lock);
80104108:	68 00 29 11 80       	push   $0x80112900
    cprintf("name \t pid \t state \t \t priority \n");
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010410d:	bb 34 29 11 80       	mov    $0x80112934,%ebx
    acquire(&ptable.lock);
80104112:	e8 09 03 00 00       	call   80104420 <acquire>
    cprintf("name \t pid \t state \t \t priority \n");
80104117:	c7 04 24 2c 77 10 80 	movl   $0x8010772c,(%esp)
8010411e:	e8 3d c5 ff ff       	call   80100660 <cprintf>
80104123:	83 c4 10             	add    $0x10,%esp
80104126:	eb 1d                	jmp    80104145 <cps+0x45>
80104128:	90                   	nop
80104129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    {
        if(p->state == SLEEPING)
            cprintf("%s \t %d \t SLEEPING \t %d\n", p->name, p->pid, p->priority);
        else if(p->state == RUNNING)
80104130:	83 f8 04             	cmp    $0x4,%eax
80104133:	74 5b                	je     80104190 <cps+0x90>
            cprintf("%s \t %d \t RUNNING \t %d\n", p->name, p->pid, p->priority);
        else if(p->state == RUNNABLE)
80104135:	83 f8 03             	cmp    $0x3,%eax
80104138:	74 76                	je     801041b0 <cps+0xb0>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010413a:	83 eb 80             	sub    $0xffffff80,%ebx
8010413d:	81 fb 34 49 11 80    	cmp    $0x80114934,%ebx
80104143:	73 2a                	jae    8010416f <cps+0x6f>
        if(p->state == SLEEPING)
80104145:	8b 43 0c             	mov    0xc(%ebx),%eax
80104148:	83 f8 02             	cmp    $0x2,%eax
8010414b:	75 e3                	jne    80104130 <cps+0x30>
            cprintf("%s \t %d \t SLEEPING \t %d\n", p->name, p->pid, p->priority);
8010414d:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104150:	ff 73 7c             	pushl  0x7c(%ebx)
80104153:	ff 73 10             	pushl  0x10(%ebx)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104156:	83 eb 80             	sub    $0xffffff80,%ebx
            cprintf("%s \t %d \t SLEEPING \t %d\n", p->name, p->pid, p->priority);
80104159:	50                   	push   %eax
8010415a:	68 8d 76 10 80       	push   $0x8010768d
8010415f:	e8 fc c4 ff ff       	call   80100660 <cprintf>
80104164:	83 c4 10             	add    $0x10,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104167:	81 fb 34 49 11 80    	cmp    $0x80114934,%ebx
8010416d:	72 d6                	jb     80104145 <cps+0x45>
            cprintf("%s \t %d \t RUNNABLE \t %d\n", p->name, p->pid, p->priority);
    }

    release(&ptable.lock);
8010416f:	83 ec 0c             	sub    $0xc,%esp
80104172:	68 00 29 11 80       	push   $0x80112900
80104177:	e8 c4 03 00 00       	call   80104540 <release>

    return 22;
}
8010417c:	b8 16 00 00 00       	mov    $0x16,%eax
80104181:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104184:	c9                   	leave  
80104185:	c3                   	ret    
80104186:	8d 76 00             	lea    0x0(%esi),%esi
80104189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
            cprintf("%s \t %d \t RUNNING \t %d\n", p->name, p->pid, p->priority);
80104190:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104193:	ff 73 7c             	pushl  0x7c(%ebx)
80104196:	ff 73 10             	pushl  0x10(%ebx)
80104199:	50                   	push   %eax
8010419a:	68 a6 76 10 80       	push   $0x801076a6
8010419f:	e8 bc c4 ff ff       	call   80100660 <cprintf>
801041a4:	83 c4 10             	add    $0x10,%esp
801041a7:	eb 91                	jmp    8010413a <cps+0x3a>
801041a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            cprintf("%s \t %d \t RUNNABLE \t %d\n", p->name, p->pid, p->priority);
801041b0:	8d 43 6c             	lea    0x6c(%ebx),%eax
801041b3:	ff 73 7c             	pushl  0x7c(%ebx)
801041b6:	ff 73 10             	pushl  0x10(%ebx)
801041b9:	50                   	push   %eax
801041ba:	68 be 76 10 80       	push   $0x801076be
801041bf:	e8 9c c4 ff ff       	call   80100660 <cprintf>
801041c4:	83 c4 10             	add    $0x10,%esp
801041c7:	e9 6e ff ff ff       	jmp    8010413a <cps+0x3a>
801041cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801041d0 <chpr>:

// Change priority
int
chpr(int pid, int priority)
{
801041d0:	55                   	push   %ebp
801041d1:	89 e5                	mov    %esp,%ebp
801041d3:	53                   	push   %ebx
801041d4:	83 ec 10             	sub    $0x10,%esp
801041d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
    struct proc *p;

    acquire(&ptable.lock);
801041da:	68 00 29 11 80       	push   $0x80112900
801041df:	e8 3c 02 00 00       	call   80104420 <acquire>
801041e4:	83 c4 10             	add    $0x10,%esp
    for(p=ptable.proc; p<&ptable.proc[NPROC]; p++)
801041e7:	ba 34 29 11 80       	mov    $0x80112934,%edx
801041ec:	eb 0d                	jmp    801041fb <chpr+0x2b>
801041ee:	66 90                	xchg   %ax,%ax
801041f0:	83 ea 80             	sub    $0xffffff80,%edx
801041f3:	81 fa 34 49 11 80    	cmp    $0x80114934,%edx
801041f9:	73 0b                	jae    80104206 <chpr+0x36>
    {
        if(p->pid == pid)
801041fb:	39 5a 10             	cmp    %ebx,0x10(%edx)
801041fe:	75 f0                	jne    801041f0 <chpr+0x20>
        {
            p->priority = priority;
80104200:	8b 45 0c             	mov    0xc(%ebp),%eax
80104203:	89 42 7c             	mov    %eax,0x7c(%edx)
            break;
        }
    }
    release(&ptable.lock);
80104206:	83 ec 0c             	sub    $0xc,%esp
80104209:	68 00 29 11 80       	push   $0x80112900
8010420e:	e8 2d 03 00 00       	call   80104540 <release>

    return pid;
}
80104213:	89 d8                	mov    %ebx,%eax
80104215:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104218:	c9                   	leave  
80104219:	c3                   	ret    
8010421a:	66 90                	xchg   %ax,%ax
8010421c:	66 90                	xchg   %ax,%ax
8010421e:	66 90                	xchg   %ax,%ax

80104220 <initsleeplock>:
80104220:	55                   	push   %ebp
80104221:	89 e5                	mov    %esp,%ebp
80104223:	53                   	push   %ebx
80104224:	83 ec 0c             	sub    $0xc,%esp
80104227:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010422a:	68 68 77 10 80       	push   $0x80107768
8010422f:	8d 43 04             	lea    0x4(%ebx),%eax
80104232:	50                   	push   %eax
80104233:	e8 f8 00 00 00       	call   80104330 <initlock>
80104238:	8b 45 0c             	mov    0xc(%ebp),%eax
8010423b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104241:	83 c4 10             	add    $0x10,%esp
80104244:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010424b:	89 43 38             	mov    %eax,0x38(%ebx)
8010424e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104251:	c9                   	leave  
80104252:	c3                   	ret    
80104253:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104260 <acquiresleep>:
80104260:	55                   	push   %ebp
80104261:	89 e5                	mov    %esp,%ebp
80104263:	56                   	push   %esi
80104264:	53                   	push   %ebx
80104265:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104268:	83 ec 0c             	sub    $0xc,%esp
8010426b:	8d 73 04             	lea    0x4(%ebx),%esi
8010426e:	56                   	push   %esi
8010426f:	e8 ac 01 00 00       	call   80104420 <acquire>
80104274:	8b 13                	mov    (%ebx),%edx
80104276:	83 c4 10             	add    $0x10,%esp
80104279:	85 d2                	test   %edx,%edx
8010427b:	74 16                	je     80104293 <acquiresleep+0x33>
8010427d:	8d 76 00             	lea    0x0(%esi),%esi
80104280:	83 ec 08             	sub    $0x8,%esp
80104283:	56                   	push   %esi
80104284:	53                   	push   %ebx
80104285:	e8 26 fb ff ff       	call   80103db0 <sleep>
8010428a:	8b 03                	mov    (%ebx),%eax
8010428c:	83 c4 10             	add    $0x10,%esp
8010428f:	85 c0                	test   %eax,%eax
80104291:	75 ed                	jne    80104280 <acquiresleep+0x20>
80104293:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104299:	e8 52 f5 ff ff       	call   801037f0 <myproc>
8010429e:	8b 40 10             	mov    0x10(%eax),%eax
801042a1:	89 43 3c             	mov    %eax,0x3c(%ebx)
801042a4:	89 75 08             	mov    %esi,0x8(%ebp)
801042a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
801042aa:	5b                   	pop    %ebx
801042ab:	5e                   	pop    %esi
801042ac:	5d                   	pop    %ebp
801042ad:	e9 8e 02 00 00       	jmp    80104540 <release>
801042b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801042b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801042c0 <releasesleep>:
801042c0:	55                   	push   %ebp
801042c1:	89 e5                	mov    %esp,%ebp
801042c3:	56                   	push   %esi
801042c4:	53                   	push   %ebx
801042c5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801042c8:	83 ec 0c             	sub    $0xc,%esp
801042cb:	8d 73 04             	lea    0x4(%ebx),%esi
801042ce:	56                   	push   %esi
801042cf:	e8 4c 01 00 00       	call   80104420 <acquire>
801042d4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801042da:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801042e1:	89 1c 24             	mov    %ebx,(%esp)
801042e4:	e8 77 fc ff ff       	call   80103f60 <wakeup>
801042e9:	89 75 08             	mov    %esi,0x8(%ebp)
801042ec:	83 c4 10             	add    $0x10,%esp
801042ef:	8d 65 f8             	lea    -0x8(%ebp),%esp
801042f2:	5b                   	pop    %ebx
801042f3:	5e                   	pop    %esi
801042f4:	5d                   	pop    %ebp
801042f5:	e9 46 02 00 00       	jmp    80104540 <release>
801042fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104300 <holdingsleep>:
80104300:	55                   	push   %ebp
80104301:	89 e5                	mov    %esp,%ebp
80104303:	56                   	push   %esi
80104304:	53                   	push   %ebx
80104305:	8b 75 08             	mov    0x8(%ebp),%esi
80104308:	83 ec 0c             	sub    $0xc,%esp
8010430b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010430e:	53                   	push   %ebx
8010430f:	e8 0c 01 00 00       	call   80104420 <acquire>
80104314:	8b 36                	mov    (%esi),%esi
80104316:	89 1c 24             	mov    %ebx,(%esp)
80104319:	e8 22 02 00 00       	call   80104540 <release>
8010431e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104321:	89 f0                	mov    %esi,%eax
80104323:	5b                   	pop    %ebx
80104324:	5e                   	pop    %esi
80104325:	5d                   	pop    %ebp
80104326:	c3                   	ret    
80104327:	66 90                	xchg   %ax,%ax
80104329:	66 90                	xchg   %ax,%ax
8010432b:	66 90                	xchg   %ax,%ax
8010432d:	66 90                	xchg   %ax,%ax
8010432f:	90                   	nop

80104330 <initlock>:
80104330:	55                   	push   %ebp
80104331:	89 e5                	mov    %esp,%ebp
80104333:	8b 45 08             	mov    0x8(%ebp),%eax
80104336:	8b 55 0c             	mov    0xc(%ebp),%edx
80104339:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010433f:	89 50 04             	mov    %edx,0x4(%eax)
80104342:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104349:	5d                   	pop    %ebp
8010434a:	c3                   	ret    
8010434b:	90                   	nop
8010434c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104350 <getcallerpcs>:
80104350:	55                   	push   %ebp
80104351:	31 d2                	xor    %edx,%edx
80104353:	89 e5                	mov    %esp,%ebp
80104355:	53                   	push   %ebx
80104356:	8b 45 08             	mov    0x8(%ebp),%eax
80104359:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010435c:	83 e8 08             	sub    $0x8,%eax
8010435f:	90                   	nop
80104360:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80104366:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010436c:	77 1a                	ja     80104388 <getcallerpcs+0x38>
8010436e:	8b 58 04             	mov    0x4(%eax),%ebx
80104371:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
80104374:	83 c2 01             	add    $0x1,%edx
80104377:	8b 00                	mov    (%eax),%eax
80104379:	83 fa 0a             	cmp    $0xa,%edx
8010437c:	75 e2                	jne    80104360 <getcallerpcs+0x10>
8010437e:	5b                   	pop    %ebx
8010437f:	5d                   	pop    %ebp
80104380:	c3                   	ret    
80104381:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104388:	8d 04 91             	lea    (%ecx,%edx,4),%eax
8010438b:	83 c1 28             	add    $0x28,%ecx
8010438e:	66 90                	xchg   %ax,%ax
80104390:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104396:	83 c0 04             	add    $0x4,%eax
80104399:	39 c1                	cmp    %eax,%ecx
8010439b:	75 f3                	jne    80104390 <getcallerpcs+0x40>
8010439d:	5b                   	pop    %ebx
8010439e:	5d                   	pop    %ebp
8010439f:	c3                   	ret    

801043a0 <holding>:
801043a0:	55                   	push   %ebp
801043a1:	89 e5                	mov    %esp,%ebp
801043a3:	53                   	push   %ebx
801043a4:	83 ec 04             	sub    $0x4,%esp
801043a7:	8b 55 08             	mov    0x8(%ebp),%edx
801043aa:	8b 02                	mov    (%edx),%eax
801043ac:	85 c0                	test   %eax,%eax
801043ae:	75 10                	jne    801043c0 <holding+0x20>
801043b0:	83 c4 04             	add    $0x4,%esp
801043b3:	31 c0                	xor    %eax,%eax
801043b5:	5b                   	pop    %ebx
801043b6:	5d                   	pop    %ebp
801043b7:	c3                   	ret    
801043b8:	90                   	nop
801043b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801043c0:	8b 5a 08             	mov    0x8(%edx),%ebx
801043c3:	e8 98 f3 ff ff       	call   80103760 <mycpu>
801043c8:	39 c3                	cmp    %eax,%ebx
801043ca:	0f 94 c0             	sete   %al
801043cd:	83 c4 04             	add    $0x4,%esp
801043d0:	0f b6 c0             	movzbl %al,%eax
801043d3:	5b                   	pop    %ebx
801043d4:	5d                   	pop    %ebp
801043d5:	c3                   	ret    
801043d6:	8d 76 00             	lea    0x0(%esi),%esi
801043d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801043e0 <pushcli>:
801043e0:	55                   	push   %ebp
801043e1:	89 e5                	mov    %esp,%ebp
801043e3:	53                   	push   %ebx
801043e4:	83 ec 04             	sub    $0x4,%esp
801043e7:	9c                   	pushf  
801043e8:	5b                   	pop    %ebx
801043e9:	fa                   	cli    
801043ea:	e8 71 f3 ff ff       	call   80103760 <mycpu>
801043ef:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801043f5:	85 c0                	test   %eax,%eax
801043f7:	75 11                	jne    8010440a <pushcli+0x2a>
801043f9:	81 e3 00 02 00 00    	and    $0x200,%ebx
801043ff:	e8 5c f3 ff ff       	call   80103760 <mycpu>
80104404:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
8010440a:	e8 51 f3 ff ff       	call   80103760 <mycpu>
8010440f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80104416:	83 c4 04             	add    $0x4,%esp
80104419:	5b                   	pop    %ebx
8010441a:	5d                   	pop    %ebp
8010441b:	c3                   	ret    
8010441c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104420 <acquire>:
80104420:	55                   	push   %ebp
80104421:	89 e5                	mov    %esp,%ebp
80104423:	56                   	push   %esi
80104424:	53                   	push   %ebx
80104425:	e8 b6 ff ff ff       	call   801043e0 <pushcli>
8010442a:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010442d:	8b 03                	mov    (%ebx),%eax
8010442f:	85 c0                	test   %eax,%eax
80104431:	0f 85 81 00 00 00    	jne    801044b8 <acquire+0x98>
80104437:	ba 01 00 00 00       	mov    $0x1,%edx
8010443c:	eb 05                	jmp    80104443 <acquire+0x23>
8010443e:	66 90                	xchg   %ax,%ax
80104440:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104443:	89 d0                	mov    %edx,%eax
80104445:	f0 87 03             	lock xchg %eax,(%ebx)
80104448:	85 c0                	test   %eax,%eax
8010444a:	75 f4                	jne    80104440 <acquire+0x20>
8010444c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104451:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104454:	e8 07 f3 ff ff       	call   80103760 <mycpu>
80104459:	31 d2                	xor    %edx,%edx
8010445b:	8d 4b 0c             	lea    0xc(%ebx),%ecx
8010445e:	89 43 08             	mov    %eax,0x8(%ebx)
80104461:	89 e8                	mov    %ebp,%eax
80104463:	90                   	nop
80104464:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104468:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
8010446e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104474:	77 1a                	ja     80104490 <acquire+0x70>
80104476:	8b 58 04             	mov    0x4(%eax),%ebx
80104479:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
8010447c:	83 c2 01             	add    $0x1,%edx
8010447f:	8b 00                	mov    (%eax),%eax
80104481:	83 fa 0a             	cmp    $0xa,%edx
80104484:	75 e2                	jne    80104468 <acquire+0x48>
80104486:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104489:	5b                   	pop    %ebx
8010448a:	5e                   	pop    %esi
8010448b:	5d                   	pop    %ebp
8010448c:	c3                   	ret    
8010448d:	8d 76 00             	lea    0x0(%esi),%esi
80104490:	8d 04 91             	lea    (%ecx,%edx,4),%eax
80104493:	83 c1 28             	add    $0x28,%ecx
80104496:	8d 76 00             	lea    0x0(%esi),%esi
80104499:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801044a0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801044a6:	83 c0 04             	add    $0x4,%eax
801044a9:	39 c8                	cmp    %ecx,%eax
801044ab:	75 f3                	jne    801044a0 <acquire+0x80>
801044ad:	8d 65 f8             	lea    -0x8(%ebp),%esp
801044b0:	5b                   	pop    %ebx
801044b1:	5e                   	pop    %esi
801044b2:	5d                   	pop    %ebp
801044b3:	c3                   	ret    
801044b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044b8:	8b 73 08             	mov    0x8(%ebx),%esi
801044bb:	e8 a0 f2 ff ff       	call   80103760 <mycpu>
801044c0:	39 c6                	cmp    %eax,%esi
801044c2:	0f 85 6f ff ff ff    	jne    80104437 <acquire+0x17>
801044c8:	83 ec 0c             	sub    $0xc,%esp
801044cb:	68 73 77 10 80       	push   $0x80107773
801044d0:	e8 bb be ff ff       	call   80100390 <panic>
801044d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044e0 <popcli>:
801044e0:	55                   	push   %ebp
801044e1:	89 e5                	mov    %esp,%ebp
801044e3:	83 ec 08             	sub    $0x8,%esp
801044e6:	9c                   	pushf  
801044e7:	58                   	pop    %eax
801044e8:	f6 c4 02             	test   $0x2,%ah
801044eb:	75 35                	jne    80104522 <popcli+0x42>
801044ed:	e8 6e f2 ff ff       	call   80103760 <mycpu>
801044f2:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
801044f9:	78 34                	js     8010452f <popcli+0x4f>
801044fb:	e8 60 f2 ff ff       	call   80103760 <mycpu>
80104500:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104506:	85 d2                	test   %edx,%edx
80104508:	74 06                	je     80104510 <popcli+0x30>
8010450a:	c9                   	leave  
8010450b:	c3                   	ret    
8010450c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104510:	e8 4b f2 ff ff       	call   80103760 <mycpu>
80104515:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010451b:	85 c0                	test   %eax,%eax
8010451d:	74 eb                	je     8010450a <popcli+0x2a>
8010451f:	fb                   	sti    
80104520:	c9                   	leave  
80104521:	c3                   	ret    
80104522:	83 ec 0c             	sub    $0xc,%esp
80104525:	68 7b 77 10 80       	push   $0x8010777b
8010452a:	e8 61 be ff ff       	call   80100390 <panic>
8010452f:	83 ec 0c             	sub    $0xc,%esp
80104532:	68 92 77 10 80       	push   $0x80107792
80104537:	e8 54 be ff ff       	call   80100390 <panic>
8010453c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104540 <release>:
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	56                   	push   %esi
80104544:	53                   	push   %ebx
80104545:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104548:	8b 03                	mov    (%ebx),%eax
8010454a:	85 c0                	test   %eax,%eax
8010454c:	74 0c                	je     8010455a <release+0x1a>
8010454e:	8b 73 08             	mov    0x8(%ebx),%esi
80104551:	e8 0a f2 ff ff       	call   80103760 <mycpu>
80104556:	39 c6                	cmp    %eax,%esi
80104558:	74 16                	je     80104570 <release+0x30>
8010455a:	83 ec 0c             	sub    $0xc,%esp
8010455d:	68 99 77 10 80       	push   $0x80107799
80104562:	e8 29 be ff ff       	call   80100390 <panic>
80104567:	89 f6                	mov    %esi,%esi
80104569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104570:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80104577:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
8010457e:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104583:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104589:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010458c:	5b                   	pop    %ebx
8010458d:	5e                   	pop    %esi
8010458e:	5d                   	pop    %ebp
8010458f:	e9 4c ff ff ff       	jmp    801044e0 <popcli>
80104594:	66 90                	xchg   %ax,%ax
80104596:	66 90                	xchg   %ax,%ax
80104598:	66 90                	xchg   %ax,%ax
8010459a:	66 90                	xchg   %ax,%ax
8010459c:	66 90                	xchg   %ax,%ax
8010459e:	66 90                	xchg   %ax,%ax

801045a0 <memset>:
801045a0:	55                   	push   %ebp
801045a1:	89 e5                	mov    %esp,%ebp
801045a3:	57                   	push   %edi
801045a4:	53                   	push   %ebx
801045a5:	8b 55 08             	mov    0x8(%ebp),%edx
801045a8:	8b 4d 10             	mov    0x10(%ebp),%ecx
801045ab:	f6 c2 03             	test   $0x3,%dl
801045ae:	75 05                	jne    801045b5 <memset+0x15>
801045b0:	f6 c1 03             	test   $0x3,%cl
801045b3:	74 13                	je     801045c8 <memset+0x28>
801045b5:	89 d7                	mov    %edx,%edi
801045b7:	8b 45 0c             	mov    0xc(%ebp),%eax
801045ba:	fc                   	cld    
801045bb:	f3 aa                	rep stos %al,%es:(%edi)
801045bd:	5b                   	pop    %ebx
801045be:	89 d0                	mov    %edx,%eax
801045c0:	5f                   	pop    %edi
801045c1:	5d                   	pop    %ebp
801045c2:	c3                   	ret    
801045c3:	90                   	nop
801045c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801045c8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801045cc:	c1 e9 02             	shr    $0x2,%ecx
801045cf:	89 f8                	mov    %edi,%eax
801045d1:	89 fb                	mov    %edi,%ebx
801045d3:	c1 e0 18             	shl    $0x18,%eax
801045d6:	c1 e3 10             	shl    $0x10,%ebx
801045d9:	09 d8                	or     %ebx,%eax
801045db:	09 f8                	or     %edi,%eax
801045dd:	c1 e7 08             	shl    $0x8,%edi
801045e0:	09 f8                	or     %edi,%eax
801045e2:	89 d7                	mov    %edx,%edi
801045e4:	fc                   	cld    
801045e5:	f3 ab                	rep stos %eax,%es:(%edi)
801045e7:	5b                   	pop    %ebx
801045e8:	89 d0                	mov    %edx,%eax
801045ea:	5f                   	pop    %edi
801045eb:	5d                   	pop    %ebp
801045ec:	c3                   	ret    
801045ed:	8d 76 00             	lea    0x0(%esi),%esi

801045f0 <memcmp>:
801045f0:	55                   	push   %ebp
801045f1:	89 e5                	mov    %esp,%ebp
801045f3:	57                   	push   %edi
801045f4:	56                   	push   %esi
801045f5:	53                   	push   %ebx
801045f6:	8b 5d 10             	mov    0x10(%ebp),%ebx
801045f9:	8b 75 08             	mov    0x8(%ebp),%esi
801045fc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801045ff:	85 db                	test   %ebx,%ebx
80104601:	74 29                	je     8010462c <memcmp+0x3c>
80104603:	0f b6 16             	movzbl (%esi),%edx
80104606:	0f b6 0f             	movzbl (%edi),%ecx
80104609:	38 d1                	cmp    %dl,%cl
8010460b:	75 2b                	jne    80104638 <memcmp+0x48>
8010460d:	b8 01 00 00 00       	mov    $0x1,%eax
80104612:	eb 14                	jmp    80104628 <memcmp+0x38>
80104614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104618:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010461c:	83 c0 01             	add    $0x1,%eax
8010461f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104624:	38 ca                	cmp    %cl,%dl
80104626:	75 10                	jne    80104638 <memcmp+0x48>
80104628:	39 d8                	cmp    %ebx,%eax
8010462a:	75 ec                	jne    80104618 <memcmp+0x28>
8010462c:	5b                   	pop    %ebx
8010462d:	31 c0                	xor    %eax,%eax
8010462f:	5e                   	pop    %esi
80104630:	5f                   	pop    %edi
80104631:	5d                   	pop    %ebp
80104632:	c3                   	ret    
80104633:	90                   	nop
80104634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104638:	0f b6 c2             	movzbl %dl,%eax
8010463b:	5b                   	pop    %ebx
8010463c:	29 c8                	sub    %ecx,%eax
8010463e:	5e                   	pop    %esi
8010463f:	5f                   	pop    %edi
80104640:	5d                   	pop    %ebp
80104641:	c3                   	ret    
80104642:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104650 <memmove>:
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	56                   	push   %esi
80104654:	53                   	push   %ebx
80104655:	8b 45 08             	mov    0x8(%ebp),%eax
80104658:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010465b:	8b 75 10             	mov    0x10(%ebp),%esi
8010465e:	39 c3                	cmp    %eax,%ebx
80104660:	73 26                	jae    80104688 <memmove+0x38>
80104662:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
80104665:	39 c8                	cmp    %ecx,%eax
80104667:	73 1f                	jae    80104688 <memmove+0x38>
80104669:	85 f6                	test   %esi,%esi
8010466b:	8d 56 ff             	lea    -0x1(%esi),%edx
8010466e:	74 0f                	je     8010467f <memmove+0x2f>
80104670:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104674:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104677:	83 ea 01             	sub    $0x1,%edx
8010467a:	83 fa ff             	cmp    $0xffffffff,%edx
8010467d:	75 f1                	jne    80104670 <memmove+0x20>
8010467f:	5b                   	pop    %ebx
80104680:	5e                   	pop    %esi
80104681:	5d                   	pop    %ebp
80104682:	c3                   	ret    
80104683:	90                   	nop
80104684:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104688:	31 d2                	xor    %edx,%edx
8010468a:	85 f6                	test   %esi,%esi
8010468c:	74 f1                	je     8010467f <memmove+0x2f>
8010468e:	66 90                	xchg   %ax,%ax
80104690:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104694:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104697:	83 c2 01             	add    $0x1,%edx
8010469a:	39 d6                	cmp    %edx,%esi
8010469c:	75 f2                	jne    80104690 <memmove+0x40>
8010469e:	5b                   	pop    %ebx
8010469f:	5e                   	pop    %esi
801046a0:	5d                   	pop    %ebp
801046a1:	c3                   	ret    
801046a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046b0 <memcpy>:
801046b0:	55                   	push   %ebp
801046b1:	89 e5                	mov    %esp,%ebp
801046b3:	5d                   	pop    %ebp
801046b4:	eb 9a                	jmp    80104650 <memmove>
801046b6:	8d 76 00             	lea    0x0(%esi),%esi
801046b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801046c0 <strncmp>:
801046c0:	55                   	push   %ebp
801046c1:	89 e5                	mov    %esp,%ebp
801046c3:	57                   	push   %edi
801046c4:	56                   	push   %esi
801046c5:	8b 7d 10             	mov    0x10(%ebp),%edi
801046c8:	53                   	push   %ebx
801046c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801046cc:	8b 75 0c             	mov    0xc(%ebp),%esi
801046cf:	85 ff                	test   %edi,%edi
801046d1:	74 2f                	je     80104702 <strncmp+0x42>
801046d3:	0f b6 01             	movzbl (%ecx),%eax
801046d6:	0f b6 1e             	movzbl (%esi),%ebx
801046d9:	84 c0                	test   %al,%al
801046db:	74 37                	je     80104714 <strncmp+0x54>
801046dd:	38 c3                	cmp    %al,%bl
801046df:	75 33                	jne    80104714 <strncmp+0x54>
801046e1:	01 f7                	add    %esi,%edi
801046e3:	eb 13                	jmp    801046f8 <strncmp+0x38>
801046e5:	8d 76 00             	lea    0x0(%esi),%esi
801046e8:	0f b6 01             	movzbl (%ecx),%eax
801046eb:	84 c0                	test   %al,%al
801046ed:	74 21                	je     80104710 <strncmp+0x50>
801046ef:	0f b6 1a             	movzbl (%edx),%ebx
801046f2:	89 d6                	mov    %edx,%esi
801046f4:	38 d8                	cmp    %bl,%al
801046f6:	75 1c                	jne    80104714 <strncmp+0x54>
801046f8:	8d 56 01             	lea    0x1(%esi),%edx
801046fb:	83 c1 01             	add    $0x1,%ecx
801046fe:	39 fa                	cmp    %edi,%edx
80104700:	75 e6                	jne    801046e8 <strncmp+0x28>
80104702:	5b                   	pop    %ebx
80104703:	31 c0                	xor    %eax,%eax
80104705:	5e                   	pop    %esi
80104706:	5f                   	pop    %edi
80104707:	5d                   	pop    %ebp
80104708:	c3                   	ret    
80104709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104710:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
80104714:	29 d8                	sub    %ebx,%eax
80104716:	5b                   	pop    %ebx
80104717:	5e                   	pop    %esi
80104718:	5f                   	pop    %edi
80104719:	5d                   	pop    %ebp
8010471a:	c3                   	ret    
8010471b:	90                   	nop
8010471c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104720 <strncpy>:
80104720:	55                   	push   %ebp
80104721:	89 e5                	mov    %esp,%ebp
80104723:	56                   	push   %esi
80104724:	53                   	push   %ebx
80104725:	8b 45 08             	mov    0x8(%ebp),%eax
80104728:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010472b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010472e:	89 c2                	mov    %eax,%edx
80104730:	eb 19                	jmp    8010474b <strncpy+0x2b>
80104732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104738:	83 c3 01             	add    $0x1,%ebx
8010473b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010473f:	83 c2 01             	add    $0x1,%edx
80104742:	84 c9                	test   %cl,%cl
80104744:	88 4a ff             	mov    %cl,-0x1(%edx)
80104747:	74 09                	je     80104752 <strncpy+0x32>
80104749:	89 f1                	mov    %esi,%ecx
8010474b:	85 c9                	test   %ecx,%ecx
8010474d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104750:	7f e6                	jg     80104738 <strncpy+0x18>
80104752:	31 c9                	xor    %ecx,%ecx
80104754:	85 f6                	test   %esi,%esi
80104756:	7e 17                	jle    8010476f <strncpy+0x4f>
80104758:	90                   	nop
80104759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104760:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104764:	89 f3                	mov    %esi,%ebx
80104766:	83 c1 01             	add    $0x1,%ecx
80104769:	29 cb                	sub    %ecx,%ebx
8010476b:	85 db                	test   %ebx,%ebx
8010476d:	7f f1                	jg     80104760 <strncpy+0x40>
8010476f:	5b                   	pop    %ebx
80104770:	5e                   	pop    %esi
80104771:	5d                   	pop    %ebp
80104772:	c3                   	ret    
80104773:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104780 <safestrcpy>:
80104780:	55                   	push   %ebp
80104781:	89 e5                	mov    %esp,%ebp
80104783:	56                   	push   %esi
80104784:	53                   	push   %ebx
80104785:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104788:	8b 45 08             	mov    0x8(%ebp),%eax
8010478b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010478e:	85 c9                	test   %ecx,%ecx
80104790:	7e 26                	jle    801047b8 <safestrcpy+0x38>
80104792:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104796:	89 c1                	mov    %eax,%ecx
80104798:	eb 17                	jmp    801047b1 <safestrcpy+0x31>
8010479a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801047a0:	83 c2 01             	add    $0x1,%edx
801047a3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801047a7:	83 c1 01             	add    $0x1,%ecx
801047aa:	84 db                	test   %bl,%bl
801047ac:	88 59 ff             	mov    %bl,-0x1(%ecx)
801047af:	74 04                	je     801047b5 <safestrcpy+0x35>
801047b1:	39 f2                	cmp    %esi,%edx
801047b3:	75 eb                	jne    801047a0 <safestrcpy+0x20>
801047b5:	c6 01 00             	movb   $0x0,(%ecx)
801047b8:	5b                   	pop    %ebx
801047b9:	5e                   	pop    %esi
801047ba:	5d                   	pop    %ebp
801047bb:	c3                   	ret    
801047bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801047c0 <strlen>:
801047c0:	55                   	push   %ebp
801047c1:	31 c0                	xor    %eax,%eax
801047c3:	89 e5                	mov    %esp,%ebp
801047c5:	8b 55 08             	mov    0x8(%ebp),%edx
801047c8:	80 3a 00             	cmpb   $0x0,(%edx)
801047cb:	74 0c                	je     801047d9 <strlen+0x19>
801047cd:	8d 76 00             	lea    0x0(%esi),%esi
801047d0:	83 c0 01             	add    $0x1,%eax
801047d3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801047d7:	75 f7                	jne    801047d0 <strlen+0x10>
801047d9:	5d                   	pop    %ebp
801047da:	c3                   	ret    

801047db <swtch>:
801047db:	8b 44 24 04          	mov    0x4(%esp),%eax
801047df:	8b 54 24 08          	mov    0x8(%esp),%edx
801047e3:	55                   	push   %ebp
801047e4:	53                   	push   %ebx
801047e5:	56                   	push   %esi
801047e6:	57                   	push   %edi
801047e7:	89 20                	mov    %esp,(%eax)
801047e9:	89 d4                	mov    %edx,%esp
801047eb:	5f                   	pop    %edi
801047ec:	5e                   	pop    %esi
801047ed:	5b                   	pop    %ebx
801047ee:	5d                   	pop    %ebp
801047ef:	c3                   	ret    

801047f0 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
801047f0:	55                   	push   %ebp
801047f1:	89 e5                	mov    %esp,%ebp
801047f3:	53                   	push   %ebx
801047f4:	83 ec 04             	sub    $0x4,%esp
801047f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *curproc = myproc();
801047fa:	e8 f1 ef ff ff       	call   801037f0 <myproc>

  if(addr >= curproc->sz || addr+4 > curproc->sz)
801047ff:	8b 00                	mov    (%eax),%eax
80104801:	39 d8                	cmp    %ebx,%eax
80104803:	76 1b                	jbe    80104820 <fetchint+0x30>
80104805:	8d 53 04             	lea    0x4(%ebx),%edx
80104808:	39 d0                	cmp    %edx,%eax
8010480a:	72 14                	jb     80104820 <fetchint+0x30>
    return -1;
  *ip = *(int*)(addr);
8010480c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010480f:	8b 13                	mov    (%ebx),%edx
80104811:	89 10                	mov    %edx,(%eax)
  return 0;
80104813:	31 c0                	xor    %eax,%eax
}
80104815:	83 c4 04             	add    $0x4,%esp
80104818:	5b                   	pop    %ebx
80104819:	5d                   	pop    %ebp
8010481a:	c3                   	ret    
8010481b:	90                   	nop
8010481c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104820:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104825:	eb ee                	jmp    80104815 <fetchint+0x25>
80104827:	89 f6                	mov    %esi,%esi
80104829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104830 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104830:	55                   	push   %ebp
80104831:	89 e5                	mov    %esp,%ebp
80104833:	53                   	push   %ebx
80104834:	83 ec 04             	sub    $0x4,%esp
80104837:	8b 5d 08             	mov    0x8(%ebp),%ebx
  char *s, *ep;
  struct proc *curproc = myproc();
8010483a:	e8 b1 ef ff ff       	call   801037f0 <myproc>

  if(addr >= curproc->sz)
8010483f:	39 18                	cmp    %ebx,(%eax)
80104841:	76 29                	jbe    8010486c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104843:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104846:	89 da                	mov    %ebx,%edx
80104848:	89 19                	mov    %ebx,(%ecx)
  ep = (char*)curproc->sz;
8010484a:	8b 00                	mov    (%eax),%eax
  for(s = *pp; s < ep; s++){
8010484c:	39 c3                	cmp    %eax,%ebx
8010484e:	73 1c                	jae    8010486c <fetchstr+0x3c>
    if(*s == 0)
80104850:	80 3b 00             	cmpb   $0x0,(%ebx)
80104853:	75 10                	jne    80104865 <fetchstr+0x35>
80104855:	eb 39                	jmp    80104890 <fetchstr+0x60>
80104857:	89 f6                	mov    %esi,%esi
80104859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104860:	80 3a 00             	cmpb   $0x0,(%edx)
80104863:	74 1b                	je     80104880 <fetchstr+0x50>
  for(s = *pp; s < ep; s++){
80104865:	83 c2 01             	add    $0x1,%edx
80104868:	39 d0                	cmp    %edx,%eax
8010486a:	77 f4                	ja     80104860 <fetchstr+0x30>
    return -1;
8010486c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return s - *pp;
  }
  return -1;
}
80104871:	83 c4 04             	add    $0x4,%esp
80104874:	5b                   	pop    %ebx
80104875:	5d                   	pop    %ebp
80104876:	c3                   	ret    
80104877:	89 f6                	mov    %esi,%esi
80104879:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104880:	83 c4 04             	add    $0x4,%esp
80104883:	89 d0                	mov    %edx,%eax
80104885:	29 d8                	sub    %ebx,%eax
80104887:	5b                   	pop    %ebx
80104888:	5d                   	pop    %ebp
80104889:	c3                   	ret    
8010488a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(*s == 0)
80104890:	31 c0                	xor    %eax,%eax
      return s - *pp;
80104892:	eb dd                	jmp    80104871 <fetchstr+0x41>
80104894:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010489a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801048a0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
801048a0:	55                   	push   %ebp
801048a1:	89 e5                	mov    %esp,%ebp
801048a3:	56                   	push   %esi
801048a4:	53                   	push   %ebx
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801048a5:	e8 46 ef ff ff       	call   801037f0 <myproc>
801048aa:	8b 40 18             	mov    0x18(%eax),%eax
801048ad:	8b 55 08             	mov    0x8(%ebp),%edx
801048b0:	8b 40 44             	mov    0x44(%eax),%eax
801048b3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
  struct proc *curproc = myproc();
801048b6:	e8 35 ef ff ff       	call   801037f0 <myproc>
  if(addr >= curproc->sz || addr+4 > curproc->sz)
801048bb:	8b 00                	mov    (%eax),%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801048bd:	8d 73 04             	lea    0x4(%ebx),%esi
  if(addr >= curproc->sz || addr+4 > curproc->sz)
801048c0:	39 c6                	cmp    %eax,%esi
801048c2:	73 1c                	jae    801048e0 <argint+0x40>
801048c4:	8d 53 08             	lea    0x8(%ebx),%edx
801048c7:	39 d0                	cmp    %edx,%eax
801048c9:	72 15                	jb     801048e0 <argint+0x40>
  *ip = *(int*)(addr);
801048cb:	8b 45 0c             	mov    0xc(%ebp),%eax
801048ce:	8b 53 04             	mov    0x4(%ebx),%edx
801048d1:	89 10                	mov    %edx,(%eax)
  return 0;
801048d3:	31 c0                	xor    %eax,%eax
}
801048d5:	5b                   	pop    %ebx
801048d6:	5e                   	pop    %esi
801048d7:	5d                   	pop    %ebp
801048d8:	c3                   	ret    
801048d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
801048e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchint((myproc()->tf->esp) + 4 + 4*n, ip);
801048e5:	eb ee                	jmp    801048d5 <argint+0x35>
801048e7:	89 f6                	mov    %esi,%esi
801048e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048f0 <argptr>:
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
801048f0:	55                   	push   %ebp
801048f1:	89 e5                	mov    %esp,%ebp
801048f3:	56                   	push   %esi
801048f4:	53                   	push   %ebx
801048f5:	83 ec 10             	sub    $0x10,%esp
801048f8:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int i;
  struct proc *curproc = myproc();
801048fb:	e8 f0 ee ff ff       	call   801037f0 <myproc>
80104900:	89 c6                	mov    %eax,%esi

  if(argint(n, &i) < 0)
80104902:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104905:	83 ec 08             	sub    $0x8,%esp
80104908:	50                   	push   %eax
80104909:	ff 75 08             	pushl  0x8(%ebp)
8010490c:	e8 8f ff ff ff       	call   801048a0 <argint>
    return -1;
  if(size < 0 || (uint)i >= curproc->sz || (uint)i+size > curproc->sz)
80104911:	83 c4 10             	add    $0x10,%esp
80104914:	85 c0                	test   %eax,%eax
80104916:	78 28                	js     80104940 <argptr+0x50>
80104918:	85 db                	test   %ebx,%ebx
8010491a:	78 24                	js     80104940 <argptr+0x50>
8010491c:	8b 16                	mov    (%esi),%edx
8010491e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104921:	39 c2                	cmp    %eax,%edx
80104923:	76 1b                	jbe    80104940 <argptr+0x50>
80104925:	01 c3                	add    %eax,%ebx
80104927:	39 da                	cmp    %ebx,%edx
80104929:	72 15                	jb     80104940 <argptr+0x50>
    return -1;
  *pp = (char*)i;
8010492b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010492e:	89 02                	mov    %eax,(%edx)
  return 0;
80104930:	31 c0                	xor    %eax,%eax
}
80104932:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104935:	5b                   	pop    %ebx
80104936:	5e                   	pop    %esi
80104937:	5d                   	pop    %ebp
80104938:	c3                   	ret    
80104939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104940:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104945:	eb eb                	jmp    80104932 <argptr+0x42>
80104947:	89 f6                	mov    %esi,%esi
80104949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104950 <argstr>:
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104950:	55                   	push   %ebp
80104951:	89 e5                	mov    %esp,%ebp
80104953:	83 ec 20             	sub    $0x20,%esp
  int addr;
  if(argint(n, &addr) < 0)
80104956:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104959:	50                   	push   %eax
8010495a:	ff 75 08             	pushl  0x8(%ebp)
8010495d:	e8 3e ff ff ff       	call   801048a0 <argint>
80104962:	83 c4 10             	add    $0x10,%esp
80104965:	85 c0                	test   %eax,%eax
80104967:	78 17                	js     80104980 <argstr+0x30>
    return -1;
  return fetchstr(addr, pp);
80104969:	83 ec 08             	sub    $0x8,%esp
8010496c:	ff 75 0c             	pushl  0xc(%ebp)
8010496f:	ff 75 f4             	pushl  -0xc(%ebp)
80104972:	e8 b9 fe ff ff       	call   80104830 <fetchstr>
80104977:	83 c4 10             	add    $0x10,%esp
}
8010497a:	c9                   	leave  
8010497b:	c3                   	ret    
8010497c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80104980:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104985:	c9                   	leave  
80104986:	c3                   	ret    
80104987:	89 f6                	mov    %esi,%esi
80104989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104990 <syscall>:
[SYS_getppid] sys_getppid,
};

void
syscall(void)
{
80104990:	55                   	push   %ebp
80104991:	89 e5                	mov    %esp,%ebp
80104993:	53                   	push   %ebx
80104994:	83 ec 04             	sub    $0x4,%esp
  int num;
  struct proc *curproc = myproc();
80104997:	e8 54 ee ff ff       	call   801037f0 <myproc>
8010499c:	89 c3                	mov    %eax,%ebx

  num = curproc->tf->eax;
8010499e:	8b 40 18             	mov    0x18(%eax),%eax
801049a1:	8b 40 1c             	mov    0x1c(%eax),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
801049a4:	8d 50 ff             	lea    -0x1(%eax),%edx
801049a7:	83 fa 17             	cmp    $0x17,%edx
801049aa:	77 1c                	ja     801049c8 <syscall+0x38>
801049ac:	8b 14 85 c0 77 10 80 	mov    -0x7fef8840(,%eax,4),%edx
801049b3:	85 d2                	test   %edx,%edx
801049b5:	74 11                	je     801049c8 <syscall+0x38>
    curproc->tf->eax = syscalls[num]();
801049b7:	ff d2                	call   *%edx
801049b9:	8b 53 18             	mov    0x18(%ebx),%edx
801049bc:	89 42 1c             	mov    %eax,0x1c(%edx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            curproc->pid, curproc->name, num);
    curproc->tf->eax = -1;
  }
}
801049bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801049c2:	c9                   	leave  
801049c3:	c3                   	ret    
801049c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cprintf("%d %s: unknown sys call %d\n",
801049c8:	50                   	push   %eax
            curproc->pid, curproc->name, num);
801049c9:	8d 43 6c             	lea    0x6c(%ebx),%eax
    cprintf("%d %s: unknown sys call %d\n",
801049cc:	50                   	push   %eax
801049cd:	ff 73 10             	pushl  0x10(%ebx)
801049d0:	68 a1 77 10 80       	push   $0x801077a1
801049d5:	e8 86 bc ff ff       	call   80100660 <cprintf>
    curproc->tf->eax = -1;
801049da:	8b 43 18             	mov    0x18(%ebx),%eax
801049dd:	83 c4 10             	add    $0x10,%esp
801049e0:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
}
801049e7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801049ea:	c9                   	leave  
801049eb:	c3                   	ret    
801049ec:	66 90                	xchg   %ax,%ax
801049ee:	66 90                	xchg   %ax,%ax

801049f0 <create>:
801049f0:	55                   	push   %ebp
801049f1:	89 e5                	mov    %esp,%ebp
801049f3:	57                   	push   %edi
801049f4:	56                   	push   %esi
801049f5:	53                   	push   %ebx
801049f6:	8d 75 da             	lea    -0x26(%ebp),%esi
801049f9:	83 ec 44             	sub    $0x44,%esp
801049fc:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801049ff:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104a02:	56                   	push   %esi
80104a03:	50                   	push   %eax
80104a04:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104a07:	89 4d bc             	mov    %ecx,-0x44(%ebp)
80104a0a:	e8 01 d5 ff ff       	call   80101f10 <nameiparent>
80104a0f:	83 c4 10             	add    $0x10,%esp
80104a12:	85 c0                	test   %eax,%eax
80104a14:	0f 84 46 01 00 00    	je     80104b60 <create+0x170>
80104a1a:	83 ec 0c             	sub    $0xc,%esp
80104a1d:	89 c3                	mov    %eax,%ebx
80104a1f:	50                   	push   %eax
80104a20:	e8 6b cc ff ff       	call   80101690 <ilock>
80104a25:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104a28:	83 c4 0c             	add    $0xc,%esp
80104a2b:	50                   	push   %eax
80104a2c:	56                   	push   %esi
80104a2d:	53                   	push   %ebx
80104a2e:	e8 8d d1 ff ff       	call   80101bc0 <dirlookup>
80104a33:	83 c4 10             	add    $0x10,%esp
80104a36:	85 c0                	test   %eax,%eax
80104a38:	89 c7                	mov    %eax,%edi
80104a3a:	74 34                	je     80104a70 <create+0x80>
80104a3c:	83 ec 0c             	sub    $0xc,%esp
80104a3f:	53                   	push   %ebx
80104a40:	e8 db ce ff ff       	call   80101920 <iunlockput>
80104a45:	89 3c 24             	mov    %edi,(%esp)
80104a48:	e8 43 cc ff ff       	call   80101690 <ilock>
80104a4d:	83 c4 10             	add    $0x10,%esp
80104a50:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104a55:	0f 85 95 00 00 00    	jne    80104af0 <create+0x100>
80104a5b:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104a60:	0f 85 8a 00 00 00    	jne    80104af0 <create+0x100>
80104a66:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104a69:	89 f8                	mov    %edi,%eax
80104a6b:	5b                   	pop    %ebx
80104a6c:	5e                   	pop    %esi
80104a6d:	5f                   	pop    %edi
80104a6e:	5d                   	pop    %ebp
80104a6f:	c3                   	ret    
80104a70:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104a74:	83 ec 08             	sub    $0x8,%esp
80104a77:	50                   	push   %eax
80104a78:	ff 33                	pushl  (%ebx)
80104a7a:	e8 a1 ca ff ff       	call   80101520 <ialloc>
80104a7f:	83 c4 10             	add    $0x10,%esp
80104a82:	85 c0                	test   %eax,%eax
80104a84:	89 c7                	mov    %eax,%edi
80104a86:	0f 84 e8 00 00 00    	je     80104b74 <create+0x184>
80104a8c:	83 ec 0c             	sub    $0xc,%esp
80104a8f:	50                   	push   %eax
80104a90:	e8 fb cb ff ff       	call   80101690 <ilock>
80104a95:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104a99:	66 89 47 52          	mov    %ax,0x52(%edi)
80104a9d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104aa1:	66 89 47 54          	mov    %ax,0x54(%edi)
80104aa5:	b8 01 00 00 00       	mov    $0x1,%eax
80104aaa:	66 89 47 56          	mov    %ax,0x56(%edi)
80104aae:	89 3c 24             	mov    %edi,(%esp)
80104ab1:	e8 2a cb ff ff       	call   801015e0 <iupdate>
80104ab6:	83 c4 10             	add    $0x10,%esp
80104ab9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104abe:	74 50                	je     80104b10 <create+0x120>
80104ac0:	83 ec 04             	sub    $0x4,%esp
80104ac3:	ff 77 04             	pushl  0x4(%edi)
80104ac6:	56                   	push   %esi
80104ac7:	53                   	push   %ebx
80104ac8:	e8 63 d3 ff ff       	call   80101e30 <dirlink>
80104acd:	83 c4 10             	add    $0x10,%esp
80104ad0:	85 c0                	test   %eax,%eax
80104ad2:	0f 88 8f 00 00 00    	js     80104b67 <create+0x177>
80104ad8:	83 ec 0c             	sub    $0xc,%esp
80104adb:	53                   	push   %ebx
80104adc:	e8 3f ce ff ff       	call   80101920 <iunlockput>
80104ae1:	83 c4 10             	add    $0x10,%esp
80104ae4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ae7:	89 f8                	mov    %edi,%eax
80104ae9:	5b                   	pop    %ebx
80104aea:	5e                   	pop    %esi
80104aeb:	5f                   	pop    %edi
80104aec:	5d                   	pop    %ebp
80104aed:	c3                   	ret    
80104aee:	66 90                	xchg   %ax,%ax
80104af0:	83 ec 0c             	sub    $0xc,%esp
80104af3:	57                   	push   %edi
80104af4:	31 ff                	xor    %edi,%edi
80104af6:	e8 25 ce ff ff       	call   80101920 <iunlockput>
80104afb:	83 c4 10             	add    $0x10,%esp
80104afe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104b01:	89 f8                	mov    %edi,%eax
80104b03:	5b                   	pop    %ebx
80104b04:	5e                   	pop    %esi
80104b05:	5f                   	pop    %edi
80104b06:	5d                   	pop    %ebp
80104b07:	c3                   	ret    
80104b08:	90                   	nop
80104b09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b10:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104b15:	83 ec 0c             	sub    $0xc,%esp
80104b18:	53                   	push   %ebx
80104b19:	e8 c2 ca ff ff       	call   801015e0 <iupdate>
80104b1e:	83 c4 0c             	add    $0xc,%esp
80104b21:	ff 77 04             	pushl  0x4(%edi)
80104b24:	68 40 78 10 80       	push   $0x80107840
80104b29:	57                   	push   %edi
80104b2a:	e8 01 d3 ff ff       	call   80101e30 <dirlink>
80104b2f:	83 c4 10             	add    $0x10,%esp
80104b32:	85 c0                	test   %eax,%eax
80104b34:	78 1c                	js     80104b52 <create+0x162>
80104b36:	83 ec 04             	sub    $0x4,%esp
80104b39:	ff 73 04             	pushl  0x4(%ebx)
80104b3c:	68 3f 78 10 80       	push   $0x8010783f
80104b41:	57                   	push   %edi
80104b42:	e8 e9 d2 ff ff       	call   80101e30 <dirlink>
80104b47:	83 c4 10             	add    $0x10,%esp
80104b4a:	85 c0                	test   %eax,%eax
80104b4c:	0f 89 6e ff ff ff    	jns    80104ac0 <create+0xd0>
80104b52:	83 ec 0c             	sub    $0xc,%esp
80104b55:	68 33 78 10 80       	push   $0x80107833
80104b5a:	e8 31 b8 ff ff       	call   80100390 <panic>
80104b5f:	90                   	nop
80104b60:	31 ff                	xor    %edi,%edi
80104b62:	e9 ff fe ff ff       	jmp    80104a66 <create+0x76>
80104b67:	83 ec 0c             	sub    $0xc,%esp
80104b6a:	68 42 78 10 80       	push   $0x80107842
80104b6f:	e8 1c b8 ff ff       	call   80100390 <panic>
80104b74:	83 ec 0c             	sub    $0xc,%esp
80104b77:	68 24 78 10 80       	push   $0x80107824
80104b7c:	e8 0f b8 ff ff       	call   80100390 <panic>
80104b81:	eb 0d                	jmp    80104b90 <argfd.constprop.0>
80104b83:	90                   	nop
80104b84:	90                   	nop
80104b85:	90                   	nop
80104b86:	90                   	nop
80104b87:	90                   	nop
80104b88:	90                   	nop
80104b89:	90                   	nop
80104b8a:	90                   	nop
80104b8b:	90                   	nop
80104b8c:	90                   	nop
80104b8d:	90                   	nop
80104b8e:	90                   	nop
80104b8f:	90                   	nop

80104b90 <argfd.constprop.0>:
80104b90:	55                   	push   %ebp
80104b91:	89 e5                	mov    %esp,%ebp
80104b93:	56                   	push   %esi
80104b94:	53                   	push   %ebx
80104b95:	89 c3                	mov    %eax,%ebx
80104b97:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b9a:	89 d6                	mov    %edx,%esi
80104b9c:	83 ec 18             	sub    $0x18,%esp
80104b9f:	50                   	push   %eax
80104ba0:	6a 00                	push   $0x0
80104ba2:	e8 f9 fc ff ff       	call   801048a0 <argint>
80104ba7:	83 c4 10             	add    $0x10,%esp
80104baa:	85 c0                	test   %eax,%eax
80104bac:	78 2a                	js     80104bd8 <argfd.constprop.0+0x48>
80104bae:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104bb2:	77 24                	ja     80104bd8 <argfd.constprop.0+0x48>
80104bb4:	e8 37 ec ff ff       	call   801037f0 <myproc>
80104bb9:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104bbc:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104bc0:	85 c0                	test   %eax,%eax
80104bc2:	74 14                	je     80104bd8 <argfd.constprop.0+0x48>
80104bc4:	85 db                	test   %ebx,%ebx
80104bc6:	74 02                	je     80104bca <argfd.constprop.0+0x3a>
80104bc8:	89 13                	mov    %edx,(%ebx)
80104bca:	89 06                	mov    %eax,(%esi)
80104bcc:	31 c0                	xor    %eax,%eax
80104bce:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104bd1:	5b                   	pop    %ebx
80104bd2:	5e                   	pop    %esi
80104bd3:	5d                   	pop    %ebp
80104bd4:	c3                   	ret    
80104bd5:	8d 76 00             	lea    0x0(%esi),%esi
80104bd8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104bdd:	eb ef                	jmp    80104bce <argfd.constprop.0+0x3e>
80104bdf:	90                   	nop

80104be0 <sys_dup>:
80104be0:	55                   	push   %ebp
80104be1:	31 c0                	xor    %eax,%eax
80104be3:	89 e5                	mov    %esp,%ebp
80104be5:	56                   	push   %esi
80104be6:	53                   	push   %ebx
80104be7:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104bea:	83 ec 10             	sub    $0x10,%esp
80104bed:	e8 9e ff ff ff       	call   80104b90 <argfd.constprop.0>
80104bf2:	85 c0                	test   %eax,%eax
80104bf4:	78 42                	js     80104c38 <sys_dup+0x58>
80104bf6:	8b 75 f4             	mov    -0xc(%ebp),%esi
80104bf9:	31 db                	xor    %ebx,%ebx
80104bfb:	e8 f0 eb ff ff       	call   801037f0 <myproc>
80104c00:	eb 0e                	jmp    80104c10 <sys_dup+0x30>
80104c02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104c08:	83 c3 01             	add    $0x1,%ebx
80104c0b:	83 fb 10             	cmp    $0x10,%ebx
80104c0e:	74 28                	je     80104c38 <sys_dup+0x58>
80104c10:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104c14:	85 d2                	test   %edx,%edx
80104c16:	75 f0                	jne    80104c08 <sys_dup+0x28>
80104c18:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
80104c1c:	83 ec 0c             	sub    $0xc,%esp
80104c1f:	ff 75 f4             	pushl  -0xc(%ebp)
80104c22:	e8 c9 c1 ff ff       	call   80100df0 <filedup>
80104c27:	83 c4 10             	add    $0x10,%esp
80104c2a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c2d:	89 d8                	mov    %ebx,%eax
80104c2f:	5b                   	pop    %ebx
80104c30:	5e                   	pop    %esi
80104c31:	5d                   	pop    %ebp
80104c32:	c3                   	ret    
80104c33:	90                   	nop
80104c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104c38:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104c3b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104c40:	89 d8                	mov    %ebx,%eax
80104c42:	5b                   	pop    %ebx
80104c43:	5e                   	pop    %esi
80104c44:	5d                   	pop    %ebp
80104c45:	c3                   	ret    
80104c46:	8d 76 00             	lea    0x0(%esi),%esi
80104c49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104c50 <sys_read>:
80104c50:	55                   	push   %ebp
80104c51:	31 c0                	xor    %eax,%eax
80104c53:	89 e5                	mov    %esp,%ebp
80104c55:	83 ec 18             	sub    $0x18,%esp
80104c58:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104c5b:	e8 30 ff ff ff       	call   80104b90 <argfd.constprop.0>
80104c60:	85 c0                	test   %eax,%eax
80104c62:	78 4c                	js     80104cb0 <sys_read+0x60>
80104c64:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104c67:	83 ec 08             	sub    $0x8,%esp
80104c6a:	50                   	push   %eax
80104c6b:	6a 02                	push   $0x2
80104c6d:	e8 2e fc ff ff       	call   801048a0 <argint>
80104c72:	83 c4 10             	add    $0x10,%esp
80104c75:	85 c0                	test   %eax,%eax
80104c77:	78 37                	js     80104cb0 <sys_read+0x60>
80104c79:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104c7c:	83 ec 04             	sub    $0x4,%esp
80104c7f:	ff 75 f0             	pushl  -0x10(%ebp)
80104c82:	50                   	push   %eax
80104c83:	6a 01                	push   $0x1
80104c85:	e8 66 fc ff ff       	call   801048f0 <argptr>
80104c8a:	83 c4 10             	add    $0x10,%esp
80104c8d:	85 c0                	test   %eax,%eax
80104c8f:	78 1f                	js     80104cb0 <sys_read+0x60>
80104c91:	83 ec 04             	sub    $0x4,%esp
80104c94:	ff 75 f0             	pushl  -0x10(%ebp)
80104c97:	ff 75 f4             	pushl  -0xc(%ebp)
80104c9a:	ff 75 ec             	pushl  -0x14(%ebp)
80104c9d:	e8 be c2 ff ff       	call   80100f60 <fileread>
80104ca2:	83 c4 10             	add    $0x10,%esp
80104ca5:	c9                   	leave  
80104ca6:	c3                   	ret    
80104ca7:	89 f6                	mov    %esi,%esi
80104ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104cb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104cb5:	c9                   	leave  
80104cb6:	c3                   	ret    
80104cb7:	89 f6                	mov    %esi,%esi
80104cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cc0 <sys_write>:
80104cc0:	55                   	push   %ebp
80104cc1:	31 c0                	xor    %eax,%eax
80104cc3:	89 e5                	mov    %esp,%ebp
80104cc5:	83 ec 18             	sub    $0x18,%esp
80104cc8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104ccb:	e8 c0 fe ff ff       	call   80104b90 <argfd.constprop.0>
80104cd0:	85 c0                	test   %eax,%eax
80104cd2:	78 4c                	js     80104d20 <sys_write+0x60>
80104cd4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104cd7:	83 ec 08             	sub    $0x8,%esp
80104cda:	50                   	push   %eax
80104cdb:	6a 02                	push   $0x2
80104cdd:	e8 be fb ff ff       	call   801048a0 <argint>
80104ce2:	83 c4 10             	add    $0x10,%esp
80104ce5:	85 c0                	test   %eax,%eax
80104ce7:	78 37                	js     80104d20 <sys_write+0x60>
80104ce9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104cec:	83 ec 04             	sub    $0x4,%esp
80104cef:	ff 75 f0             	pushl  -0x10(%ebp)
80104cf2:	50                   	push   %eax
80104cf3:	6a 01                	push   $0x1
80104cf5:	e8 f6 fb ff ff       	call   801048f0 <argptr>
80104cfa:	83 c4 10             	add    $0x10,%esp
80104cfd:	85 c0                	test   %eax,%eax
80104cff:	78 1f                	js     80104d20 <sys_write+0x60>
80104d01:	83 ec 04             	sub    $0x4,%esp
80104d04:	ff 75 f0             	pushl  -0x10(%ebp)
80104d07:	ff 75 f4             	pushl  -0xc(%ebp)
80104d0a:	ff 75 ec             	pushl  -0x14(%ebp)
80104d0d:	e8 de c2 ff ff       	call   80100ff0 <filewrite>
80104d12:	83 c4 10             	add    $0x10,%esp
80104d15:	c9                   	leave  
80104d16:	c3                   	ret    
80104d17:	89 f6                	mov    %esi,%esi
80104d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104d20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d25:	c9                   	leave  
80104d26:	c3                   	ret    
80104d27:	89 f6                	mov    %esi,%esi
80104d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d30 <sys_close>:
80104d30:	55                   	push   %ebp
80104d31:	89 e5                	mov    %esp,%ebp
80104d33:	83 ec 18             	sub    $0x18,%esp
80104d36:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104d39:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104d3c:	e8 4f fe ff ff       	call   80104b90 <argfd.constprop.0>
80104d41:	85 c0                	test   %eax,%eax
80104d43:	78 2b                	js     80104d70 <sys_close+0x40>
80104d45:	e8 a6 ea ff ff       	call   801037f0 <myproc>
80104d4a:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104d4d:	83 ec 0c             	sub    $0xc,%esp
80104d50:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104d57:	00 
80104d58:	ff 75 f4             	pushl  -0xc(%ebp)
80104d5b:	e8 e0 c0 ff ff       	call   80100e40 <fileclose>
80104d60:	83 c4 10             	add    $0x10,%esp
80104d63:	31 c0                	xor    %eax,%eax
80104d65:	c9                   	leave  
80104d66:	c3                   	ret    
80104d67:	89 f6                	mov    %esi,%esi
80104d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104d70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d75:	c9                   	leave  
80104d76:	c3                   	ret    
80104d77:	89 f6                	mov    %esi,%esi
80104d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d80 <sys_fstat>:
80104d80:	55                   	push   %ebp
80104d81:	31 c0                	xor    %eax,%eax
80104d83:	89 e5                	mov    %esp,%ebp
80104d85:	83 ec 18             	sub    $0x18,%esp
80104d88:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104d8b:	e8 00 fe ff ff       	call   80104b90 <argfd.constprop.0>
80104d90:	85 c0                	test   %eax,%eax
80104d92:	78 2c                	js     80104dc0 <sys_fstat+0x40>
80104d94:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d97:	83 ec 04             	sub    $0x4,%esp
80104d9a:	6a 14                	push   $0x14
80104d9c:	50                   	push   %eax
80104d9d:	6a 01                	push   $0x1
80104d9f:	e8 4c fb ff ff       	call   801048f0 <argptr>
80104da4:	83 c4 10             	add    $0x10,%esp
80104da7:	85 c0                	test   %eax,%eax
80104da9:	78 15                	js     80104dc0 <sys_fstat+0x40>
80104dab:	83 ec 08             	sub    $0x8,%esp
80104dae:	ff 75 f4             	pushl  -0xc(%ebp)
80104db1:	ff 75 f0             	pushl  -0x10(%ebp)
80104db4:	e8 57 c1 ff ff       	call   80100f10 <filestat>
80104db9:	83 c4 10             	add    $0x10,%esp
80104dbc:	c9                   	leave  
80104dbd:	c3                   	ret    
80104dbe:	66 90                	xchg   %ax,%ax
80104dc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dc5:	c9                   	leave  
80104dc6:	c3                   	ret    
80104dc7:	89 f6                	mov    %esi,%esi
80104dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104dd0 <sys_link>:
80104dd0:	55                   	push   %ebp
80104dd1:	89 e5                	mov    %esp,%ebp
80104dd3:	57                   	push   %edi
80104dd4:	56                   	push   %esi
80104dd5:	53                   	push   %ebx
80104dd6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104dd9:	83 ec 34             	sub    $0x34,%esp
80104ddc:	50                   	push   %eax
80104ddd:	6a 00                	push   $0x0
80104ddf:	e8 6c fb ff ff       	call   80104950 <argstr>
80104de4:	83 c4 10             	add    $0x10,%esp
80104de7:	85 c0                	test   %eax,%eax
80104de9:	0f 88 fb 00 00 00    	js     80104eea <sys_link+0x11a>
80104def:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104df2:	83 ec 08             	sub    $0x8,%esp
80104df5:	50                   	push   %eax
80104df6:	6a 01                	push   $0x1
80104df8:	e8 53 fb ff ff       	call   80104950 <argstr>
80104dfd:	83 c4 10             	add    $0x10,%esp
80104e00:	85 c0                	test   %eax,%eax
80104e02:	0f 88 e2 00 00 00    	js     80104eea <sys_link+0x11a>
80104e08:	e8 a3 dd ff ff       	call   80102bb0 <begin_op>
80104e0d:	83 ec 0c             	sub    $0xc,%esp
80104e10:	ff 75 d4             	pushl  -0x2c(%ebp)
80104e13:	e8 d8 d0 ff ff       	call   80101ef0 <namei>
80104e18:	83 c4 10             	add    $0x10,%esp
80104e1b:	85 c0                	test   %eax,%eax
80104e1d:	89 c3                	mov    %eax,%ebx
80104e1f:	0f 84 ea 00 00 00    	je     80104f0f <sys_link+0x13f>
80104e25:	83 ec 0c             	sub    $0xc,%esp
80104e28:	50                   	push   %eax
80104e29:	e8 62 c8 ff ff       	call   80101690 <ilock>
80104e2e:	83 c4 10             	add    $0x10,%esp
80104e31:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104e36:	0f 84 bb 00 00 00    	je     80104ef7 <sys_link+0x127>
80104e3c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104e41:	83 ec 0c             	sub    $0xc,%esp
80104e44:	8d 7d da             	lea    -0x26(%ebp),%edi
80104e47:	53                   	push   %ebx
80104e48:	e8 93 c7 ff ff       	call   801015e0 <iupdate>
80104e4d:	89 1c 24             	mov    %ebx,(%esp)
80104e50:	e8 1b c9 ff ff       	call   80101770 <iunlock>
80104e55:	58                   	pop    %eax
80104e56:	5a                   	pop    %edx
80104e57:	57                   	push   %edi
80104e58:	ff 75 d0             	pushl  -0x30(%ebp)
80104e5b:	e8 b0 d0 ff ff       	call   80101f10 <nameiparent>
80104e60:	83 c4 10             	add    $0x10,%esp
80104e63:	85 c0                	test   %eax,%eax
80104e65:	89 c6                	mov    %eax,%esi
80104e67:	74 5b                	je     80104ec4 <sys_link+0xf4>
80104e69:	83 ec 0c             	sub    $0xc,%esp
80104e6c:	50                   	push   %eax
80104e6d:	e8 1e c8 ff ff       	call   80101690 <ilock>
80104e72:	83 c4 10             	add    $0x10,%esp
80104e75:	8b 03                	mov    (%ebx),%eax
80104e77:	39 06                	cmp    %eax,(%esi)
80104e79:	75 3d                	jne    80104eb8 <sys_link+0xe8>
80104e7b:	83 ec 04             	sub    $0x4,%esp
80104e7e:	ff 73 04             	pushl  0x4(%ebx)
80104e81:	57                   	push   %edi
80104e82:	56                   	push   %esi
80104e83:	e8 a8 cf ff ff       	call   80101e30 <dirlink>
80104e88:	83 c4 10             	add    $0x10,%esp
80104e8b:	85 c0                	test   %eax,%eax
80104e8d:	78 29                	js     80104eb8 <sys_link+0xe8>
80104e8f:	83 ec 0c             	sub    $0xc,%esp
80104e92:	56                   	push   %esi
80104e93:	e8 88 ca ff ff       	call   80101920 <iunlockput>
80104e98:	89 1c 24             	mov    %ebx,(%esp)
80104e9b:	e8 20 c9 ff ff       	call   801017c0 <iput>
80104ea0:	e8 7b dd ff ff       	call   80102c20 <end_op>
80104ea5:	83 c4 10             	add    $0x10,%esp
80104ea8:	31 c0                	xor    %eax,%eax
80104eaa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ead:	5b                   	pop    %ebx
80104eae:	5e                   	pop    %esi
80104eaf:	5f                   	pop    %edi
80104eb0:	5d                   	pop    %ebp
80104eb1:	c3                   	ret    
80104eb2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104eb8:	83 ec 0c             	sub    $0xc,%esp
80104ebb:	56                   	push   %esi
80104ebc:	e8 5f ca ff ff       	call   80101920 <iunlockput>
80104ec1:	83 c4 10             	add    $0x10,%esp
80104ec4:	83 ec 0c             	sub    $0xc,%esp
80104ec7:	53                   	push   %ebx
80104ec8:	e8 c3 c7 ff ff       	call   80101690 <ilock>
80104ecd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80104ed2:	89 1c 24             	mov    %ebx,(%esp)
80104ed5:	e8 06 c7 ff ff       	call   801015e0 <iupdate>
80104eda:	89 1c 24             	mov    %ebx,(%esp)
80104edd:	e8 3e ca ff ff       	call   80101920 <iunlockput>
80104ee2:	e8 39 dd ff ff       	call   80102c20 <end_op>
80104ee7:	83 c4 10             	add    $0x10,%esp
80104eea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104eed:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ef2:	5b                   	pop    %ebx
80104ef3:	5e                   	pop    %esi
80104ef4:	5f                   	pop    %edi
80104ef5:	5d                   	pop    %ebp
80104ef6:	c3                   	ret    
80104ef7:	83 ec 0c             	sub    $0xc,%esp
80104efa:	53                   	push   %ebx
80104efb:	e8 20 ca ff ff       	call   80101920 <iunlockput>
80104f00:	e8 1b dd ff ff       	call   80102c20 <end_op>
80104f05:	83 c4 10             	add    $0x10,%esp
80104f08:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f0d:	eb 9b                	jmp    80104eaa <sys_link+0xda>
80104f0f:	e8 0c dd ff ff       	call   80102c20 <end_op>
80104f14:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f19:	eb 8f                	jmp    80104eaa <sys_link+0xda>
80104f1b:	90                   	nop
80104f1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104f20 <sys_unlink>:
80104f20:	55                   	push   %ebp
80104f21:	89 e5                	mov    %esp,%ebp
80104f23:	57                   	push   %edi
80104f24:	56                   	push   %esi
80104f25:	53                   	push   %ebx
80104f26:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104f29:	83 ec 44             	sub    $0x44,%esp
80104f2c:	50                   	push   %eax
80104f2d:	6a 00                	push   $0x0
80104f2f:	e8 1c fa ff ff       	call   80104950 <argstr>
80104f34:	83 c4 10             	add    $0x10,%esp
80104f37:	85 c0                	test   %eax,%eax
80104f39:	0f 88 77 01 00 00    	js     801050b6 <sys_unlink+0x196>
80104f3f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80104f42:	e8 69 dc ff ff       	call   80102bb0 <begin_op>
80104f47:	83 ec 08             	sub    $0x8,%esp
80104f4a:	53                   	push   %ebx
80104f4b:	ff 75 c0             	pushl  -0x40(%ebp)
80104f4e:	e8 bd cf ff ff       	call   80101f10 <nameiparent>
80104f53:	83 c4 10             	add    $0x10,%esp
80104f56:	85 c0                	test   %eax,%eax
80104f58:	89 c6                	mov    %eax,%esi
80104f5a:	0f 84 60 01 00 00    	je     801050c0 <sys_unlink+0x1a0>
80104f60:	83 ec 0c             	sub    $0xc,%esp
80104f63:	50                   	push   %eax
80104f64:	e8 27 c7 ff ff       	call   80101690 <ilock>
80104f69:	58                   	pop    %eax
80104f6a:	5a                   	pop    %edx
80104f6b:	68 40 78 10 80       	push   $0x80107840
80104f70:	53                   	push   %ebx
80104f71:	e8 2a cc ff ff       	call   80101ba0 <namecmp>
80104f76:	83 c4 10             	add    $0x10,%esp
80104f79:	85 c0                	test   %eax,%eax
80104f7b:	0f 84 03 01 00 00    	je     80105084 <sys_unlink+0x164>
80104f81:	83 ec 08             	sub    $0x8,%esp
80104f84:	68 3f 78 10 80       	push   $0x8010783f
80104f89:	53                   	push   %ebx
80104f8a:	e8 11 cc ff ff       	call   80101ba0 <namecmp>
80104f8f:	83 c4 10             	add    $0x10,%esp
80104f92:	85 c0                	test   %eax,%eax
80104f94:	0f 84 ea 00 00 00    	je     80105084 <sys_unlink+0x164>
80104f9a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80104f9d:	83 ec 04             	sub    $0x4,%esp
80104fa0:	50                   	push   %eax
80104fa1:	53                   	push   %ebx
80104fa2:	56                   	push   %esi
80104fa3:	e8 18 cc ff ff       	call   80101bc0 <dirlookup>
80104fa8:	83 c4 10             	add    $0x10,%esp
80104fab:	85 c0                	test   %eax,%eax
80104fad:	89 c3                	mov    %eax,%ebx
80104faf:	0f 84 cf 00 00 00    	je     80105084 <sys_unlink+0x164>
80104fb5:	83 ec 0c             	sub    $0xc,%esp
80104fb8:	50                   	push   %eax
80104fb9:	e8 d2 c6 ff ff       	call   80101690 <ilock>
80104fbe:	83 c4 10             	add    $0x10,%esp
80104fc1:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
80104fc6:	0f 8e 10 01 00 00    	jle    801050dc <sys_unlink+0x1bc>
80104fcc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104fd1:	74 6d                	je     80105040 <sys_unlink+0x120>
80104fd3:	8d 45 d8             	lea    -0x28(%ebp),%eax
80104fd6:	83 ec 04             	sub    $0x4,%esp
80104fd9:	6a 10                	push   $0x10
80104fdb:	6a 00                	push   $0x0
80104fdd:	50                   	push   %eax
80104fde:	e8 bd f5 ff ff       	call   801045a0 <memset>
80104fe3:	8d 45 d8             	lea    -0x28(%ebp),%eax
80104fe6:	6a 10                	push   $0x10
80104fe8:	ff 75 c4             	pushl  -0x3c(%ebp)
80104feb:	50                   	push   %eax
80104fec:	56                   	push   %esi
80104fed:	e8 7e ca ff ff       	call   80101a70 <writei>
80104ff2:	83 c4 20             	add    $0x20,%esp
80104ff5:	83 f8 10             	cmp    $0x10,%eax
80104ff8:	0f 85 eb 00 00 00    	jne    801050e9 <sys_unlink+0x1c9>
80104ffe:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105003:	0f 84 97 00 00 00    	je     801050a0 <sys_unlink+0x180>
80105009:	83 ec 0c             	sub    $0xc,%esp
8010500c:	56                   	push   %esi
8010500d:	e8 0e c9 ff ff       	call   80101920 <iunlockput>
80105012:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80105017:	89 1c 24             	mov    %ebx,(%esp)
8010501a:	e8 c1 c5 ff ff       	call   801015e0 <iupdate>
8010501f:	89 1c 24             	mov    %ebx,(%esp)
80105022:	e8 f9 c8 ff ff       	call   80101920 <iunlockput>
80105027:	e8 f4 db ff ff       	call   80102c20 <end_op>
8010502c:	83 c4 10             	add    $0x10,%esp
8010502f:	31 c0                	xor    %eax,%eax
80105031:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105034:	5b                   	pop    %ebx
80105035:	5e                   	pop    %esi
80105036:	5f                   	pop    %edi
80105037:	5d                   	pop    %ebp
80105038:	c3                   	ret    
80105039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105040:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105044:	76 8d                	jbe    80104fd3 <sys_unlink+0xb3>
80105046:	bf 20 00 00 00       	mov    $0x20,%edi
8010504b:	eb 0f                	jmp    8010505c <sys_unlink+0x13c>
8010504d:	8d 76 00             	lea    0x0(%esi),%esi
80105050:	83 c7 10             	add    $0x10,%edi
80105053:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105056:	0f 83 77 ff ff ff    	jae    80104fd3 <sys_unlink+0xb3>
8010505c:	8d 45 d8             	lea    -0x28(%ebp),%eax
8010505f:	6a 10                	push   $0x10
80105061:	57                   	push   %edi
80105062:	50                   	push   %eax
80105063:	53                   	push   %ebx
80105064:	e8 07 c9 ff ff       	call   80101970 <readi>
80105069:	83 c4 10             	add    $0x10,%esp
8010506c:	83 f8 10             	cmp    $0x10,%eax
8010506f:	75 5e                	jne    801050cf <sys_unlink+0x1af>
80105071:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105076:	74 d8                	je     80105050 <sys_unlink+0x130>
80105078:	83 ec 0c             	sub    $0xc,%esp
8010507b:	53                   	push   %ebx
8010507c:	e8 9f c8 ff ff       	call   80101920 <iunlockput>
80105081:	83 c4 10             	add    $0x10,%esp
80105084:	83 ec 0c             	sub    $0xc,%esp
80105087:	56                   	push   %esi
80105088:	e8 93 c8 ff ff       	call   80101920 <iunlockput>
8010508d:	e8 8e db ff ff       	call   80102c20 <end_op>
80105092:	83 c4 10             	add    $0x10,%esp
80105095:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010509a:	eb 95                	jmp    80105031 <sys_unlink+0x111>
8010509c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801050a0:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
801050a5:	83 ec 0c             	sub    $0xc,%esp
801050a8:	56                   	push   %esi
801050a9:	e8 32 c5 ff ff       	call   801015e0 <iupdate>
801050ae:	83 c4 10             	add    $0x10,%esp
801050b1:	e9 53 ff ff ff       	jmp    80105009 <sys_unlink+0xe9>
801050b6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050bb:	e9 71 ff ff ff       	jmp    80105031 <sys_unlink+0x111>
801050c0:	e8 5b db ff ff       	call   80102c20 <end_op>
801050c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050ca:	e9 62 ff ff ff       	jmp    80105031 <sys_unlink+0x111>
801050cf:	83 ec 0c             	sub    $0xc,%esp
801050d2:	68 64 78 10 80       	push   $0x80107864
801050d7:	e8 b4 b2 ff ff       	call   80100390 <panic>
801050dc:	83 ec 0c             	sub    $0xc,%esp
801050df:	68 52 78 10 80       	push   $0x80107852
801050e4:	e8 a7 b2 ff ff       	call   80100390 <panic>
801050e9:	83 ec 0c             	sub    $0xc,%esp
801050ec:	68 76 78 10 80       	push   $0x80107876
801050f1:	e8 9a b2 ff ff       	call   80100390 <panic>
801050f6:	8d 76 00             	lea    0x0(%esi),%esi
801050f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105100 <sys_open>:
80105100:	55                   	push   %ebp
80105101:	89 e5                	mov    %esp,%ebp
80105103:	57                   	push   %edi
80105104:	56                   	push   %esi
80105105:	53                   	push   %ebx
80105106:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105109:	83 ec 24             	sub    $0x24,%esp
8010510c:	50                   	push   %eax
8010510d:	6a 00                	push   $0x0
8010510f:	e8 3c f8 ff ff       	call   80104950 <argstr>
80105114:	83 c4 10             	add    $0x10,%esp
80105117:	85 c0                	test   %eax,%eax
80105119:	0f 88 1d 01 00 00    	js     8010523c <sys_open+0x13c>
8010511f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105122:	83 ec 08             	sub    $0x8,%esp
80105125:	50                   	push   %eax
80105126:	6a 01                	push   $0x1
80105128:	e8 73 f7 ff ff       	call   801048a0 <argint>
8010512d:	83 c4 10             	add    $0x10,%esp
80105130:	85 c0                	test   %eax,%eax
80105132:	0f 88 04 01 00 00    	js     8010523c <sys_open+0x13c>
80105138:	e8 73 da ff ff       	call   80102bb0 <begin_op>
8010513d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105141:	0f 85 a9 00 00 00    	jne    801051f0 <sys_open+0xf0>
80105147:	83 ec 0c             	sub    $0xc,%esp
8010514a:	ff 75 e0             	pushl  -0x20(%ebp)
8010514d:	e8 9e cd ff ff       	call   80101ef0 <namei>
80105152:	83 c4 10             	add    $0x10,%esp
80105155:	85 c0                	test   %eax,%eax
80105157:	89 c6                	mov    %eax,%esi
80105159:	0f 84 b2 00 00 00    	je     80105211 <sys_open+0x111>
8010515f:	83 ec 0c             	sub    $0xc,%esp
80105162:	50                   	push   %eax
80105163:	e8 28 c5 ff ff       	call   80101690 <ilock>
80105168:	83 c4 10             	add    $0x10,%esp
8010516b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105170:	0f 84 aa 00 00 00    	je     80105220 <sys_open+0x120>
80105176:	e8 05 bc ff ff       	call   80100d80 <filealloc>
8010517b:	85 c0                	test   %eax,%eax
8010517d:	89 c7                	mov    %eax,%edi
8010517f:	0f 84 a6 00 00 00    	je     8010522b <sys_open+0x12b>
80105185:	e8 66 e6 ff ff       	call   801037f0 <myproc>
8010518a:	31 db                	xor    %ebx,%ebx
8010518c:	eb 0e                	jmp    8010519c <sys_open+0x9c>
8010518e:	66 90                	xchg   %ax,%ax
80105190:	83 c3 01             	add    $0x1,%ebx
80105193:	83 fb 10             	cmp    $0x10,%ebx
80105196:	0f 84 ac 00 00 00    	je     80105248 <sys_open+0x148>
8010519c:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801051a0:	85 d2                	test   %edx,%edx
801051a2:	75 ec                	jne    80105190 <sys_open+0x90>
801051a4:	83 ec 0c             	sub    $0xc,%esp
801051a7:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
801051ab:	56                   	push   %esi
801051ac:	e8 bf c5 ff ff       	call   80101770 <iunlock>
801051b1:	e8 6a da ff ff       	call   80102c20 <end_op>
801051b6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
801051bc:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801051bf:	83 c4 10             	add    $0x10,%esp
801051c2:	89 77 10             	mov    %esi,0x10(%edi)
801051c5:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
801051cc:	89 d0                	mov    %edx,%eax
801051ce:	f7 d0                	not    %eax
801051d0:	83 e0 01             	and    $0x1,%eax
801051d3:	83 e2 03             	and    $0x3,%edx
801051d6:	88 47 08             	mov    %al,0x8(%edi)
801051d9:	0f 95 47 09          	setne  0x9(%edi)
801051dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801051e0:	89 d8                	mov    %ebx,%eax
801051e2:	5b                   	pop    %ebx
801051e3:	5e                   	pop    %esi
801051e4:	5f                   	pop    %edi
801051e5:	5d                   	pop    %ebp
801051e6:	c3                   	ret    
801051e7:	89 f6                	mov    %esi,%esi
801051e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801051f0:	83 ec 0c             	sub    $0xc,%esp
801051f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801051f6:	31 c9                	xor    %ecx,%ecx
801051f8:	6a 00                	push   $0x0
801051fa:	ba 02 00 00 00       	mov    $0x2,%edx
801051ff:	e8 ec f7 ff ff       	call   801049f0 <create>
80105204:	83 c4 10             	add    $0x10,%esp
80105207:	85 c0                	test   %eax,%eax
80105209:	89 c6                	mov    %eax,%esi
8010520b:	0f 85 65 ff ff ff    	jne    80105176 <sys_open+0x76>
80105211:	e8 0a da ff ff       	call   80102c20 <end_op>
80105216:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010521b:	eb c0                	jmp    801051dd <sys_open+0xdd>
8010521d:	8d 76 00             	lea    0x0(%esi),%esi
80105220:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105223:	85 c9                	test   %ecx,%ecx
80105225:	0f 84 4b ff ff ff    	je     80105176 <sys_open+0x76>
8010522b:	83 ec 0c             	sub    $0xc,%esp
8010522e:	56                   	push   %esi
8010522f:	e8 ec c6 ff ff       	call   80101920 <iunlockput>
80105234:	e8 e7 d9 ff ff       	call   80102c20 <end_op>
80105239:	83 c4 10             	add    $0x10,%esp
8010523c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105241:	eb 9a                	jmp    801051dd <sys_open+0xdd>
80105243:	90                   	nop
80105244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105248:	83 ec 0c             	sub    $0xc,%esp
8010524b:	57                   	push   %edi
8010524c:	e8 ef bb ff ff       	call   80100e40 <fileclose>
80105251:	83 c4 10             	add    $0x10,%esp
80105254:	eb d5                	jmp    8010522b <sys_open+0x12b>
80105256:	8d 76 00             	lea    0x0(%esi),%esi
80105259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105260 <sys_mkdir>:
80105260:	55                   	push   %ebp
80105261:	89 e5                	mov    %esp,%ebp
80105263:	83 ec 18             	sub    $0x18,%esp
80105266:	e8 45 d9 ff ff       	call   80102bb0 <begin_op>
8010526b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010526e:	83 ec 08             	sub    $0x8,%esp
80105271:	50                   	push   %eax
80105272:	6a 00                	push   $0x0
80105274:	e8 d7 f6 ff ff       	call   80104950 <argstr>
80105279:	83 c4 10             	add    $0x10,%esp
8010527c:	85 c0                	test   %eax,%eax
8010527e:	78 30                	js     801052b0 <sys_mkdir+0x50>
80105280:	83 ec 0c             	sub    $0xc,%esp
80105283:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105286:	31 c9                	xor    %ecx,%ecx
80105288:	6a 00                	push   $0x0
8010528a:	ba 01 00 00 00       	mov    $0x1,%edx
8010528f:	e8 5c f7 ff ff       	call   801049f0 <create>
80105294:	83 c4 10             	add    $0x10,%esp
80105297:	85 c0                	test   %eax,%eax
80105299:	74 15                	je     801052b0 <sys_mkdir+0x50>
8010529b:	83 ec 0c             	sub    $0xc,%esp
8010529e:	50                   	push   %eax
8010529f:	e8 7c c6 ff ff       	call   80101920 <iunlockput>
801052a4:	e8 77 d9 ff ff       	call   80102c20 <end_op>
801052a9:	83 c4 10             	add    $0x10,%esp
801052ac:	31 c0                	xor    %eax,%eax
801052ae:	c9                   	leave  
801052af:	c3                   	ret    
801052b0:	e8 6b d9 ff ff       	call   80102c20 <end_op>
801052b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052ba:	c9                   	leave  
801052bb:	c3                   	ret    
801052bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801052c0 <sys_mknod>:
801052c0:	55                   	push   %ebp
801052c1:	89 e5                	mov    %esp,%ebp
801052c3:	83 ec 18             	sub    $0x18,%esp
801052c6:	e8 e5 d8 ff ff       	call   80102bb0 <begin_op>
801052cb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801052ce:	83 ec 08             	sub    $0x8,%esp
801052d1:	50                   	push   %eax
801052d2:	6a 00                	push   $0x0
801052d4:	e8 77 f6 ff ff       	call   80104950 <argstr>
801052d9:	83 c4 10             	add    $0x10,%esp
801052dc:	85 c0                	test   %eax,%eax
801052de:	78 60                	js     80105340 <sys_mknod+0x80>
801052e0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801052e3:	83 ec 08             	sub    $0x8,%esp
801052e6:	50                   	push   %eax
801052e7:	6a 01                	push   $0x1
801052e9:	e8 b2 f5 ff ff       	call   801048a0 <argint>
801052ee:	83 c4 10             	add    $0x10,%esp
801052f1:	85 c0                	test   %eax,%eax
801052f3:	78 4b                	js     80105340 <sys_mknod+0x80>
801052f5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801052f8:	83 ec 08             	sub    $0x8,%esp
801052fb:	50                   	push   %eax
801052fc:	6a 02                	push   $0x2
801052fe:	e8 9d f5 ff ff       	call   801048a0 <argint>
80105303:	83 c4 10             	add    $0x10,%esp
80105306:	85 c0                	test   %eax,%eax
80105308:	78 36                	js     80105340 <sys_mknod+0x80>
8010530a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010530e:	83 ec 0c             	sub    $0xc,%esp
80105311:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105315:	ba 03 00 00 00       	mov    $0x3,%edx
8010531a:	50                   	push   %eax
8010531b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010531e:	e8 cd f6 ff ff       	call   801049f0 <create>
80105323:	83 c4 10             	add    $0x10,%esp
80105326:	85 c0                	test   %eax,%eax
80105328:	74 16                	je     80105340 <sys_mknod+0x80>
8010532a:	83 ec 0c             	sub    $0xc,%esp
8010532d:	50                   	push   %eax
8010532e:	e8 ed c5 ff ff       	call   80101920 <iunlockput>
80105333:	e8 e8 d8 ff ff       	call   80102c20 <end_op>
80105338:	83 c4 10             	add    $0x10,%esp
8010533b:	31 c0                	xor    %eax,%eax
8010533d:	c9                   	leave  
8010533e:	c3                   	ret    
8010533f:	90                   	nop
80105340:	e8 db d8 ff ff       	call   80102c20 <end_op>
80105345:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010534a:	c9                   	leave  
8010534b:	c3                   	ret    
8010534c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105350 <sys_chdir>:
80105350:	55                   	push   %ebp
80105351:	89 e5                	mov    %esp,%ebp
80105353:	56                   	push   %esi
80105354:	53                   	push   %ebx
80105355:	83 ec 10             	sub    $0x10,%esp
80105358:	e8 93 e4 ff ff       	call   801037f0 <myproc>
8010535d:	89 c6                	mov    %eax,%esi
8010535f:	e8 4c d8 ff ff       	call   80102bb0 <begin_op>
80105364:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105367:	83 ec 08             	sub    $0x8,%esp
8010536a:	50                   	push   %eax
8010536b:	6a 00                	push   $0x0
8010536d:	e8 de f5 ff ff       	call   80104950 <argstr>
80105372:	83 c4 10             	add    $0x10,%esp
80105375:	85 c0                	test   %eax,%eax
80105377:	78 77                	js     801053f0 <sys_chdir+0xa0>
80105379:	83 ec 0c             	sub    $0xc,%esp
8010537c:	ff 75 f4             	pushl  -0xc(%ebp)
8010537f:	e8 6c cb ff ff       	call   80101ef0 <namei>
80105384:	83 c4 10             	add    $0x10,%esp
80105387:	85 c0                	test   %eax,%eax
80105389:	89 c3                	mov    %eax,%ebx
8010538b:	74 63                	je     801053f0 <sys_chdir+0xa0>
8010538d:	83 ec 0c             	sub    $0xc,%esp
80105390:	50                   	push   %eax
80105391:	e8 fa c2 ff ff       	call   80101690 <ilock>
80105396:	83 c4 10             	add    $0x10,%esp
80105399:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010539e:	75 30                	jne    801053d0 <sys_chdir+0x80>
801053a0:	83 ec 0c             	sub    $0xc,%esp
801053a3:	53                   	push   %ebx
801053a4:	e8 c7 c3 ff ff       	call   80101770 <iunlock>
801053a9:	58                   	pop    %eax
801053aa:	ff 76 68             	pushl  0x68(%esi)
801053ad:	e8 0e c4 ff ff       	call   801017c0 <iput>
801053b2:	e8 69 d8 ff ff       	call   80102c20 <end_op>
801053b7:	89 5e 68             	mov    %ebx,0x68(%esi)
801053ba:	83 c4 10             	add    $0x10,%esp
801053bd:	31 c0                	xor    %eax,%eax
801053bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801053c2:	5b                   	pop    %ebx
801053c3:	5e                   	pop    %esi
801053c4:	5d                   	pop    %ebp
801053c5:	c3                   	ret    
801053c6:	8d 76 00             	lea    0x0(%esi),%esi
801053c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801053d0:	83 ec 0c             	sub    $0xc,%esp
801053d3:	53                   	push   %ebx
801053d4:	e8 47 c5 ff ff       	call   80101920 <iunlockput>
801053d9:	e8 42 d8 ff ff       	call   80102c20 <end_op>
801053de:	83 c4 10             	add    $0x10,%esp
801053e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053e6:	eb d7                	jmp    801053bf <sys_chdir+0x6f>
801053e8:	90                   	nop
801053e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801053f0:	e8 2b d8 ff ff       	call   80102c20 <end_op>
801053f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053fa:	eb c3                	jmp    801053bf <sys_chdir+0x6f>
801053fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105400 <sys_exec>:
80105400:	55                   	push   %ebp
80105401:	89 e5                	mov    %esp,%ebp
80105403:	57                   	push   %edi
80105404:	56                   	push   %esi
80105405:	53                   	push   %ebx
80105406:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
8010540c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80105412:	50                   	push   %eax
80105413:	6a 00                	push   $0x0
80105415:	e8 36 f5 ff ff       	call   80104950 <argstr>
8010541a:	83 c4 10             	add    $0x10,%esp
8010541d:	85 c0                	test   %eax,%eax
8010541f:	0f 88 87 00 00 00    	js     801054ac <sys_exec+0xac>
80105425:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010542b:	83 ec 08             	sub    $0x8,%esp
8010542e:	50                   	push   %eax
8010542f:	6a 01                	push   $0x1
80105431:	e8 6a f4 ff ff       	call   801048a0 <argint>
80105436:	83 c4 10             	add    $0x10,%esp
80105439:	85 c0                	test   %eax,%eax
8010543b:	78 6f                	js     801054ac <sys_exec+0xac>
8010543d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105443:	83 ec 04             	sub    $0x4,%esp
80105446:	31 db                	xor    %ebx,%ebx
80105448:	68 80 00 00 00       	push   $0x80
8010544d:	6a 00                	push   $0x0
8010544f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105455:	50                   	push   %eax
80105456:	e8 45 f1 ff ff       	call   801045a0 <memset>
8010545b:	83 c4 10             	add    $0x10,%esp
8010545e:	eb 2c                	jmp    8010548c <sys_exec+0x8c>
80105460:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105466:	85 c0                	test   %eax,%eax
80105468:	74 56                	je     801054c0 <sys_exec+0xc0>
8010546a:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
80105470:	83 ec 08             	sub    $0x8,%esp
80105473:	8d 14 31             	lea    (%ecx,%esi,1),%edx
80105476:	52                   	push   %edx
80105477:	50                   	push   %eax
80105478:	e8 b3 f3 ff ff       	call   80104830 <fetchstr>
8010547d:	83 c4 10             	add    $0x10,%esp
80105480:	85 c0                	test   %eax,%eax
80105482:	78 28                	js     801054ac <sys_exec+0xac>
80105484:	83 c3 01             	add    $0x1,%ebx
80105487:	83 fb 20             	cmp    $0x20,%ebx
8010548a:	74 20                	je     801054ac <sys_exec+0xac>
8010548c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105492:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
80105499:	83 ec 08             	sub    $0x8,%esp
8010549c:	57                   	push   %edi
8010549d:	01 f0                	add    %esi,%eax
8010549f:	50                   	push   %eax
801054a0:	e8 4b f3 ff ff       	call   801047f0 <fetchint>
801054a5:	83 c4 10             	add    $0x10,%esp
801054a8:	85 c0                	test   %eax,%eax
801054aa:	79 b4                	jns    80105460 <sys_exec+0x60>
801054ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054b4:	5b                   	pop    %ebx
801054b5:	5e                   	pop    %esi
801054b6:	5f                   	pop    %edi
801054b7:	5d                   	pop    %ebp
801054b8:	c3                   	ret    
801054b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801054c0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801054c6:	83 ec 08             	sub    $0x8,%esp
801054c9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801054d0:	00 00 00 00 
801054d4:	50                   	push   %eax
801054d5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801054db:	e8 30 b5 ff ff       	call   80100a10 <exec>
801054e0:	83 c4 10             	add    $0x10,%esp
801054e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801054e6:	5b                   	pop    %ebx
801054e7:	5e                   	pop    %esi
801054e8:	5f                   	pop    %edi
801054e9:	5d                   	pop    %ebp
801054ea:	c3                   	ret    
801054eb:	90                   	nop
801054ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054f0 <sys_pipe>:
801054f0:	55                   	push   %ebp
801054f1:	89 e5                	mov    %esp,%ebp
801054f3:	57                   	push   %edi
801054f4:	56                   	push   %esi
801054f5:	53                   	push   %ebx
801054f6:	8d 45 dc             	lea    -0x24(%ebp),%eax
801054f9:	83 ec 20             	sub    $0x20,%esp
801054fc:	6a 08                	push   $0x8
801054fe:	50                   	push   %eax
801054ff:	6a 00                	push   $0x0
80105501:	e8 ea f3 ff ff       	call   801048f0 <argptr>
80105506:	83 c4 10             	add    $0x10,%esp
80105509:	85 c0                	test   %eax,%eax
8010550b:	0f 88 ae 00 00 00    	js     801055bf <sys_pipe+0xcf>
80105511:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105514:	83 ec 08             	sub    $0x8,%esp
80105517:	50                   	push   %eax
80105518:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010551b:	50                   	push   %eax
8010551c:	e8 2f dd ff ff       	call   80103250 <pipealloc>
80105521:	83 c4 10             	add    $0x10,%esp
80105524:	85 c0                	test   %eax,%eax
80105526:	0f 88 93 00 00 00    	js     801055bf <sys_pipe+0xcf>
8010552c:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010552f:	31 db                	xor    %ebx,%ebx
80105531:	e8 ba e2 ff ff       	call   801037f0 <myproc>
80105536:	eb 10                	jmp    80105548 <sys_pipe+0x58>
80105538:	90                   	nop
80105539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105540:	83 c3 01             	add    $0x1,%ebx
80105543:	83 fb 10             	cmp    $0x10,%ebx
80105546:	74 60                	je     801055a8 <sys_pipe+0xb8>
80105548:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
8010554c:	85 f6                	test   %esi,%esi
8010554e:	75 f0                	jne    80105540 <sys_pipe+0x50>
80105550:	8d 73 08             	lea    0x8(%ebx),%esi
80105553:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
80105557:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010555a:	e8 91 e2 ff ff       	call   801037f0 <myproc>
8010555f:	31 d2                	xor    %edx,%edx
80105561:	eb 0d                	jmp    80105570 <sys_pipe+0x80>
80105563:	90                   	nop
80105564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105568:	83 c2 01             	add    $0x1,%edx
8010556b:	83 fa 10             	cmp    $0x10,%edx
8010556e:	74 28                	je     80105598 <sys_pipe+0xa8>
80105570:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105574:	85 c9                	test   %ecx,%ecx
80105576:	75 f0                	jne    80105568 <sys_pipe+0x78>
80105578:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
8010557c:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010557f:	89 18                	mov    %ebx,(%eax)
80105581:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105584:	89 50 04             	mov    %edx,0x4(%eax)
80105587:	31 c0                	xor    %eax,%eax
80105589:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010558c:	5b                   	pop    %ebx
8010558d:	5e                   	pop    %esi
8010558e:	5f                   	pop    %edi
8010558f:	5d                   	pop    %ebp
80105590:	c3                   	ret    
80105591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105598:	e8 53 e2 ff ff       	call   801037f0 <myproc>
8010559d:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
801055a4:	00 
801055a5:	8d 76 00             	lea    0x0(%esi),%esi
801055a8:	83 ec 0c             	sub    $0xc,%esp
801055ab:	ff 75 e0             	pushl  -0x20(%ebp)
801055ae:	e8 8d b8 ff ff       	call   80100e40 <fileclose>
801055b3:	58                   	pop    %eax
801055b4:	ff 75 e4             	pushl  -0x1c(%ebp)
801055b7:	e8 84 b8 ff ff       	call   80100e40 <fileclose>
801055bc:	83 c4 10             	add    $0x10,%esp
801055bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055c4:	eb c3                	jmp    80105589 <sys_pipe+0x99>
801055c6:	66 90                	xchg   %ax,%ax
801055c8:	66 90                	xchg   %ax,%ax
801055ca:	66 90                	xchg   %ax,%ax
801055cc:	66 90                	xchg   %ax,%ax
801055ce:	66 90                	xchg   %ax,%ax

801055d0 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
801055d0:	55                   	push   %ebp
801055d1:	89 e5                	mov    %esp,%ebp
  return fork();
}
801055d3:	5d                   	pop    %ebp
  return fork();
801055d4:	e9 b7 e3 ff ff       	jmp    80103990 <fork>
801055d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801055e0 <sys_exit>:

int
sys_exit(void)
{
801055e0:	55                   	push   %ebp
801055e1:	89 e5                	mov    %esp,%ebp
801055e3:	83 ec 08             	sub    $0x8,%esp
  exit();
801055e6:	e8 45 e6 ff ff       	call   80103c30 <exit>
  return 0;  // not reached
}
801055eb:	31 c0                	xor    %eax,%eax
801055ed:	c9                   	leave  
801055ee:	c3                   	ret    
801055ef:	90                   	nop

801055f0 <sys_wait>:

int
sys_wait(void)
{
801055f0:	55                   	push   %ebp
801055f1:	89 e5                	mov    %esp,%ebp
  return wait();
}
801055f3:	5d                   	pop    %ebp
  return wait();
801055f4:	e9 77 e8 ff ff       	jmp    80103e70 <wait>
801055f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105600 <sys_kill>:

int
sys_kill(void)
{
80105600:	55                   	push   %ebp
80105601:	89 e5                	mov    %esp,%ebp
80105603:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105606:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105609:	50                   	push   %eax
8010560a:	6a 00                	push   $0x0
8010560c:	e8 8f f2 ff ff       	call   801048a0 <argint>
80105611:	83 c4 10             	add    $0x10,%esp
80105614:	85 c0                	test   %eax,%eax
80105616:	78 18                	js     80105630 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105618:	83 ec 0c             	sub    $0xc,%esp
8010561b:	ff 75 f4             	pushl  -0xc(%ebp)
8010561e:	e8 9d e9 ff ff       	call   80103fc0 <kill>
80105623:	83 c4 10             	add    $0x10,%esp
}
80105626:	c9                   	leave  
80105627:	c3                   	ret    
80105628:	90                   	nop
80105629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105630:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105635:	c9                   	leave  
80105636:	c3                   	ret    
80105637:	89 f6                	mov    %esi,%esi
80105639:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105640 <sys_getpid>:

int
sys_getpid(void)
{
80105640:	55                   	push   %ebp
80105641:	89 e5                	mov    %esp,%ebp
80105643:	83 ec 08             	sub    $0x8,%esp
  return myproc()->pid;
80105646:	e8 a5 e1 ff ff       	call   801037f0 <myproc>
8010564b:	8b 40 10             	mov    0x10(%eax),%eax
}
8010564e:	c9                   	leave  
8010564f:	c3                   	ret    

80105650 <sys_sbrk>:

int
sys_sbrk(void)
{
80105650:	55                   	push   %ebp
80105651:	89 e5                	mov    %esp,%ebp
80105653:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105654:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
80105657:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
8010565a:	50                   	push   %eax
8010565b:	6a 00                	push   $0x0
8010565d:	e8 3e f2 ff ff       	call   801048a0 <argint>
80105662:	83 c4 10             	add    $0x10,%esp
80105665:	85 c0                	test   %eax,%eax
80105667:	78 27                	js     80105690 <sys_sbrk+0x40>
    return -1;
  addr = myproc()->sz;
80105669:	e8 82 e1 ff ff       	call   801037f0 <myproc>
  if(growproc(n) < 0)
8010566e:	83 ec 0c             	sub    $0xc,%esp
  addr = myproc()->sz;
80105671:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
80105673:	ff 75 f4             	pushl  -0xc(%ebp)
80105676:	e8 95 e2 ff ff       	call   80103910 <growproc>
8010567b:	83 c4 10             	add    $0x10,%esp
8010567e:	85 c0                	test   %eax,%eax
80105680:	78 0e                	js     80105690 <sys_sbrk+0x40>
    return -1;
  return addr;
}
80105682:	89 d8                	mov    %ebx,%eax
80105684:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105687:	c9                   	leave  
80105688:	c3                   	ret    
80105689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
80105690:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105695:	eb eb                	jmp    80105682 <sys_sbrk+0x32>
80105697:	89 f6                	mov    %esi,%esi
80105699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801056a0 <sys_sleep>:

int
sys_sleep(void)
{
801056a0:	55                   	push   %ebp
801056a1:	89 e5                	mov    %esp,%ebp
801056a3:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801056a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
{
801056a7:	83 ec 1c             	sub    $0x1c,%esp
  if(argint(0, &n) < 0)
801056aa:	50                   	push   %eax
801056ab:	6a 00                	push   $0x0
801056ad:	e8 ee f1 ff ff       	call   801048a0 <argint>
801056b2:	83 c4 10             	add    $0x10,%esp
801056b5:	85 c0                	test   %eax,%eax
801056b7:	0f 88 8a 00 00 00    	js     80105747 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
801056bd:	83 ec 0c             	sub    $0xc,%esp
801056c0:	68 40 49 11 80       	push   $0x80114940
801056c5:	e8 56 ed ff ff       	call   80104420 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801056ca:	8b 55 f4             	mov    -0xc(%ebp),%edx
801056cd:	83 c4 10             	add    $0x10,%esp
  ticks0 = ticks;
801056d0:	8b 1d 80 51 11 80    	mov    0x80115180,%ebx
  while(ticks - ticks0 < n){
801056d6:	85 d2                	test   %edx,%edx
801056d8:	75 27                	jne    80105701 <sys_sleep+0x61>
801056da:	eb 54                	jmp    80105730 <sys_sleep+0x90>
801056dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
801056e0:	83 ec 08             	sub    $0x8,%esp
801056e3:	68 40 49 11 80       	push   $0x80114940
801056e8:	68 80 51 11 80       	push   $0x80115180
801056ed:	e8 be e6 ff ff       	call   80103db0 <sleep>
  while(ticks - ticks0 < n){
801056f2:	a1 80 51 11 80       	mov    0x80115180,%eax
801056f7:	83 c4 10             	add    $0x10,%esp
801056fa:	29 d8                	sub    %ebx,%eax
801056fc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801056ff:	73 2f                	jae    80105730 <sys_sleep+0x90>
    if(myproc()->killed){
80105701:	e8 ea e0 ff ff       	call   801037f0 <myproc>
80105706:	8b 40 24             	mov    0x24(%eax),%eax
80105709:	85 c0                	test   %eax,%eax
8010570b:	74 d3                	je     801056e0 <sys_sleep+0x40>
      release(&tickslock);
8010570d:	83 ec 0c             	sub    $0xc,%esp
80105710:	68 40 49 11 80       	push   $0x80114940
80105715:	e8 26 ee ff ff       	call   80104540 <release>
      return -1;
8010571a:	83 c4 10             	add    $0x10,%esp
8010571d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&tickslock);
  return 0;
}
80105722:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105725:	c9                   	leave  
80105726:	c3                   	ret    
80105727:	89 f6                	mov    %esi,%esi
80105729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  release(&tickslock);
80105730:	83 ec 0c             	sub    $0xc,%esp
80105733:	68 40 49 11 80       	push   $0x80114940
80105738:	e8 03 ee ff ff       	call   80104540 <release>
  return 0;
8010573d:	83 c4 10             	add    $0x10,%esp
80105740:	31 c0                	xor    %eax,%eax
}
80105742:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105745:	c9                   	leave  
80105746:	c3                   	ret    
    return -1;
80105747:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010574c:	eb f4                	jmp    80105742 <sys_sleep+0xa2>
8010574e:	66 90                	xchg   %ax,%ax

80105750 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105750:	55                   	push   %ebp
80105751:	89 e5                	mov    %esp,%ebp
80105753:	53                   	push   %ebx
80105754:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105757:	68 40 49 11 80       	push   $0x80114940
8010575c:	e8 bf ec ff ff       	call   80104420 <acquire>
  xticks = ticks;
80105761:	8b 1d 80 51 11 80    	mov    0x80115180,%ebx
  release(&tickslock);
80105767:	c7 04 24 40 49 11 80 	movl   $0x80114940,(%esp)
8010576e:	e8 cd ed ff ff       	call   80104540 <release>
  return xticks;
}
80105773:	89 d8                	mov    %ebx,%eax
80105775:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105778:	c9                   	leave  
80105779:	c3                   	ret    
8010577a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105780 <sys_cps>:

int
sys_cps(void)
{
80105780:	55                   	push   %ebp
80105781:	89 e5                	mov    %esp,%ebp
    return cps();
}
80105783:	5d                   	pop    %ebp
    return cps();
80105784:	e9 77 e9 ff ff       	jmp    80104100 <cps>
80105789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105790 <sys_chpr>:

int
sys_chpr(void)
{
80105790:	55                   	push   %ebp
80105791:	89 e5                	mov    %esp,%ebp
80105793:	83 ec 20             	sub    $0x20,%esp
    int pid, pr;
    if(argint(0, &pid) < 0)
80105796:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105799:	50                   	push   %eax
8010579a:	6a 00                	push   $0x0
8010579c:	e8 ff f0 ff ff       	call   801048a0 <argint>
801057a1:	83 c4 10             	add    $0x10,%esp
801057a4:	85 c0                	test   %eax,%eax
801057a6:	78 28                	js     801057d0 <sys_chpr+0x40>
        return -1;
    if(argint(1, &pr) < 0)
801057a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057ab:	83 ec 08             	sub    $0x8,%esp
801057ae:	50                   	push   %eax
801057af:	6a 01                	push   $0x1
801057b1:	e8 ea f0 ff ff       	call   801048a0 <argint>
801057b6:	83 c4 10             	add    $0x10,%esp
801057b9:	85 c0                	test   %eax,%eax
801057bb:	78 13                	js     801057d0 <sys_chpr+0x40>
        return -1;

    return chpr(pid, pr);
801057bd:	83 ec 08             	sub    $0x8,%esp
801057c0:	ff 75 f4             	pushl  -0xc(%ebp)
801057c3:	ff 75 f0             	pushl  -0x10(%ebp)
801057c6:	e8 05 ea ff ff       	call   801041d0 <chpr>
801057cb:	83 c4 10             	add    $0x10,%esp
}
801057ce:	c9                   	leave  
801057cf:	c3                   	ret    
        return -1;
801057d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801057d5:	c9                   	leave  
801057d6:	c3                   	ret    
801057d7:	89 f6                	mov    %esi,%esi
801057d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057e0 <sys_getppid>:

int
sys_getppid(void)
{
801057e0:	55                   	push   %ebp
801057e1:	89 e5                	mov    %esp,%ebp
801057e3:	83 ec 08             	sub    $0x8,%esp
  return myproc()->parent->pid;
801057e6:	e8 05 e0 ff ff       	call   801037f0 <myproc>
801057eb:	8b 40 14             	mov    0x14(%eax),%eax
801057ee:	8b 40 10             	mov    0x10(%eax),%eax
}
801057f1:	c9                   	leave  
801057f2:	c3                   	ret    

801057f3 <alltraps>:
801057f3:	1e                   	push   %ds
801057f4:	06                   	push   %es
801057f5:	0f a0                	push   %fs
801057f7:	0f a8                	push   %gs
801057f9:	60                   	pusha  
801057fa:	66 b8 10 00          	mov    $0x10,%ax
801057fe:	8e d8                	mov    %eax,%ds
80105800:	8e c0                	mov    %eax,%es
80105802:	54                   	push   %esp
80105803:	e8 c8 00 00 00       	call   801058d0 <trap>
80105808:	83 c4 04             	add    $0x4,%esp

8010580b <trapret>:
8010580b:	61                   	popa   
8010580c:	0f a9                	pop    %gs
8010580e:	0f a1                	pop    %fs
80105810:	07                   	pop    %es
80105811:	1f                   	pop    %ds
80105812:	83 c4 08             	add    $0x8,%esp
80105815:	cf                   	iret   
80105816:	66 90                	xchg   %ax,%ax
80105818:	66 90                	xchg   %ax,%ax
8010581a:	66 90                	xchg   %ax,%ax
8010581c:	66 90                	xchg   %ax,%ax
8010581e:	66 90                	xchg   %ax,%ax

80105820 <tvinit>:
80105820:	55                   	push   %ebp
80105821:	31 c0                	xor    %eax,%eax
80105823:	89 e5                	mov    %esp,%ebp
80105825:	83 ec 08             	sub    $0x8,%esp
80105828:	90                   	nop
80105829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105830:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
80105837:	c7 04 c5 82 49 11 80 	movl   $0x8e000008,-0x7feeb67e(,%eax,8)
8010583e:	08 00 00 8e 
80105842:	66 89 14 c5 80 49 11 	mov    %dx,-0x7feeb680(,%eax,8)
80105849:	80 
8010584a:	c1 ea 10             	shr    $0x10,%edx
8010584d:	66 89 14 c5 86 49 11 	mov    %dx,-0x7feeb67a(,%eax,8)
80105854:	80 
80105855:	83 c0 01             	add    $0x1,%eax
80105858:	3d 00 01 00 00       	cmp    $0x100,%eax
8010585d:	75 d1                	jne    80105830 <tvinit+0x10>
8010585f:	a1 08 a1 10 80       	mov    0x8010a108,%eax
80105864:	83 ec 08             	sub    $0x8,%esp
80105867:	c7 05 82 4b 11 80 08 	movl   $0xef000008,0x80114b82
8010586e:	00 00 ef 
80105871:	68 85 78 10 80       	push   $0x80107885
80105876:	68 40 49 11 80       	push   $0x80114940
8010587b:	66 a3 80 4b 11 80    	mov    %ax,0x80114b80
80105881:	c1 e8 10             	shr    $0x10,%eax
80105884:	66 a3 86 4b 11 80    	mov    %ax,0x80114b86
8010588a:	e8 a1 ea ff ff       	call   80104330 <initlock>
8010588f:	83 c4 10             	add    $0x10,%esp
80105892:	c9                   	leave  
80105893:	c3                   	ret    
80105894:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010589a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801058a0 <idtinit>:
801058a0:	55                   	push   %ebp
801058a1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
801058a6:	89 e5                	mov    %esp,%ebp
801058a8:	83 ec 10             	sub    $0x10,%esp
801058ab:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
801058af:	b8 80 49 11 80       	mov    $0x80114980,%eax
801058b4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
801058b8:	c1 e8 10             	shr    $0x10,%eax
801058bb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
801058bf:	8d 45 fa             	lea    -0x6(%ebp),%eax
801058c2:	0f 01 18             	lidtl  (%eax)
801058c5:	c9                   	leave  
801058c6:	c3                   	ret    
801058c7:	89 f6                	mov    %esi,%esi
801058c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801058d0 <trap>:
801058d0:	55                   	push   %ebp
801058d1:	89 e5                	mov    %esp,%ebp
801058d3:	57                   	push   %edi
801058d4:	56                   	push   %esi
801058d5:	53                   	push   %ebx
801058d6:	83 ec 1c             	sub    $0x1c,%esp
801058d9:	8b 7d 08             	mov    0x8(%ebp),%edi
801058dc:	8b 47 30             	mov    0x30(%edi),%eax
801058df:	83 f8 40             	cmp    $0x40,%eax
801058e2:	0f 84 f0 00 00 00    	je     801059d8 <trap+0x108>
801058e8:	83 e8 20             	sub    $0x20,%eax
801058eb:	83 f8 1f             	cmp    $0x1f,%eax
801058ee:	77 10                	ja     80105900 <trap+0x30>
801058f0:	ff 24 85 2c 79 10 80 	jmp    *-0x7fef86d4(,%eax,4)
801058f7:	89 f6                	mov    %esi,%esi
801058f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105900:	e8 eb de ff ff       	call   801037f0 <myproc>
80105905:	85 c0                	test   %eax,%eax
80105907:	8b 5f 38             	mov    0x38(%edi),%ebx
8010590a:	0f 84 14 02 00 00    	je     80105b24 <trap+0x254>
80105910:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105914:	0f 84 0a 02 00 00    	je     80105b24 <trap+0x254>
8010591a:	0f 20 d1             	mov    %cr2,%ecx
8010591d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105920:	e8 ab de ff ff       	call   801037d0 <cpuid>
80105925:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105928:	8b 47 34             	mov    0x34(%edi),%eax
8010592b:	8b 77 30             	mov    0x30(%edi),%esi
8010592e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105931:	e8 ba de ff ff       	call   801037f0 <myproc>
80105936:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105939:	e8 b2 de ff ff       	call   801037f0 <myproc>
8010593e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105941:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105944:	51                   	push   %ecx
80105945:	53                   	push   %ebx
80105946:	52                   	push   %edx
80105947:	8b 55 e0             	mov    -0x20(%ebp),%edx
8010594a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010594d:	56                   	push   %esi
8010594e:	83 c2 6c             	add    $0x6c,%edx
80105951:	52                   	push   %edx
80105952:	ff 70 10             	pushl  0x10(%eax)
80105955:	68 e8 78 10 80       	push   $0x801078e8
8010595a:	e8 01 ad ff ff       	call   80100660 <cprintf>
8010595f:	83 c4 20             	add    $0x20,%esp
80105962:	e8 89 de ff ff       	call   801037f0 <myproc>
80105967:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
8010596e:	e8 7d de ff ff       	call   801037f0 <myproc>
80105973:	85 c0                	test   %eax,%eax
80105975:	74 1d                	je     80105994 <trap+0xc4>
80105977:	e8 74 de ff ff       	call   801037f0 <myproc>
8010597c:	8b 50 24             	mov    0x24(%eax),%edx
8010597f:	85 d2                	test   %edx,%edx
80105981:	74 11                	je     80105994 <trap+0xc4>
80105983:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105987:	83 e0 03             	and    $0x3,%eax
8010598a:	66 83 f8 03          	cmp    $0x3,%ax
8010598e:	0f 84 4c 01 00 00    	je     80105ae0 <trap+0x210>
80105994:	e8 57 de ff ff       	call   801037f0 <myproc>
80105999:	85 c0                	test   %eax,%eax
8010599b:	74 0b                	je     801059a8 <trap+0xd8>
8010599d:	e8 4e de ff ff       	call   801037f0 <myproc>
801059a2:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801059a6:	74 68                	je     80105a10 <trap+0x140>
801059a8:	e8 43 de ff ff       	call   801037f0 <myproc>
801059ad:	85 c0                	test   %eax,%eax
801059af:	74 19                	je     801059ca <trap+0xfa>
801059b1:	e8 3a de ff ff       	call   801037f0 <myproc>
801059b6:	8b 40 24             	mov    0x24(%eax),%eax
801059b9:	85 c0                	test   %eax,%eax
801059bb:	74 0d                	je     801059ca <trap+0xfa>
801059bd:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
801059c1:	83 e0 03             	and    $0x3,%eax
801059c4:	66 83 f8 03          	cmp    $0x3,%ax
801059c8:	74 37                	je     80105a01 <trap+0x131>
801059ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
801059cd:	5b                   	pop    %ebx
801059ce:	5e                   	pop    %esi
801059cf:	5f                   	pop    %edi
801059d0:	5d                   	pop    %ebp
801059d1:	c3                   	ret    
801059d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801059d8:	e8 13 de ff ff       	call   801037f0 <myproc>
801059dd:	8b 58 24             	mov    0x24(%eax),%ebx
801059e0:	85 db                	test   %ebx,%ebx
801059e2:	0f 85 e8 00 00 00    	jne    80105ad0 <trap+0x200>
801059e8:	e8 03 de ff ff       	call   801037f0 <myproc>
801059ed:	89 78 18             	mov    %edi,0x18(%eax)
801059f0:	e8 9b ef ff ff       	call   80104990 <syscall>
801059f5:	e8 f6 dd ff ff       	call   801037f0 <myproc>
801059fa:	8b 48 24             	mov    0x24(%eax),%ecx
801059fd:	85 c9                	test   %ecx,%ecx
801059ff:	74 c9                	je     801059ca <trap+0xfa>
80105a01:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105a04:	5b                   	pop    %ebx
80105a05:	5e                   	pop    %esi
80105a06:	5f                   	pop    %edi
80105a07:	5d                   	pop    %ebp
80105a08:	e9 23 e2 ff ff       	jmp    80103c30 <exit>
80105a0d:	8d 76 00             	lea    0x0(%esi),%esi
80105a10:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105a14:	75 92                	jne    801059a8 <trap+0xd8>
80105a16:	e8 45 e3 ff ff       	call   80103d60 <yield>
80105a1b:	eb 8b                	jmp    801059a8 <trap+0xd8>
80105a1d:	8d 76 00             	lea    0x0(%esi),%esi
80105a20:	e8 ab dd ff ff       	call   801037d0 <cpuid>
80105a25:	85 c0                	test   %eax,%eax
80105a27:	0f 84 c3 00 00 00    	je     80105af0 <trap+0x220>
80105a2d:	e8 2e cd ff ff       	call   80102760 <lapiceoi>
80105a32:	e8 b9 dd ff ff       	call   801037f0 <myproc>
80105a37:	85 c0                	test   %eax,%eax
80105a39:	0f 85 38 ff ff ff    	jne    80105977 <trap+0xa7>
80105a3f:	e9 50 ff ff ff       	jmp    80105994 <trap+0xc4>
80105a44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105a48:	e8 d3 cb ff ff       	call   80102620 <kbdintr>
80105a4d:	e8 0e cd ff ff       	call   80102760 <lapiceoi>
80105a52:	e8 99 dd ff ff       	call   801037f0 <myproc>
80105a57:	85 c0                	test   %eax,%eax
80105a59:	0f 85 18 ff ff ff    	jne    80105977 <trap+0xa7>
80105a5f:	e9 30 ff ff ff       	jmp    80105994 <trap+0xc4>
80105a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105a68:	e8 53 02 00 00       	call   80105cc0 <uartintr>
80105a6d:	e8 ee cc ff ff       	call   80102760 <lapiceoi>
80105a72:	e8 79 dd ff ff       	call   801037f0 <myproc>
80105a77:	85 c0                	test   %eax,%eax
80105a79:	0f 85 f8 fe ff ff    	jne    80105977 <trap+0xa7>
80105a7f:	e9 10 ff ff ff       	jmp    80105994 <trap+0xc4>
80105a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105a88:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105a8c:	8b 77 38             	mov    0x38(%edi),%esi
80105a8f:	e8 3c dd ff ff       	call   801037d0 <cpuid>
80105a94:	56                   	push   %esi
80105a95:	53                   	push   %ebx
80105a96:	50                   	push   %eax
80105a97:	68 90 78 10 80       	push   $0x80107890
80105a9c:	e8 bf ab ff ff       	call   80100660 <cprintf>
80105aa1:	e8 ba cc ff ff       	call   80102760 <lapiceoi>
80105aa6:	83 c4 10             	add    $0x10,%esp
80105aa9:	e8 42 dd ff ff       	call   801037f0 <myproc>
80105aae:	85 c0                	test   %eax,%eax
80105ab0:	0f 85 c1 fe ff ff    	jne    80105977 <trap+0xa7>
80105ab6:	e9 d9 fe ff ff       	jmp    80105994 <trap+0xc4>
80105abb:	90                   	nop
80105abc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105ac0:	e8 cb c5 ff ff       	call   80102090 <ideintr>
80105ac5:	e9 63 ff ff ff       	jmp    80105a2d <trap+0x15d>
80105aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105ad0:	e8 5b e1 ff ff       	call   80103c30 <exit>
80105ad5:	e9 0e ff ff ff       	jmp    801059e8 <trap+0x118>
80105ada:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105ae0:	e8 4b e1 ff ff       	call   80103c30 <exit>
80105ae5:	e9 aa fe ff ff       	jmp    80105994 <trap+0xc4>
80105aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105af0:	83 ec 0c             	sub    $0xc,%esp
80105af3:	68 40 49 11 80       	push   $0x80114940
80105af8:	e8 23 e9 ff ff       	call   80104420 <acquire>
80105afd:	c7 04 24 80 51 11 80 	movl   $0x80115180,(%esp)
80105b04:	83 05 80 51 11 80 01 	addl   $0x1,0x80115180
80105b0b:	e8 50 e4 ff ff       	call   80103f60 <wakeup>
80105b10:	c7 04 24 40 49 11 80 	movl   $0x80114940,(%esp)
80105b17:	e8 24 ea ff ff       	call   80104540 <release>
80105b1c:	83 c4 10             	add    $0x10,%esp
80105b1f:	e9 09 ff ff ff       	jmp    80105a2d <trap+0x15d>
80105b24:	0f 20 d6             	mov    %cr2,%esi
80105b27:	e8 a4 dc ff ff       	call   801037d0 <cpuid>
80105b2c:	83 ec 0c             	sub    $0xc,%esp
80105b2f:	56                   	push   %esi
80105b30:	53                   	push   %ebx
80105b31:	50                   	push   %eax
80105b32:	ff 77 30             	pushl  0x30(%edi)
80105b35:	68 b4 78 10 80       	push   $0x801078b4
80105b3a:	e8 21 ab ff ff       	call   80100660 <cprintf>
80105b3f:	83 c4 14             	add    $0x14,%esp
80105b42:	68 8a 78 10 80       	push   $0x8010788a
80105b47:	e8 44 a8 ff ff       	call   80100390 <panic>
80105b4c:	66 90                	xchg   %ax,%ax
80105b4e:	66 90                	xchg   %ax,%ax

80105b50 <uartgetc>:
80105b50:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
80105b55:	55                   	push   %ebp
80105b56:	89 e5                	mov    %esp,%ebp
80105b58:	85 c0                	test   %eax,%eax
80105b5a:	74 1c                	je     80105b78 <uartgetc+0x28>
80105b5c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105b61:	ec                   	in     (%dx),%al
80105b62:	a8 01                	test   $0x1,%al
80105b64:	74 12                	je     80105b78 <uartgetc+0x28>
80105b66:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105b6b:	ec                   	in     (%dx),%al
80105b6c:	0f b6 c0             	movzbl %al,%eax
80105b6f:	5d                   	pop    %ebp
80105b70:	c3                   	ret    
80105b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105b7d:	5d                   	pop    %ebp
80105b7e:	c3                   	ret    
80105b7f:	90                   	nop

80105b80 <uartputc.part.0>:
80105b80:	55                   	push   %ebp
80105b81:	89 e5                	mov    %esp,%ebp
80105b83:	57                   	push   %edi
80105b84:	56                   	push   %esi
80105b85:	53                   	push   %ebx
80105b86:	89 c7                	mov    %eax,%edi
80105b88:	bb 80 00 00 00       	mov    $0x80,%ebx
80105b8d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105b92:	83 ec 0c             	sub    $0xc,%esp
80105b95:	eb 1b                	jmp    80105bb2 <uartputc.part.0+0x32>
80105b97:	89 f6                	mov    %esi,%esi
80105b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ba0:	83 ec 0c             	sub    $0xc,%esp
80105ba3:	6a 0a                	push   $0xa
80105ba5:	e8 d6 cb ff ff       	call   80102780 <microdelay>
80105baa:	83 c4 10             	add    $0x10,%esp
80105bad:	83 eb 01             	sub    $0x1,%ebx
80105bb0:	74 07                	je     80105bb9 <uartputc.part.0+0x39>
80105bb2:	89 f2                	mov    %esi,%edx
80105bb4:	ec                   	in     (%dx),%al
80105bb5:	a8 20                	test   $0x20,%al
80105bb7:	74 e7                	je     80105ba0 <uartputc.part.0+0x20>
80105bb9:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105bbe:	89 f8                	mov    %edi,%eax
80105bc0:	ee                   	out    %al,(%dx)
80105bc1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105bc4:	5b                   	pop    %ebx
80105bc5:	5e                   	pop    %esi
80105bc6:	5f                   	pop    %edi
80105bc7:	5d                   	pop    %ebp
80105bc8:	c3                   	ret    
80105bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105bd0 <uartinit>:
80105bd0:	55                   	push   %ebp
80105bd1:	31 c9                	xor    %ecx,%ecx
80105bd3:	89 c8                	mov    %ecx,%eax
80105bd5:	89 e5                	mov    %esp,%ebp
80105bd7:	57                   	push   %edi
80105bd8:	56                   	push   %esi
80105bd9:	53                   	push   %ebx
80105bda:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105bdf:	89 da                	mov    %ebx,%edx
80105be1:	83 ec 0c             	sub    $0xc,%esp
80105be4:	ee                   	out    %al,(%dx)
80105be5:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105bea:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105bef:	89 fa                	mov    %edi,%edx
80105bf1:	ee                   	out    %al,(%dx)
80105bf2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105bf7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105bfc:	ee                   	out    %al,(%dx)
80105bfd:	be f9 03 00 00       	mov    $0x3f9,%esi
80105c02:	89 c8                	mov    %ecx,%eax
80105c04:	89 f2                	mov    %esi,%edx
80105c06:	ee                   	out    %al,(%dx)
80105c07:	b8 03 00 00 00       	mov    $0x3,%eax
80105c0c:	89 fa                	mov    %edi,%edx
80105c0e:	ee                   	out    %al,(%dx)
80105c0f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105c14:	89 c8                	mov    %ecx,%eax
80105c16:	ee                   	out    %al,(%dx)
80105c17:	b8 01 00 00 00       	mov    $0x1,%eax
80105c1c:	89 f2                	mov    %esi,%edx
80105c1e:	ee                   	out    %al,(%dx)
80105c1f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105c24:	ec                   	in     (%dx),%al
80105c25:	3c ff                	cmp    $0xff,%al
80105c27:	74 5a                	je     80105c83 <uartinit+0xb3>
80105c29:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
80105c30:	00 00 00 
80105c33:	89 da                	mov    %ebx,%edx
80105c35:	ec                   	in     (%dx),%al
80105c36:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105c3b:	ec                   	in     (%dx),%al
80105c3c:	83 ec 08             	sub    $0x8,%esp
80105c3f:	bb ac 79 10 80       	mov    $0x801079ac,%ebx
80105c44:	6a 00                	push   $0x0
80105c46:	6a 04                	push   $0x4
80105c48:	e8 93 c6 ff ff       	call   801022e0 <ioapicenable>
80105c4d:	83 c4 10             	add    $0x10,%esp
80105c50:	b8 78 00 00 00       	mov    $0x78,%eax
80105c55:	eb 13                	jmp    80105c6a <uartinit+0x9a>
80105c57:	89 f6                	mov    %esi,%esi
80105c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105c60:	83 c3 01             	add    $0x1,%ebx
80105c63:	0f be 03             	movsbl (%ebx),%eax
80105c66:	84 c0                	test   %al,%al
80105c68:	74 19                	je     80105c83 <uartinit+0xb3>
80105c6a:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105c70:	85 d2                	test   %edx,%edx
80105c72:	74 ec                	je     80105c60 <uartinit+0x90>
80105c74:	83 c3 01             	add    $0x1,%ebx
80105c77:	e8 04 ff ff ff       	call   80105b80 <uartputc.part.0>
80105c7c:	0f be 03             	movsbl (%ebx),%eax
80105c7f:	84 c0                	test   %al,%al
80105c81:	75 e7                	jne    80105c6a <uartinit+0x9a>
80105c83:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c86:	5b                   	pop    %ebx
80105c87:	5e                   	pop    %esi
80105c88:	5f                   	pop    %edi
80105c89:	5d                   	pop    %ebp
80105c8a:	c3                   	ret    
80105c8b:	90                   	nop
80105c8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105c90 <uartputc>:
80105c90:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105c96:	55                   	push   %ebp
80105c97:	89 e5                	mov    %esp,%ebp
80105c99:	85 d2                	test   %edx,%edx
80105c9b:	8b 45 08             	mov    0x8(%ebp),%eax
80105c9e:	74 10                	je     80105cb0 <uartputc+0x20>
80105ca0:	5d                   	pop    %ebp
80105ca1:	e9 da fe ff ff       	jmp    80105b80 <uartputc.part.0>
80105ca6:	8d 76 00             	lea    0x0(%esi),%esi
80105ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105cb0:	5d                   	pop    %ebp
80105cb1:	c3                   	ret    
80105cb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105cc0 <uartintr>:
80105cc0:	55                   	push   %ebp
80105cc1:	89 e5                	mov    %esp,%ebp
80105cc3:	83 ec 14             	sub    $0x14,%esp
80105cc6:	68 50 5b 10 80       	push   $0x80105b50
80105ccb:	e8 40 ab ff ff       	call   80100810 <consoleintr>
80105cd0:	83 c4 10             	add    $0x10,%esp
80105cd3:	c9                   	leave  
80105cd4:	c3                   	ret    

80105cd5 <vector0>:
80105cd5:	6a 00                	push   $0x0
80105cd7:	6a 00                	push   $0x0
80105cd9:	e9 15 fb ff ff       	jmp    801057f3 <alltraps>

80105cde <vector1>:
80105cde:	6a 00                	push   $0x0
80105ce0:	6a 01                	push   $0x1
80105ce2:	e9 0c fb ff ff       	jmp    801057f3 <alltraps>

80105ce7 <vector2>:
80105ce7:	6a 00                	push   $0x0
80105ce9:	6a 02                	push   $0x2
80105ceb:	e9 03 fb ff ff       	jmp    801057f3 <alltraps>

80105cf0 <vector3>:
80105cf0:	6a 00                	push   $0x0
80105cf2:	6a 03                	push   $0x3
80105cf4:	e9 fa fa ff ff       	jmp    801057f3 <alltraps>

80105cf9 <vector4>:
80105cf9:	6a 00                	push   $0x0
80105cfb:	6a 04                	push   $0x4
80105cfd:	e9 f1 fa ff ff       	jmp    801057f3 <alltraps>

80105d02 <vector5>:
80105d02:	6a 00                	push   $0x0
80105d04:	6a 05                	push   $0x5
80105d06:	e9 e8 fa ff ff       	jmp    801057f3 <alltraps>

80105d0b <vector6>:
80105d0b:	6a 00                	push   $0x0
80105d0d:	6a 06                	push   $0x6
80105d0f:	e9 df fa ff ff       	jmp    801057f3 <alltraps>

80105d14 <vector7>:
80105d14:	6a 00                	push   $0x0
80105d16:	6a 07                	push   $0x7
80105d18:	e9 d6 fa ff ff       	jmp    801057f3 <alltraps>

80105d1d <vector8>:
80105d1d:	6a 08                	push   $0x8
80105d1f:	e9 cf fa ff ff       	jmp    801057f3 <alltraps>

80105d24 <vector9>:
80105d24:	6a 00                	push   $0x0
80105d26:	6a 09                	push   $0x9
80105d28:	e9 c6 fa ff ff       	jmp    801057f3 <alltraps>

80105d2d <vector10>:
80105d2d:	6a 0a                	push   $0xa
80105d2f:	e9 bf fa ff ff       	jmp    801057f3 <alltraps>

80105d34 <vector11>:
80105d34:	6a 0b                	push   $0xb
80105d36:	e9 b8 fa ff ff       	jmp    801057f3 <alltraps>

80105d3b <vector12>:
80105d3b:	6a 0c                	push   $0xc
80105d3d:	e9 b1 fa ff ff       	jmp    801057f3 <alltraps>

80105d42 <vector13>:
80105d42:	6a 0d                	push   $0xd
80105d44:	e9 aa fa ff ff       	jmp    801057f3 <alltraps>

80105d49 <vector14>:
80105d49:	6a 0e                	push   $0xe
80105d4b:	e9 a3 fa ff ff       	jmp    801057f3 <alltraps>

80105d50 <vector15>:
80105d50:	6a 00                	push   $0x0
80105d52:	6a 0f                	push   $0xf
80105d54:	e9 9a fa ff ff       	jmp    801057f3 <alltraps>

80105d59 <vector16>:
80105d59:	6a 00                	push   $0x0
80105d5b:	6a 10                	push   $0x10
80105d5d:	e9 91 fa ff ff       	jmp    801057f3 <alltraps>

80105d62 <vector17>:
80105d62:	6a 11                	push   $0x11
80105d64:	e9 8a fa ff ff       	jmp    801057f3 <alltraps>

80105d69 <vector18>:
80105d69:	6a 00                	push   $0x0
80105d6b:	6a 12                	push   $0x12
80105d6d:	e9 81 fa ff ff       	jmp    801057f3 <alltraps>

80105d72 <vector19>:
80105d72:	6a 00                	push   $0x0
80105d74:	6a 13                	push   $0x13
80105d76:	e9 78 fa ff ff       	jmp    801057f3 <alltraps>

80105d7b <vector20>:
80105d7b:	6a 00                	push   $0x0
80105d7d:	6a 14                	push   $0x14
80105d7f:	e9 6f fa ff ff       	jmp    801057f3 <alltraps>

80105d84 <vector21>:
80105d84:	6a 00                	push   $0x0
80105d86:	6a 15                	push   $0x15
80105d88:	e9 66 fa ff ff       	jmp    801057f3 <alltraps>

80105d8d <vector22>:
80105d8d:	6a 00                	push   $0x0
80105d8f:	6a 16                	push   $0x16
80105d91:	e9 5d fa ff ff       	jmp    801057f3 <alltraps>

80105d96 <vector23>:
80105d96:	6a 00                	push   $0x0
80105d98:	6a 17                	push   $0x17
80105d9a:	e9 54 fa ff ff       	jmp    801057f3 <alltraps>

80105d9f <vector24>:
80105d9f:	6a 00                	push   $0x0
80105da1:	6a 18                	push   $0x18
80105da3:	e9 4b fa ff ff       	jmp    801057f3 <alltraps>

80105da8 <vector25>:
80105da8:	6a 00                	push   $0x0
80105daa:	6a 19                	push   $0x19
80105dac:	e9 42 fa ff ff       	jmp    801057f3 <alltraps>

80105db1 <vector26>:
80105db1:	6a 00                	push   $0x0
80105db3:	6a 1a                	push   $0x1a
80105db5:	e9 39 fa ff ff       	jmp    801057f3 <alltraps>

80105dba <vector27>:
80105dba:	6a 00                	push   $0x0
80105dbc:	6a 1b                	push   $0x1b
80105dbe:	e9 30 fa ff ff       	jmp    801057f3 <alltraps>

80105dc3 <vector28>:
80105dc3:	6a 00                	push   $0x0
80105dc5:	6a 1c                	push   $0x1c
80105dc7:	e9 27 fa ff ff       	jmp    801057f3 <alltraps>

80105dcc <vector29>:
80105dcc:	6a 00                	push   $0x0
80105dce:	6a 1d                	push   $0x1d
80105dd0:	e9 1e fa ff ff       	jmp    801057f3 <alltraps>

80105dd5 <vector30>:
80105dd5:	6a 00                	push   $0x0
80105dd7:	6a 1e                	push   $0x1e
80105dd9:	e9 15 fa ff ff       	jmp    801057f3 <alltraps>

80105dde <vector31>:
80105dde:	6a 00                	push   $0x0
80105de0:	6a 1f                	push   $0x1f
80105de2:	e9 0c fa ff ff       	jmp    801057f3 <alltraps>

80105de7 <vector32>:
80105de7:	6a 00                	push   $0x0
80105de9:	6a 20                	push   $0x20
80105deb:	e9 03 fa ff ff       	jmp    801057f3 <alltraps>

80105df0 <vector33>:
80105df0:	6a 00                	push   $0x0
80105df2:	6a 21                	push   $0x21
80105df4:	e9 fa f9 ff ff       	jmp    801057f3 <alltraps>

80105df9 <vector34>:
80105df9:	6a 00                	push   $0x0
80105dfb:	6a 22                	push   $0x22
80105dfd:	e9 f1 f9 ff ff       	jmp    801057f3 <alltraps>

80105e02 <vector35>:
80105e02:	6a 00                	push   $0x0
80105e04:	6a 23                	push   $0x23
80105e06:	e9 e8 f9 ff ff       	jmp    801057f3 <alltraps>

80105e0b <vector36>:
80105e0b:	6a 00                	push   $0x0
80105e0d:	6a 24                	push   $0x24
80105e0f:	e9 df f9 ff ff       	jmp    801057f3 <alltraps>

80105e14 <vector37>:
80105e14:	6a 00                	push   $0x0
80105e16:	6a 25                	push   $0x25
80105e18:	e9 d6 f9 ff ff       	jmp    801057f3 <alltraps>

80105e1d <vector38>:
80105e1d:	6a 00                	push   $0x0
80105e1f:	6a 26                	push   $0x26
80105e21:	e9 cd f9 ff ff       	jmp    801057f3 <alltraps>

80105e26 <vector39>:
80105e26:	6a 00                	push   $0x0
80105e28:	6a 27                	push   $0x27
80105e2a:	e9 c4 f9 ff ff       	jmp    801057f3 <alltraps>

80105e2f <vector40>:
80105e2f:	6a 00                	push   $0x0
80105e31:	6a 28                	push   $0x28
80105e33:	e9 bb f9 ff ff       	jmp    801057f3 <alltraps>

80105e38 <vector41>:
80105e38:	6a 00                	push   $0x0
80105e3a:	6a 29                	push   $0x29
80105e3c:	e9 b2 f9 ff ff       	jmp    801057f3 <alltraps>

80105e41 <vector42>:
80105e41:	6a 00                	push   $0x0
80105e43:	6a 2a                	push   $0x2a
80105e45:	e9 a9 f9 ff ff       	jmp    801057f3 <alltraps>

80105e4a <vector43>:
80105e4a:	6a 00                	push   $0x0
80105e4c:	6a 2b                	push   $0x2b
80105e4e:	e9 a0 f9 ff ff       	jmp    801057f3 <alltraps>

80105e53 <vector44>:
80105e53:	6a 00                	push   $0x0
80105e55:	6a 2c                	push   $0x2c
80105e57:	e9 97 f9 ff ff       	jmp    801057f3 <alltraps>

80105e5c <vector45>:
80105e5c:	6a 00                	push   $0x0
80105e5e:	6a 2d                	push   $0x2d
80105e60:	e9 8e f9 ff ff       	jmp    801057f3 <alltraps>

80105e65 <vector46>:
80105e65:	6a 00                	push   $0x0
80105e67:	6a 2e                	push   $0x2e
80105e69:	e9 85 f9 ff ff       	jmp    801057f3 <alltraps>

80105e6e <vector47>:
80105e6e:	6a 00                	push   $0x0
80105e70:	6a 2f                	push   $0x2f
80105e72:	e9 7c f9 ff ff       	jmp    801057f3 <alltraps>

80105e77 <vector48>:
80105e77:	6a 00                	push   $0x0
80105e79:	6a 30                	push   $0x30
80105e7b:	e9 73 f9 ff ff       	jmp    801057f3 <alltraps>

80105e80 <vector49>:
80105e80:	6a 00                	push   $0x0
80105e82:	6a 31                	push   $0x31
80105e84:	e9 6a f9 ff ff       	jmp    801057f3 <alltraps>

80105e89 <vector50>:
80105e89:	6a 00                	push   $0x0
80105e8b:	6a 32                	push   $0x32
80105e8d:	e9 61 f9 ff ff       	jmp    801057f3 <alltraps>

80105e92 <vector51>:
80105e92:	6a 00                	push   $0x0
80105e94:	6a 33                	push   $0x33
80105e96:	e9 58 f9 ff ff       	jmp    801057f3 <alltraps>

80105e9b <vector52>:
80105e9b:	6a 00                	push   $0x0
80105e9d:	6a 34                	push   $0x34
80105e9f:	e9 4f f9 ff ff       	jmp    801057f3 <alltraps>

80105ea4 <vector53>:
80105ea4:	6a 00                	push   $0x0
80105ea6:	6a 35                	push   $0x35
80105ea8:	e9 46 f9 ff ff       	jmp    801057f3 <alltraps>

80105ead <vector54>:
80105ead:	6a 00                	push   $0x0
80105eaf:	6a 36                	push   $0x36
80105eb1:	e9 3d f9 ff ff       	jmp    801057f3 <alltraps>

80105eb6 <vector55>:
80105eb6:	6a 00                	push   $0x0
80105eb8:	6a 37                	push   $0x37
80105eba:	e9 34 f9 ff ff       	jmp    801057f3 <alltraps>

80105ebf <vector56>:
80105ebf:	6a 00                	push   $0x0
80105ec1:	6a 38                	push   $0x38
80105ec3:	e9 2b f9 ff ff       	jmp    801057f3 <alltraps>

80105ec8 <vector57>:
80105ec8:	6a 00                	push   $0x0
80105eca:	6a 39                	push   $0x39
80105ecc:	e9 22 f9 ff ff       	jmp    801057f3 <alltraps>

80105ed1 <vector58>:
80105ed1:	6a 00                	push   $0x0
80105ed3:	6a 3a                	push   $0x3a
80105ed5:	e9 19 f9 ff ff       	jmp    801057f3 <alltraps>

80105eda <vector59>:
80105eda:	6a 00                	push   $0x0
80105edc:	6a 3b                	push   $0x3b
80105ede:	e9 10 f9 ff ff       	jmp    801057f3 <alltraps>

80105ee3 <vector60>:
80105ee3:	6a 00                	push   $0x0
80105ee5:	6a 3c                	push   $0x3c
80105ee7:	e9 07 f9 ff ff       	jmp    801057f3 <alltraps>

80105eec <vector61>:
80105eec:	6a 00                	push   $0x0
80105eee:	6a 3d                	push   $0x3d
80105ef0:	e9 fe f8 ff ff       	jmp    801057f3 <alltraps>

80105ef5 <vector62>:
80105ef5:	6a 00                	push   $0x0
80105ef7:	6a 3e                	push   $0x3e
80105ef9:	e9 f5 f8 ff ff       	jmp    801057f3 <alltraps>

80105efe <vector63>:
80105efe:	6a 00                	push   $0x0
80105f00:	6a 3f                	push   $0x3f
80105f02:	e9 ec f8 ff ff       	jmp    801057f3 <alltraps>

80105f07 <vector64>:
80105f07:	6a 00                	push   $0x0
80105f09:	6a 40                	push   $0x40
80105f0b:	e9 e3 f8 ff ff       	jmp    801057f3 <alltraps>

80105f10 <vector65>:
80105f10:	6a 00                	push   $0x0
80105f12:	6a 41                	push   $0x41
80105f14:	e9 da f8 ff ff       	jmp    801057f3 <alltraps>

80105f19 <vector66>:
80105f19:	6a 00                	push   $0x0
80105f1b:	6a 42                	push   $0x42
80105f1d:	e9 d1 f8 ff ff       	jmp    801057f3 <alltraps>

80105f22 <vector67>:
80105f22:	6a 00                	push   $0x0
80105f24:	6a 43                	push   $0x43
80105f26:	e9 c8 f8 ff ff       	jmp    801057f3 <alltraps>

80105f2b <vector68>:
80105f2b:	6a 00                	push   $0x0
80105f2d:	6a 44                	push   $0x44
80105f2f:	e9 bf f8 ff ff       	jmp    801057f3 <alltraps>

80105f34 <vector69>:
80105f34:	6a 00                	push   $0x0
80105f36:	6a 45                	push   $0x45
80105f38:	e9 b6 f8 ff ff       	jmp    801057f3 <alltraps>

80105f3d <vector70>:
80105f3d:	6a 00                	push   $0x0
80105f3f:	6a 46                	push   $0x46
80105f41:	e9 ad f8 ff ff       	jmp    801057f3 <alltraps>

80105f46 <vector71>:
80105f46:	6a 00                	push   $0x0
80105f48:	6a 47                	push   $0x47
80105f4a:	e9 a4 f8 ff ff       	jmp    801057f3 <alltraps>

80105f4f <vector72>:
80105f4f:	6a 00                	push   $0x0
80105f51:	6a 48                	push   $0x48
80105f53:	e9 9b f8 ff ff       	jmp    801057f3 <alltraps>

80105f58 <vector73>:
80105f58:	6a 00                	push   $0x0
80105f5a:	6a 49                	push   $0x49
80105f5c:	e9 92 f8 ff ff       	jmp    801057f3 <alltraps>

80105f61 <vector74>:
80105f61:	6a 00                	push   $0x0
80105f63:	6a 4a                	push   $0x4a
80105f65:	e9 89 f8 ff ff       	jmp    801057f3 <alltraps>

80105f6a <vector75>:
80105f6a:	6a 00                	push   $0x0
80105f6c:	6a 4b                	push   $0x4b
80105f6e:	e9 80 f8 ff ff       	jmp    801057f3 <alltraps>

80105f73 <vector76>:
80105f73:	6a 00                	push   $0x0
80105f75:	6a 4c                	push   $0x4c
80105f77:	e9 77 f8 ff ff       	jmp    801057f3 <alltraps>

80105f7c <vector77>:
80105f7c:	6a 00                	push   $0x0
80105f7e:	6a 4d                	push   $0x4d
80105f80:	e9 6e f8 ff ff       	jmp    801057f3 <alltraps>

80105f85 <vector78>:
80105f85:	6a 00                	push   $0x0
80105f87:	6a 4e                	push   $0x4e
80105f89:	e9 65 f8 ff ff       	jmp    801057f3 <alltraps>

80105f8e <vector79>:
80105f8e:	6a 00                	push   $0x0
80105f90:	6a 4f                	push   $0x4f
80105f92:	e9 5c f8 ff ff       	jmp    801057f3 <alltraps>

80105f97 <vector80>:
80105f97:	6a 00                	push   $0x0
80105f99:	6a 50                	push   $0x50
80105f9b:	e9 53 f8 ff ff       	jmp    801057f3 <alltraps>

80105fa0 <vector81>:
80105fa0:	6a 00                	push   $0x0
80105fa2:	6a 51                	push   $0x51
80105fa4:	e9 4a f8 ff ff       	jmp    801057f3 <alltraps>

80105fa9 <vector82>:
80105fa9:	6a 00                	push   $0x0
80105fab:	6a 52                	push   $0x52
80105fad:	e9 41 f8 ff ff       	jmp    801057f3 <alltraps>

80105fb2 <vector83>:
80105fb2:	6a 00                	push   $0x0
80105fb4:	6a 53                	push   $0x53
80105fb6:	e9 38 f8 ff ff       	jmp    801057f3 <alltraps>

80105fbb <vector84>:
80105fbb:	6a 00                	push   $0x0
80105fbd:	6a 54                	push   $0x54
80105fbf:	e9 2f f8 ff ff       	jmp    801057f3 <alltraps>

80105fc4 <vector85>:
80105fc4:	6a 00                	push   $0x0
80105fc6:	6a 55                	push   $0x55
80105fc8:	e9 26 f8 ff ff       	jmp    801057f3 <alltraps>

80105fcd <vector86>:
80105fcd:	6a 00                	push   $0x0
80105fcf:	6a 56                	push   $0x56
80105fd1:	e9 1d f8 ff ff       	jmp    801057f3 <alltraps>

80105fd6 <vector87>:
80105fd6:	6a 00                	push   $0x0
80105fd8:	6a 57                	push   $0x57
80105fda:	e9 14 f8 ff ff       	jmp    801057f3 <alltraps>

80105fdf <vector88>:
80105fdf:	6a 00                	push   $0x0
80105fe1:	6a 58                	push   $0x58
80105fe3:	e9 0b f8 ff ff       	jmp    801057f3 <alltraps>

80105fe8 <vector89>:
80105fe8:	6a 00                	push   $0x0
80105fea:	6a 59                	push   $0x59
80105fec:	e9 02 f8 ff ff       	jmp    801057f3 <alltraps>

80105ff1 <vector90>:
80105ff1:	6a 00                	push   $0x0
80105ff3:	6a 5a                	push   $0x5a
80105ff5:	e9 f9 f7 ff ff       	jmp    801057f3 <alltraps>

80105ffa <vector91>:
80105ffa:	6a 00                	push   $0x0
80105ffc:	6a 5b                	push   $0x5b
80105ffe:	e9 f0 f7 ff ff       	jmp    801057f3 <alltraps>

80106003 <vector92>:
80106003:	6a 00                	push   $0x0
80106005:	6a 5c                	push   $0x5c
80106007:	e9 e7 f7 ff ff       	jmp    801057f3 <alltraps>

8010600c <vector93>:
8010600c:	6a 00                	push   $0x0
8010600e:	6a 5d                	push   $0x5d
80106010:	e9 de f7 ff ff       	jmp    801057f3 <alltraps>

80106015 <vector94>:
80106015:	6a 00                	push   $0x0
80106017:	6a 5e                	push   $0x5e
80106019:	e9 d5 f7 ff ff       	jmp    801057f3 <alltraps>

8010601e <vector95>:
8010601e:	6a 00                	push   $0x0
80106020:	6a 5f                	push   $0x5f
80106022:	e9 cc f7 ff ff       	jmp    801057f3 <alltraps>

80106027 <vector96>:
80106027:	6a 00                	push   $0x0
80106029:	6a 60                	push   $0x60
8010602b:	e9 c3 f7 ff ff       	jmp    801057f3 <alltraps>

80106030 <vector97>:
80106030:	6a 00                	push   $0x0
80106032:	6a 61                	push   $0x61
80106034:	e9 ba f7 ff ff       	jmp    801057f3 <alltraps>

80106039 <vector98>:
80106039:	6a 00                	push   $0x0
8010603b:	6a 62                	push   $0x62
8010603d:	e9 b1 f7 ff ff       	jmp    801057f3 <alltraps>

80106042 <vector99>:
80106042:	6a 00                	push   $0x0
80106044:	6a 63                	push   $0x63
80106046:	e9 a8 f7 ff ff       	jmp    801057f3 <alltraps>

8010604b <vector100>:
8010604b:	6a 00                	push   $0x0
8010604d:	6a 64                	push   $0x64
8010604f:	e9 9f f7 ff ff       	jmp    801057f3 <alltraps>

80106054 <vector101>:
80106054:	6a 00                	push   $0x0
80106056:	6a 65                	push   $0x65
80106058:	e9 96 f7 ff ff       	jmp    801057f3 <alltraps>

8010605d <vector102>:
8010605d:	6a 00                	push   $0x0
8010605f:	6a 66                	push   $0x66
80106061:	e9 8d f7 ff ff       	jmp    801057f3 <alltraps>

80106066 <vector103>:
80106066:	6a 00                	push   $0x0
80106068:	6a 67                	push   $0x67
8010606a:	e9 84 f7 ff ff       	jmp    801057f3 <alltraps>

8010606f <vector104>:
8010606f:	6a 00                	push   $0x0
80106071:	6a 68                	push   $0x68
80106073:	e9 7b f7 ff ff       	jmp    801057f3 <alltraps>

80106078 <vector105>:
80106078:	6a 00                	push   $0x0
8010607a:	6a 69                	push   $0x69
8010607c:	e9 72 f7 ff ff       	jmp    801057f3 <alltraps>

80106081 <vector106>:
80106081:	6a 00                	push   $0x0
80106083:	6a 6a                	push   $0x6a
80106085:	e9 69 f7 ff ff       	jmp    801057f3 <alltraps>

8010608a <vector107>:
8010608a:	6a 00                	push   $0x0
8010608c:	6a 6b                	push   $0x6b
8010608e:	e9 60 f7 ff ff       	jmp    801057f3 <alltraps>

80106093 <vector108>:
80106093:	6a 00                	push   $0x0
80106095:	6a 6c                	push   $0x6c
80106097:	e9 57 f7 ff ff       	jmp    801057f3 <alltraps>

8010609c <vector109>:
8010609c:	6a 00                	push   $0x0
8010609e:	6a 6d                	push   $0x6d
801060a0:	e9 4e f7 ff ff       	jmp    801057f3 <alltraps>

801060a5 <vector110>:
801060a5:	6a 00                	push   $0x0
801060a7:	6a 6e                	push   $0x6e
801060a9:	e9 45 f7 ff ff       	jmp    801057f3 <alltraps>

801060ae <vector111>:
801060ae:	6a 00                	push   $0x0
801060b0:	6a 6f                	push   $0x6f
801060b2:	e9 3c f7 ff ff       	jmp    801057f3 <alltraps>

801060b7 <vector112>:
801060b7:	6a 00                	push   $0x0
801060b9:	6a 70                	push   $0x70
801060bb:	e9 33 f7 ff ff       	jmp    801057f3 <alltraps>

801060c0 <vector113>:
801060c0:	6a 00                	push   $0x0
801060c2:	6a 71                	push   $0x71
801060c4:	e9 2a f7 ff ff       	jmp    801057f3 <alltraps>

801060c9 <vector114>:
801060c9:	6a 00                	push   $0x0
801060cb:	6a 72                	push   $0x72
801060cd:	e9 21 f7 ff ff       	jmp    801057f3 <alltraps>

801060d2 <vector115>:
801060d2:	6a 00                	push   $0x0
801060d4:	6a 73                	push   $0x73
801060d6:	e9 18 f7 ff ff       	jmp    801057f3 <alltraps>

801060db <vector116>:
801060db:	6a 00                	push   $0x0
801060dd:	6a 74                	push   $0x74
801060df:	e9 0f f7 ff ff       	jmp    801057f3 <alltraps>

801060e4 <vector117>:
801060e4:	6a 00                	push   $0x0
801060e6:	6a 75                	push   $0x75
801060e8:	e9 06 f7 ff ff       	jmp    801057f3 <alltraps>

801060ed <vector118>:
801060ed:	6a 00                	push   $0x0
801060ef:	6a 76                	push   $0x76
801060f1:	e9 fd f6 ff ff       	jmp    801057f3 <alltraps>

801060f6 <vector119>:
801060f6:	6a 00                	push   $0x0
801060f8:	6a 77                	push   $0x77
801060fa:	e9 f4 f6 ff ff       	jmp    801057f3 <alltraps>

801060ff <vector120>:
801060ff:	6a 00                	push   $0x0
80106101:	6a 78                	push   $0x78
80106103:	e9 eb f6 ff ff       	jmp    801057f3 <alltraps>

80106108 <vector121>:
80106108:	6a 00                	push   $0x0
8010610a:	6a 79                	push   $0x79
8010610c:	e9 e2 f6 ff ff       	jmp    801057f3 <alltraps>

80106111 <vector122>:
80106111:	6a 00                	push   $0x0
80106113:	6a 7a                	push   $0x7a
80106115:	e9 d9 f6 ff ff       	jmp    801057f3 <alltraps>

8010611a <vector123>:
8010611a:	6a 00                	push   $0x0
8010611c:	6a 7b                	push   $0x7b
8010611e:	e9 d0 f6 ff ff       	jmp    801057f3 <alltraps>

80106123 <vector124>:
80106123:	6a 00                	push   $0x0
80106125:	6a 7c                	push   $0x7c
80106127:	e9 c7 f6 ff ff       	jmp    801057f3 <alltraps>

8010612c <vector125>:
8010612c:	6a 00                	push   $0x0
8010612e:	6a 7d                	push   $0x7d
80106130:	e9 be f6 ff ff       	jmp    801057f3 <alltraps>

80106135 <vector126>:
80106135:	6a 00                	push   $0x0
80106137:	6a 7e                	push   $0x7e
80106139:	e9 b5 f6 ff ff       	jmp    801057f3 <alltraps>

8010613e <vector127>:
8010613e:	6a 00                	push   $0x0
80106140:	6a 7f                	push   $0x7f
80106142:	e9 ac f6 ff ff       	jmp    801057f3 <alltraps>

80106147 <vector128>:
80106147:	6a 00                	push   $0x0
80106149:	68 80 00 00 00       	push   $0x80
8010614e:	e9 a0 f6 ff ff       	jmp    801057f3 <alltraps>

80106153 <vector129>:
80106153:	6a 00                	push   $0x0
80106155:	68 81 00 00 00       	push   $0x81
8010615a:	e9 94 f6 ff ff       	jmp    801057f3 <alltraps>

8010615f <vector130>:
8010615f:	6a 00                	push   $0x0
80106161:	68 82 00 00 00       	push   $0x82
80106166:	e9 88 f6 ff ff       	jmp    801057f3 <alltraps>

8010616b <vector131>:
8010616b:	6a 00                	push   $0x0
8010616d:	68 83 00 00 00       	push   $0x83
80106172:	e9 7c f6 ff ff       	jmp    801057f3 <alltraps>

80106177 <vector132>:
80106177:	6a 00                	push   $0x0
80106179:	68 84 00 00 00       	push   $0x84
8010617e:	e9 70 f6 ff ff       	jmp    801057f3 <alltraps>

80106183 <vector133>:
80106183:	6a 00                	push   $0x0
80106185:	68 85 00 00 00       	push   $0x85
8010618a:	e9 64 f6 ff ff       	jmp    801057f3 <alltraps>

8010618f <vector134>:
8010618f:	6a 00                	push   $0x0
80106191:	68 86 00 00 00       	push   $0x86
80106196:	e9 58 f6 ff ff       	jmp    801057f3 <alltraps>

8010619b <vector135>:
8010619b:	6a 00                	push   $0x0
8010619d:	68 87 00 00 00       	push   $0x87
801061a2:	e9 4c f6 ff ff       	jmp    801057f3 <alltraps>

801061a7 <vector136>:
801061a7:	6a 00                	push   $0x0
801061a9:	68 88 00 00 00       	push   $0x88
801061ae:	e9 40 f6 ff ff       	jmp    801057f3 <alltraps>

801061b3 <vector137>:
801061b3:	6a 00                	push   $0x0
801061b5:	68 89 00 00 00       	push   $0x89
801061ba:	e9 34 f6 ff ff       	jmp    801057f3 <alltraps>

801061bf <vector138>:
801061bf:	6a 00                	push   $0x0
801061c1:	68 8a 00 00 00       	push   $0x8a
801061c6:	e9 28 f6 ff ff       	jmp    801057f3 <alltraps>

801061cb <vector139>:
801061cb:	6a 00                	push   $0x0
801061cd:	68 8b 00 00 00       	push   $0x8b
801061d2:	e9 1c f6 ff ff       	jmp    801057f3 <alltraps>

801061d7 <vector140>:
801061d7:	6a 00                	push   $0x0
801061d9:	68 8c 00 00 00       	push   $0x8c
801061de:	e9 10 f6 ff ff       	jmp    801057f3 <alltraps>

801061e3 <vector141>:
801061e3:	6a 00                	push   $0x0
801061e5:	68 8d 00 00 00       	push   $0x8d
801061ea:	e9 04 f6 ff ff       	jmp    801057f3 <alltraps>

801061ef <vector142>:
801061ef:	6a 00                	push   $0x0
801061f1:	68 8e 00 00 00       	push   $0x8e
801061f6:	e9 f8 f5 ff ff       	jmp    801057f3 <alltraps>

801061fb <vector143>:
801061fb:	6a 00                	push   $0x0
801061fd:	68 8f 00 00 00       	push   $0x8f
80106202:	e9 ec f5 ff ff       	jmp    801057f3 <alltraps>

80106207 <vector144>:
80106207:	6a 00                	push   $0x0
80106209:	68 90 00 00 00       	push   $0x90
8010620e:	e9 e0 f5 ff ff       	jmp    801057f3 <alltraps>

80106213 <vector145>:
80106213:	6a 00                	push   $0x0
80106215:	68 91 00 00 00       	push   $0x91
8010621a:	e9 d4 f5 ff ff       	jmp    801057f3 <alltraps>

8010621f <vector146>:
8010621f:	6a 00                	push   $0x0
80106221:	68 92 00 00 00       	push   $0x92
80106226:	e9 c8 f5 ff ff       	jmp    801057f3 <alltraps>

8010622b <vector147>:
8010622b:	6a 00                	push   $0x0
8010622d:	68 93 00 00 00       	push   $0x93
80106232:	e9 bc f5 ff ff       	jmp    801057f3 <alltraps>

80106237 <vector148>:
80106237:	6a 00                	push   $0x0
80106239:	68 94 00 00 00       	push   $0x94
8010623e:	e9 b0 f5 ff ff       	jmp    801057f3 <alltraps>

80106243 <vector149>:
80106243:	6a 00                	push   $0x0
80106245:	68 95 00 00 00       	push   $0x95
8010624a:	e9 a4 f5 ff ff       	jmp    801057f3 <alltraps>

8010624f <vector150>:
8010624f:	6a 00                	push   $0x0
80106251:	68 96 00 00 00       	push   $0x96
80106256:	e9 98 f5 ff ff       	jmp    801057f3 <alltraps>

8010625b <vector151>:
8010625b:	6a 00                	push   $0x0
8010625d:	68 97 00 00 00       	push   $0x97
80106262:	e9 8c f5 ff ff       	jmp    801057f3 <alltraps>

80106267 <vector152>:
80106267:	6a 00                	push   $0x0
80106269:	68 98 00 00 00       	push   $0x98
8010626e:	e9 80 f5 ff ff       	jmp    801057f3 <alltraps>

80106273 <vector153>:
80106273:	6a 00                	push   $0x0
80106275:	68 99 00 00 00       	push   $0x99
8010627a:	e9 74 f5 ff ff       	jmp    801057f3 <alltraps>

8010627f <vector154>:
8010627f:	6a 00                	push   $0x0
80106281:	68 9a 00 00 00       	push   $0x9a
80106286:	e9 68 f5 ff ff       	jmp    801057f3 <alltraps>

8010628b <vector155>:
8010628b:	6a 00                	push   $0x0
8010628d:	68 9b 00 00 00       	push   $0x9b
80106292:	e9 5c f5 ff ff       	jmp    801057f3 <alltraps>

80106297 <vector156>:
80106297:	6a 00                	push   $0x0
80106299:	68 9c 00 00 00       	push   $0x9c
8010629e:	e9 50 f5 ff ff       	jmp    801057f3 <alltraps>

801062a3 <vector157>:
801062a3:	6a 00                	push   $0x0
801062a5:	68 9d 00 00 00       	push   $0x9d
801062aa:	e9 44 f5 ff ff       	jmp    801057f3 <alltraps>

801062af <vector158>:
801062af:	6a 00                	push   $0x0
801062b1:	68 9e 00 00 00       	push   $0x9e
801062b6:	e9 38 f5 ff ff       	jmp    801057f3 <alltraps>

801062bb <vector159>:
801062bb:	6a 00                	push   $0x0
801062bd:	68 9f 00 00 00       	push   $0x9f
801062c2:	e9 2c f5 ff ff       	jmp    801057f3 <alltraps>

801062c7 <vector160>:
801062c7:	6a 00                	push   $0x0
801062c9:	68 a0 00 00 00       	push   $0xa0
801062ce:	e9 20 f5 ff ff       	jmp    801057f3 <alltraps>

801062d3 <vector161>:
801062d3:	6a 00                	push   $0x0
801062d5:	68 a1 00 00 00       	push   $0xa1
801062da:	e9 14 f5 ff ff       	jmp    801057f3 <alltraps>

801062df <vector162>:
801062df:	6a 00                	push   $0x0
801062e1:	68 a2 00 00 00       	push   $0xa2
801062e6:	e9 08 f5 ff ff       	jmp    801057f3 <alltraps>

801062eb <vector163>:
801062eb:	6a 00                	push   $0x0
801062ed:	68 a3 00 00 00       	push   $0xa3
801062f2:	e9 fc f4 ff ff       	jmp    801057f3 <alltraps>

801062f7 <vector164>:
801062f7:	6a 00                	push   $0x0
801062f9:	68 a4 00 00 00       	push   $0xa4
801062fe:	e9 f0 f4 ff ff       	jmp    801057f3 <alltraps>

80106303 <vector165>:
80106303:	6a 00                	push   $0x0
80106305:	68 a5 00 00 00       	push   $0xa5
8010630a:	e9 e4 f4 ff ff       	jmp    801057f3 <alltraps>

8010630f <vector166>:
8010630f:	6a 00                	push   $0x0
80106311:	68 a6 00 00 00       	push   $0xa6
80106316:	e9 d8 f4 ff ff       	jmp    801057f3 <alltraps>

8010631b <vector167>:
8010631b:	6a 00                	push   $0x0
8010631d:	68 a7 00 00 00       	push   $0xa7
80106322:	e9 cc f4 ff ff       	jmp    801057f3 <alltraps>

80106327 <vector168>:
80106327:	6a 00                	push   $0x0
80106329:	68 a8 00 00 00       	push   $0xa8
8010632e:	e9 c0 f4 ff ff       	jmp    801057f3 <alltraps>

80106333 <vector169>:
80106333:	6a 00                	push   $0x0
80106335:	68 a9 00 00 00       	push   $0xa9
8010633a:	e9 b4 f4 ff ff       	jmp    801057f3 <alltraps>

8010633f <vector170>:
8010633f:	6a 00                	push   $0x0
80106341:	68 aa 00 00 00       	push   $0xaa
80106346:	e9 a8 f4 ff ff       	jmp    801057f3 <alltraps>

8010634b <vector171>:
8010634b:	6a 00                	push   $0x0
8010634d:	68 ab 00 00 00       	push   $0xab
80106352:	e9 9c f4 ff ff       	jmp    801057f3 <alltraps>

80106357 <vector172>:
80106357:	6a 00                	push   $0x0
80106359:	68 ac 00 00 00       	push   $0xac
8010635e:	e9 90 f4 ff ff       	jmp    801057f3 <alltraps>

80106363 <vector173>:
80106363:	6a 00                	push   $0x0
80106365:	68 ad 00 00 00       	push   $0xad
8010636a:	e9 84 f4 ff ff       	jmp    801057f3 <alltraps>

8010636f <vector174>:
8010636f:	6a 00                	push   $0x0
80106371:	68 ae 00 00 00       	push   $0xae
80106376:	e9 78 f4 ff ff       	jmp    801057f3 <alltraps>

8010637b <vector175>:
8010637b:	6a 00                	push   $0x0
8010637d:	68 af 00 00 00       	push   $0xaf
80106382:	e9 6c f4 ff ff       	jmp    801057f3 <alltraps>

80106387 <vector176>:
80106387:	6a 00                	push   $0x0
80106389:	68 b0 00 00 00       	push   $0xb0
8010638e:	e9 60 f4 ff ff       	jmp    801057f3 <alltraps>

80106393 <vector177>:
80106393:	6a 00                	push   $0x0
80106395:	68 b1 00 00 00       	push   $0xb1
8010639a:	e9 54 f4 ff ff       	jmp    801057f3 <alltraps>

8010639f <vector178>:
8010639f:	6a 00                	push   $0x0
801063a1:	68 b2 00 00 00       	push   $0xb2
801063a6:	e9 48 f4 ff ff       	jmp    801057f3 <alltraps>

801063ab <vector179>:
801063ab:	6a 00                	push   $0x0
801063ad:	68 b3 00 00 00       	push   $0xb3
801063b2:	e9 3c f4 ff ff       	jmp    801057f3 <alltraps>

801063b7 <vector180>:
801063b7:	6a 00                	push   $0x0
801063b9:	68 b4 00 00 00       	push   $0xb4
801063be:	e9 30 f4 ff ff       	jmp    801057f3 <alltraps>

801063c3 <vector181>:
801063c3:	6a 00                	push   $0x0
801063c5:	68 b5 00 00 00       	push   $0xb5
801063ca:	e9 24 f4 ff ff       	jmp    801057f3 <alltraps>

801063cf <vector182>:
801063cf:	6a 00                	push   $0x0
801063d1:	68 b6 00 00 00       	push   $0xb6
801063d6:	e9 18 f4 ff ff       	jmp    801057f3 <alltraps>

801063db <vector183>:
801063db:	6a 00                	push   $0x0
801063dd:	68 b7 00 00 00       	push   $0xb7
801063e2:	e9 0c f4 ff ff       	jmp    801057f3 <alltraps>

801063e7 <vector184>:
801063e7:	6a 00                	push   $0x0
801063e9:	68 b8 00 00 00       	push   $0xb8
801063ee:	e9 00 f4 ff ff       	jmp    801057f3 <alltraps>

801063f3 <vector185>:
801063f3:	6a 00                	push   $0x0
801063f5:	68 b9 00 00 00       	push   $0xb9
801063fa:	e9 f4 f3 ff ff       	jmp    801057f3 <alltraps>

801063ff <vector186>:
801063ff:	6a 00                	push   $0x0
80106401:	68 ba 00 00 00       	push   $0xba
80106406:	e9 e8 f3 ff ff       	jmp    801057f3 <alltraps>

8010640b <vector187>:
8010640b:	6a 00                	push   $0x0
8010640d:	68 bb 00 00 00       	push   $0xbb
80106412:	e9 dc f3 ff ff       	jmp    801057f3 <alltraps>

80106417 <vector188>:
80106417:	6a 00                	push   $0x0
80106419:	68 bc 00 00 00       	push   $0xbc
8010641e:	e9 d0 f3 ff ff       	jmp    801057f3 <alltraps>

80106423 <vector189>:
80106423:	6a 00                	push   $0x0
80106425:	68 bd 00 00 00       	push   $0xbd
8010642a:	e9 c4 f3 ff ff       	jmp    801057f3 <alltraps>

8010642f <vector190>:
8010642f:	6a 00                	push   $0x0
80106431:	68 be 00 00 00       	push   $0xbe
80106436:	e9 b8 f3 ff ff       	jmp    801057f3 <alltraps>

8010643b <vector191>:
8010643b:	6a 00                	push   $0x0
8010643d:	68 bf 00 00 00       	push   $0xbf
80106442:	e9 ac f3 ff ff       	jmp    801057f3 <alltraps>

80106447 <vector192>:
80106447:	6a 00                	push   $0x0
80106449:	68 c0 00 00 00       	push   $0xc0
8010644e:	e9 a0 f3 ff ff       	jmp    801057f3 <alltraps>

80106453 <vector193>:
80106453:	6a 00                	push   $0x0
80106455:	68 c1 00 00 00       	push   $0xc1
8010645a:	e9 94 f3 ff ff       	jmp    801057f3 <alltraps>

8010645f <vector194>:
8010645f:	6a 00                	push   $0x0
80106461:	68 c2 00 00 00       	push   $0xc2
80106466:	e9 88 f3 ff ff       	jmp    801057f3 <alltraps>

8010646b <vector195>:
8010646b:	6a 00                	push   $0x0
8010646d:	68 c3 00 00 00       	push   $0xc3
80106472:	e9 7c f3 ff ff       	jmp    801057f3 <alltraps>

80106477 <vector196>:
80106477:	6a 00                	push   $0x0
80106479:	68 c4 00 00 00       	push   $0xc4
8010647e:	e9 70 f3 ff ff       	jmp    801057f3 <alltraps>

80106483 <vector197>:
80106483:	6a 00                	push   $0x0
80106485:	68 c5 00 00 00       	push   $0xc5
8010648a:	e9 64 f3 ff ff       	jmp    801057f3 <alltraps>

8010648f <vector198>:
8010648f:	6a 00                	push   $0x0
80106491:	68 c6 00 00 00       	push   $0xc6
80106496:	e9 58 f3 ff ff       	jmp    801057f3 <alltraps>

8010649b <vector199>:
8010649b:	6a 00                	push   $0x0
8010649d:	68 c7 00 00 00       	push   $0xc7
801064a2:	e9 4c f3 ff ff       	jmp    801057f3 <alltraps>

801064a7 <vector200>:
801064a7:	6a 00                	push   $0x0
801064a9:	68 c8 00 00 00       	push   $0xc8
801064ae:	e9 40 f3 ff ff       	jmp    801057f3 <alltraps>

801064b3 <vector201>:
801064b3:	6a 00                	push   $0x0
801064b5:	68 c9 00 00 00       	push   $0xc9
801064ba:	e9 34 f3 ff ff       	jmp    801057f3 <alltraps>

801064bf <vector202>:
801064bf:	6a 00                	push   $0x0
801064c1:	68 ca 00 00 00       	push   $0xca
801064c6:	e9 28 f3 ff ff       	jmp    801057f3 <alltraps>

801064cb <vector203>:
801064cb:	6a 00                	push   $0x0
801064cd:	68 cb 00 00 00       	push   $0xcb
801064d2:	e9 1c f3 ff ff       	jmp    801057f3 <alltraps>

801064d7 <vector204>:
801064d7:	6a 00                	push   $0x0
801064d9:	68 cc 00 00 00       	push   $0xcc
801064de:	e9 10 f3 ff ff       	jmp    801057f3 <alltraps>

801064e3 <vector205>:
801064e3:	6a 00                	push   $0x0
801064e5:	68 cd 00 00 00       	push   $0xcd
801064ea:	e9 04 f3 ff ff       	jmp    801057f3 <alltraps>

801064ef <vector206>:
801064ef:	6a 00                	push   $0x0
801064f1:	68 ce 00 00 00       	push   $0xce
801064f6:	e9 f8 f2 ff ff       	jmp    801057f3 <alltraps>

801064fb <vector207>:
801064fb:	6a 00                	push   $0x0
801064fd:	68 cf 00 00 00       	push   $0xcf
80106502:	e9 ec f2 ff ff       	jmp    801057f3 <alltraps>

80106507 <vector208>:
80106507:	6a 00                	push   $0x0
80106509:	68 d0 00 00 00       	push   $0xd0
8010650e:	e9 e0 f2 ff ff       	jmp    801057f3 <alltraps>

80106513 <vector209>:
80106513:	6a 00                	push   $0x0
80106515:	68 d1 00 00 00       	push   $0xd1
8010651a:	e9 d4 f2 ff ff       	jmp    801057f3 <alltraps>

8010651f <vector210>:
8010651f:	6a 00                	push   $0x0
80106521:	68 d2 00 00 00       	push   $0xd2
80106526:	e9 c8 f2 ff ff       	jmp    801057f3 <alltraps>

8010652b <vector211>:
8010652b:	6a 00                	push   $0x0
8010652d:	68 d3 00 00 00       	push   $0xd3
80106532:	e9 bc f2 ff ff       	jmp    801057f3 <alltraps>

80106537 <vector212>:
80106537:	6a 00                	push   $0x0
80106539:	68 d4 00 00 00       	push   $0xd4
8010653e:	e9 b0 f2 ff ff       	jmp    801057f3 <alltraps>

80106543 <vector213>:
80106543:	6a 00                	push   $0x0
80106545:	68 d5 00 00 00       	push   $0xd5
8010654a:	e9 a4 f2 ff ff       	jmp    801057f3 <alltraps>

8010654f <vector214>:
8010654f:	6a 00                	push   $0x0
80106551:	68 d6 00 00 00       	push   $0xd6
80106556:	e9 98 f2 ff ff       	jmp    801057f3 <alltraps>

8010655b <vector215>:
8010655b:	6a 00                	push   $0x0
8010655d:	68 d7 00 00 00       	push   $0xd7
80106562:	e9 8c f2 ff ff       	jmp    801057f3 <alltraps>

80106567 <vector216>:
80106567:	6a 00                	push   $0x0
80106569:	68 d8 00 00 00       	push   $0xd8
8010656e:	e9 80 f2 ff ff       	jmp    801057f3 <alltraps>

80106573 <vector217>:
80106573:	6a 00                	push   $0x0
80106575:	68 d9 00 00 00       	push   $0xd9
8010657a:	e9 74 f2 ff ff       	jmp    801057f3 <alltraps>

8010657f <vector218>:
8010657f:	6a 00                	push   $0x0
80106581:	68 da 00 00 00       	push   $0xda
80106586:	e9 68 f2 ff ff       	jmp    801057f3 <alltraps>

8010658b <vector219>:
8010658b:	6a 00                	push   $0x0
8010658d:	68 db 00 00 00       	push   $0xdb
80106592:	e9 5c f2 ff ff       	jmp    801057f3 <alltraps>

80106597 <vector220>:
80106597:	6a 00                	push   $0x0
80106599:	68 dc 00 00 00       	push   $0xdc
8010659e:	e9 50 f2 ff ff       	jmp    801057f3 <alltraps>

801065a3 <vector221>:
801065a3:	6a 00                	push   $0x0
801065a5:	68 dd 00 00 00       	push   $0xdd
801065aa:	e9 44 f2 ff ff       	jmp    801057f3 <alltraps>

801065af <vector222>:
801065af:	6a 00                	push   $0x0
801065b1:	68 de 00 00 00       	push   $0xde
801065b6:	e9 38 f2 ff ff       	jmp    801057f3 <alltraps>

801065bb <vector223>:
801065bb:	6a 00                	push   $0x0
801065bd:	68 df 00 00 00       	push   $0xdf
801065c2:	e9 2c f2 ff ff       	jmp    801057f3 <alltraps>

801065c7 <vector224>:
801065c7:	6a 00                	push   $0x0
801065c9:	68 e0 00 00 00       	push   $0xe0
801065ce:	e9 20 f2 ff ff       	jmp    801057f3 <alltraps>

801065d3 <vector225>:
801065d3:	6a 00                	push   $0x0
801065d5:	68 e1 00 00 00       	push   $0xe1
801065da:	e9 14 f2 ff ff       	jmp    801057f3 <alltraps>

801065df <vector226>:
801065df:	6a 00                	push   $0x0
801065e1:	68 e2 00 00 00       	push   $0xe2
801065e6:	e9 08 f2 ff ff       	jmp    801057f3 <alltraps>

801065eb <vector227>:
801065eb:	6a 00                	push   $0x0
801065ed:	68 e3 00 00 00       	push   $0xe3
801065f2:	e9 fc f1 ff ff       	jmp    801057f3 <alltraps>

801065f7 <vector228>:
801065f7:	6a 00                	push   $0x0
801065f9:	68 e4 00 00 00       	push   $0xe4
801065fe:	e9 f0 f1 ff ff       	jmp    801057f3 <alltraps>

80106603 <vector229>:
80106603:	6a 00                	push   $0x0
80106605:	68 e5 00 00 00       	push   $0xe5
8010660a:	e9 e4 f1 ff ff       	jmp    801057f3 <alltraps>

8010660f <vector230>:
8010660f:	6a 00                	push   $0x0
80106611:	68 e6 00 00 00       	push   $0xe6
80106616:	e9 d8 f1 ff ff       	jmp    801057f3 <alltraps>

8010661b <vector231>:
8010661b:	6a 00                	push   $0x0
8010661d:	68 e7 00 00 00       	push   $0xe7
80106622:	e9 cc f1 ff ff       	jmp    801057f3 <alltraps>

80106627 <vector232>:
80106627:	6a 00                	push   $0x0
80106629:	68 e8 00 00 00       	push   $0xe8
8010662e:	e9 c0 f1 ff ff       	jmp    801057f3 <alltraps>

80106633 <vector233>:
80106633:	6a 00                	push   $0x0
80106635:	68 e9 00 00 00       	push   $0xe9
8010663a:	e9 b4 f1 ff ff       	jmp    801057f3 <alltraps>

8010663f <vector234>:
8010663f:	6a 00                	push   $0x0
80106641:	68 ea 00 00 00       	push   $0xea
80106646:	e9 a8 f1 ff ff       	jmp    801057f3 <alltraps>

8010664b <vector235>:
8010664b:	6a 00                	push   $0x0
8010664d:	68 eb 00 00 00       	push   $0xeb
80106652:	e9 9c f1 ff ff       	jmp    801057f3 <alltraps>

80106657 <vector236>:
80106657:	6a 00                	push   $0x0
80106659:	68 ec 00 00 00       	push   $0xec
8010665e:	e9 90 f1 ff ff       	jmp    801057f3 <alltraps>

80106663 <vector237>:
80106663:	6a 00                	push   $0x0
80106665:	68 ed 00 00 00       	push   $0xed
8010666a:	e9 84 f1 ff ff       	jmp    801057f3 <alltraps>

8010666f <vector238>:
8010666f:	6a 00                	push   $0x0
80106671:	68 ee 00 00 00       	push   $0xee
80106676:	e9 78 f1 ff ff       	jmp    801057f3 <alltraps>

8010667b <vector239>:
8010667b:	6a 00                	push   $0x0
8010667d:	68 ef 00 00 00       	push   $0xef
80106682:	e9 6c f1 ff ff       	jmp    801057f3 <alltraps>

80106687 <vector240>:
80106687:	6a 00                	push   $0x0
80106689:	68 f0 00 00 00       	push   $0xf0
8010668e:	e9 60 f1 ff ff       	jmp    801057f3 <alltraps>

80106693 <vector241>:
80106693:	6a 00                	push   $0x0
80106695:	68 f1 00 00 00       	push   $0xf1
8010669a:	e9 54 f1 ff ff       	jmp    801057f3 <alltraps>

8010669f <vector242>:
8010669f:	6a 00                	push   $0x0
801066a1:	68 f2 00 00 00       	push   $0xf2
801066a6:	e9 48 f1 ff ff       	jmp    801057f3 <alltraps>

801066ab <vector243>:
801066ab:	6a 00                	push   $0x0
801066ad:	68 f3 00 00 00       	push   $0xf3
801066b2:	e9 3c f1 ff ff       	jmp    801057f3 <alltraps>

801066b7 <vector244>:
801066b7:	6a 00                	push   $0x0
801066b9:	68 f4 00 00 00       	push   $0xf4
801066be:	e9 30 f1 ff ff       	jmp    801057f3 <alltraps>

801066c3 <vector245>:
801066c3:	6a 00                	push   $0x0
801066c5:	68 f5 00 00 00       	push   $0xf5
801066ca:	e9 24 f1 ff ff       	jmp    801057f3 <alltraps>

801066cf <vector246>:
801066cf:	6a 00                	push   $0x0
801066d1:	68 f6 00 00 00       	push   $0xf6
801066d6:	e9 18 f1 ff ff       	jmp    801057f3 <alltraps>

801066db <vector247>:
801066db:	6a 00                	push   $0x0
801066dd:	68 f7 00 00 00       	push   $0xf7
801066e2:	e9 0c f1 ff ff       	jmp    801057f3 <alltraps>

801066e7 <vector248>:
801066e7:	6a 00                	push   $0x0
801066e9:	68 f8 00 00 00       	push   $0xf8
801066ee:	e9 00 f1 ff ff       	jmp    801057f3 <alltraps>

801066f3 <vector249>:
801066f3:	6a 00                	push   $0x0
801066f5:	68 f9 00 00 00       	push   $0xf9
801066fa:	e9 f4 f0 ff ff       	jmp    801057f3 <alltraps>

801066ff <vector250>:
801066ff:	6a 00                	push   $0x0
80106701:	68 fa 00 00 00       	push   $0xfa
80106706:	e9 e8 f0 ff ff       	jmp    801057f3 <alltraps>

8010670b <vector251>:
8010670b:	6a 00                	push   $0x0
8010670d:	68 fb 00 00 00       	push   $0xfb
80106712:	e9 dc f0 ff ff       	jmp    801057f3 <alltraps>

80106717 <vector252>:
80106717:	6a 00                	push   $0x0
80106719:	68 fc 00 00 00       	push   $0xfc
8010671e:	e9 d0 f0 ff ff       	jmp    801057f3 <alltraps>

80106723 <vector253>:
80106723:	6a 00                	push   $0x0
80106725:	68 fd 00 00 00       	push   $0xfd
8010672a:	e9 c4 f0 ff ff       	jmp    801057f3 <alltraps>

8010672f <vector254>:
8010672f:	6a 00                	push   $0x0
80106731:	68 fe 00 00 00       	push   $0xfe
80106736:	e9 b8 f0 ff ff       	jmp    801057f3 <alltraps>

8010673b <vector255>:
8010673b:	6a 00                	push   $0x0
8010673d:	68 ff 00 00 00       	push   $0xff
80106742:	e9 ac f0 ff ff       	jmp    801057f3 <alltraps>
80106747:	66 90                	xchg   %ax,%ax
80106749:	66 90                	xchg   %ax,%ax
8010674b:	66 90                	xchg   %ax,%ax
8010674d:	66 90                	xchg   %ax,%ax
8010674f:	90                   	nop

80106750 <walkpgdir>:
80106750:	55                   	push   %ebp
80106751:	89 e5                	mov    %esp,%ebp
80106753:	57                   	push   %edi
80106754:	56                   	push   %esi
80106755:	53                   	push   %ebx
80106756:	89 d3                	mov    %edx,%ebx
80106758:	89 d7                	mov    %edx,%edi
8010675a:	c1 eb 16             	shr    $0x16,%ebx
8010675d:	8d 34 98             	lea    (%eax,%ebx,4),%esi
80106760:	83 ec 0c             	sub    $0xc,%esp
80106763:	8b 06                	mov    (%esi),%eax
80106765:	a8 01                	test   $0x1,%al
80106767:	74 27                	je     80106790 <walkpgdir+0x40>
80106769:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010676e:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80106774:	c1 ef 0a             	shr    $0xa,%edi
80106777:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010677a:	89 fa                	mov    %edi,%edx
8010677c:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106782:	8d 04 13             	lea    (%ebx,%edx,1),%eax
80106785:	5b                   	pop    %ebx
80106786:	5e                   	pop    %esi
80106787:	5f                   	pop    %edi
80106788:	5d                   	pop    %ebp
80106789:	c3                   	ret    
8010678a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106790:	85 c9                	test   %ecx,%ecx
80106792:	74 2c                	je     801067c0 <walkpgdir+0x70>
80106794:	e8 37 bd ff ff       	call   801024d0 <kalloc>
80106799:	85 c0                	test   %eax,%eax
8010679b:	89 c3                	mov    %eax,%ebx
8010679d:	74 21                	je     801067c0 <walkpgdir+0x70>
8010679f:	83 ec 04             	sub    $0x4,%esp
801067a2:	68 00 10 00 00       	push   $0x1000
801067a7:	6a 00                	push   $0x0
801067a9:	50                   	push   %eax
801067aa:	e8 f1 dd ff ff       	call   801045a0 <memset>
801067af:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801067b5:	83 c4 10             	add    $0x10,%esp
801067b8:	83 c8 07             	or     $0x7,%eax
801067bb:	89 06                	mov    %eax,(%esi)
801067bd:	eb b5                	jmp    80106774 <walkpgdir+0x24>
801067bf:	90                   	nop
801067c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801067c3:	31 c0                	xor    %eax,%eax
801067c5:	5b                   	pop    %ebx
801067c6:	5e                   	pop    %esi
801067c7:	5f                   	pop    %edi
801067c8:	5d                   	pop    %ebp
801067c9:	c3                   	ret    
801067ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801067d0 <mappages>:
801067d0:	55                   	push   %ebp
801067d1:	89 e5                	mov    %esp,%ebp
801067d3:	57                   	push   %edi
801067d4:	56                   	push   %esi
801067d5:	53                   	push   %ebx
801067d6:	89 d3                	mov    %edx,%ebx
801067d8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801067de:	83 ec 1c             	sub    $0x1c,%esp
801067e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801067e4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
801067e8:	8b 7d 08             	mov    0x8(%ebp),%edi
801067eb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801067f0:	89 45 e0             	mov    %eax,-0x20(%ebp)
801067f3:	8b 45 0c             	mov    0xc(%ebp),%eax
801067f6:	29 df                	sub    %ebx,%edi
801067f8:	83 c8 01             	or     $0x1,%eax
801067fb:	89 45 dc             	mov    %eax,-0x24(%ebp)
801067fe:	eb 15                	jmp    80106815 <mappages+0x45>
80106800:	f6 00 01             	testb  $0x1,(%eax)
80106803:	75 45                	jne    8010684a <mappages+0x7a>
80106805:	0b 75 dc             	or     -0x24(%ebp),%esi
80106808:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
8010680b:	89 30                	mov    %esi,(%eax)
8010680d:	74 31                	je     80106840 <mappages+0x70>
8010680f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106815:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106818:	b9 01 00 00 00       	mov    $0x1,%ecx
8010681d:	89 da                	mov    %ebx,%edx
8010681f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106822:	e8 29 ff ff ff       	call   80106750 <walkpgdir>
80106827:	85 c0                	test   %eax,%eax
80106829:	75 d5                	jne    80106800 <mappages+0x30>
8010682b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010682e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106833:	5b                   	pop    %ebx
80106834:	5e                   	pop    %esi
80106835:	5f                   	pop    %edi
80106836:	5d                   	pop    %ebp
80106837:	c3                   	ret    
80106838:	90                   	nop
80106839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106840:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106843:	31 c0                	xor    %eax,%eax
80106845:	5b                   	pop    %ebx
80106846:	5e                   	pop    %esi
80106847:	5f                   	pop    %edi
80106848:	5d                   	pop    %ebp
80106849:	c3                   	ret    
8010684a:	83 ec 0c             	sub    $0xc,%esp
8010684d:	68 b4 79 10 80       	push   $0x801079b4
80106852:	e8 39 9b ff ff       	call   80100390 <panic>
80106857:	89 f6                	mov    %esi,%esi
80106859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106860 <deallocuvm.part.0>:
80106860:	55                   	push   %ebp
80106861:	89 e5                	mov    %esp,%ebp
80106863:	57                   	push   %edi
80106864:	56                   	push   %esi
80106865:	53                   	push   %ebx
80106866:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
8010686c:	89 c7                	mov    %eax,%edi
8010686e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106874:	83 ec 1c             	sub    $0x1c,%esp
80106877:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010687a:	39 d3                	cmp    %edx,%ebx
8010687c:	73 66                	jae    801068e4 <deallocuvm.part.0+0x84>
8010687e:	89 d6                	mov    %edx,%esi
80106880:	eb 3d                	jmp    801068bf <deallocuvm.part.0+0x5f>
80106882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106888:	8b 10                	mov    (%eax),%edx
8010688a:	f6 c2 01             	test   $0x1,%dl
8010688d:	74 26                	je     801068b5 <deallocuvm.part.0+0x55>
8010688f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106895:	74 58                	je     801068ef <deallocuvm.part.0+0x8f>
80106897:	83 ec 0c             	sub    $0xc,%esp
8010689a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
801068a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801068a3:	52                   	push   %edx
801068a4:	e8 77 ba ff ff       	call   80102320 <kfree>
801068a9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801068ac:	83 c4 10             	add    $0x10,%esp
801068af:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801068b5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801068bb:	39 f3                	cmp    %esi,%ebx
801068bd:	73 25                	jae    801068e4 <deallocuvm.part.0+0x84>
801068bf:	31 c9                	xor    %ecx,%ecx
801068c1:	89 da                	mov    %ebx,%edx
801068c3:	89 f8                	mov    %edi,%eax
801068c5:	e8 86 fe ff ff       	call   80106750 <walkpgdir>
801068ca:	85 c0                	test   %eax,%eax
801068cc:	75 ba                	jne    80106888 <deallocuvm.part.0+0x28>
801068ce:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
801068d4:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
801068da:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801068e0:	39 f3                	cmp    %esi,%ebx
801068e2:	72 db                	jb     801068bf <deallocuvm.part.0+0x5f>
801068e4:	8b 45 e0             	mov    -0x20(%ebp),%eax
801068e7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801068ea:	5b                   	pop    %ebx
801068eb:	5e                   	pop    %esi
801068ec:	5f                   	pop    %edi
801068ed:	5d                   	pop    %ebp
801068ee:	c3                   	ret    
801068ef:	83 ec 0c             	sub    $0xc,%esp
801068f2:	68 e6 72 10 80       	push   $0x801072e6
801068f7:	e8 94 9a ff ff       	call   80100390 <panic>
801068fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106900 <seginit>:
80106900:	55                   	push   %ebp
80106901:	89 e5                	mov    %esp,%ebp
80106903:	83 ec 18             	sub    $0x18,%esp
80106906:	e8 c5 ce ff ff       	call   801037d0 <cpuid>
8010690b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106911:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106916:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
8010691a:	c7 80 f8 27 11 80 ff 	movl   $0xffff,-0x7feed808(%eax)
80106921:	ff 00 00 
80106924:	c7 80 fc 27 11 80 00 	movl   $0xcf9a00,-0x7feed804(%eax)
8010692b:	9a cf 00 
8010692e:	c7 80 00 28 11 80 ff 	movl   $0xffff,-0x7feed800(%eax)
80106935:	ff 00 00 
80106938:	c7 80 04 28 11 80 00 	movl   $0xcf9200,-0x7feed7fc(%eax)
8010693f:	92 cf 00 
80106942:	c7 80 08 28 11 80 ff 	movl   $0xffff,-0x7feed7f8(%eax)
80106949:	ff 00 00 
8010694c:	c7 80 0c 28 11 80 00 	movl   $0xcffa00,-0x7feed7f4(%eax)
80106953:	fa cf 00 
80106956:	c7 80 10 28 11 80 ff 	movl   $0xffff,-0x7feed7f0(%eax)
8010695d:	ff 00 00 
80106960:	c7 80 14 28 11 80 00 	movl   $0xcff200,-0x7feed7ec(%eax)
80106967:	f2 cf 00 
8010696a:	05 f0 27 11 80       	add    $0x801127f0,%eax
8010696f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106973:	c1 e8 10             	shr    $0x10,%eax
80106976:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
8010697a:	8d 45 f2             	lea    -0xe(%ebp),%eax
8010697d:	0f 01 10             	lgdtl  (%eax)
80106980:	c9                   	leave  
80106981:	c3                   	ret    
80106982:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106990 <switchkvm>:
80106990:	a1 84 51 11 80       	mov    0x80115184,%eax
80106995:	55                   	push   %ebp
80106996:	89 e5                	mov    %esp,%ebp
80106998:	05 00 00 00 80       	add    $0x80000000,%eax
8010699d:	0f 22 d8             	mov    %eax,%cr3
801069a0:	5d                   	pop    %ebp
801069a1:	c3                   	ret    
801069a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801069a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801069b0 <switchuvm>:
801069b0:	55                   	push   %ebp
801069b1:	89 e5                	mov    %esp,%ebp
801069b3:	57                   	push   %edi
801069b4:	56                   	push   %esi
801069b5:	53                   	push   %ebx
801069b6:	83 ec 1c             	sub    $0x1c,%esp
801069b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801069bc:	85 db                	test   %ebx,%ebx
801069be:	0f 84 cb 00 00 00    	je     80106a8f <switchuvm+0xdf>
801069c4:	8b 43 08             	mov    0x8(%ebx),%eax
801069c7:	85 c0                	test   %eax,%eax
801069c9:	0f 84 da 00 00 00    	je     80106aa9 <switchuvm+0xf9>
801069cf:	8b 43 04             	mov    0x4(%ebx),%eax
801069d2:	85 c0                	test   %eax,%eax
801069d4:	0f 84 c2 00 00 00    	je     80106a9c <switchuvm+0xec>
801069da:	e8 01 da ff ff       	call   801043e0 <pushcli>
801069df:	e8 7c cd ff ff       	call   80103760 <mycpu>
801069e4:	89 c6                	mov    %eax,%esi
801069e6:	e8 75 cd ff ff       	call   80103760 <mycpu>
801069eb:	89 c7                	mov    %eax,%edi
801069ed:	e8 6e cd ff ff       	call   80103760 <mycpu>
801069f2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801069f5:	83 c7 08             	add    $0x8,%edi
801069f8:	e8 63 cd ff ff       	call   80103760 <mycpu>
801069fd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106a00:	83 c0 08             	add    $0x8,%eax
80106a03:	ba 67 00 00 00       	mov    $0x67,%edx
80106a08:	c1 e8 18             	shr    $0x18,%eax
80106a0b:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80106a12:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80106a19:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
80106a1f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80106a24:	83 c1 08             	add    $0x8,%ecx
80106a27:	c1 e9 10             	shr    $0x10,%ecx
80106a2a:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106a30:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106a35:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
80106a3c:	be 10 00 00 00       	mov    $0x10,%esi
80106a41:	e8 1a cd ff ff       	call   80103760 <mycpu>
80106a46:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
80106a4d:	e8 0e cd ff ff       	call   80103760 <mycpu>
80106a52:	66 89 70 10          	mov    %si,0x10(%eax)
80106a56:	8b 73 08             	mov    0x8(%ebx),%esi
80106a59:	e8 02 cd ff ff       	call   80103760 <mycpu>
80106a5e:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106a64:	89 70 0c             	mov    %esi,0xc(%eax)
80106a67:	e8 f4 cc ff ff       	call   80103760 <mycpu>
80106a6c:	66 89 78 6e          	mov    %di,0x6e(%eax)
80106a70:	b8 28 00 00 00       	mov    $0x28,%eax
80106a75:	0f 00 d8             	ltr    %ax
80106a78:	8b 43 04             	mov    0x4(%ebx),%eax
80106a7b:	05 00 00 00 80       	add    $0x80000000,%eax
80106a80:	0f 22 d8             	mov    %eax,%cr3
80106a83:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a86:	5b                   	pop    %ebx
80106a87:	5e                   	pop    %esi
80106a88:	5f                   	pop    %edi
80106a89:	5d                   	pop    %ebp
80106a8a:	e9 51 da ff ff       	jmp    801044e0 <popcli>
80106a8f:	83 ec 0c             	sub    $0xc,%esp
80106a92:	68 ba 79 10 80       	push   $0x801079ba
80106a97:	e8 f4 98 ff ff       	call   80100390 <panic>
80106a9c:	83 ec 0c             	sub    $0xc,%esp
80106a9f:	68 e5 79 10 80       	push   $0x801079e5
80106aa4:	e8 e7 98 ff ff       	call   80100390 <panic>
80106aa9:	83 ec 0c             	sub    $0xc,%esp
80106aac:	68 d0 79 10 80       	push   $0x801079d0
80106ab1:	e8 da 98 ff ff       	call   80100390 <panic>
80106ab6:	8d 76 00             	lea    0x0(%esi),%esi
80106ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106ac0 <inituvm>:
80106ac0:	55                   	push   %ebp
80106ac1:	89 e5                	mov    %esp,%ebp
80106ac3:	57                   	push   %edi
80106ac4:	56                   	push   %esi
80106ac5:	53                   	push   %ebx
80106ac6:	83 ec 1c             	sub    $0x1c,%esp
80106ac9:	8b 75 10             	mov    0x10(%ebp),%esi
80106acc:	8b 45 08             	mov    0x8(%ebp),%eax
80106acf:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106ad2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106ad8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106adb:	77 49                	ja     80106b26 <inituvm+0x66>
80106add:	e8 ee b9 ff ff       	call   801024d0 <kalloc>
80106ae2:	83 ec 04             	sub    $0x4,%esp
80106ae5:	89 c3                	mov    %eax,%ebx
80106ae7:	68 00 10 00 00       	push   $0x1000
80106aec:	6a 00                	push   $0x0
80106aee:	50                   	push   %eax
80106aef:	e8 ac da ff ff       	call   801045a0 <memset>
80106af4:	58                   	pop    %eax
80106af5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106afb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106b00:	5a                   	pop    %edx
80106b01:	6a 06                	push   $0x6
80106b03:	50                   	push   %eax
80106b04:	31 d2                	xor    %edx,%edx
80106b06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106b09:	e8 c2 fc ff ff       	call   801067d0 <mappages>
80106b0e:	89 75 10             	mov    %esi,0x10(%ebp)
80106b11:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106b14:	83 c4 10             	add    $0x10,%esp
80106b17:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106b1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b1d:	5b                   	pop    %ebx
80106b1e:	5e                   	pop    %esi
80106b1f:	5f                   	pop    %edi
80106b20:	5d                   	pop    %ebp
80106b21:	e9 2a db ff ff       	jmp    80104650 <memmove>
80106b26:	83 ec 0c             	sub    $0xc,%esp
80106b29:	68 f9 79 10 80       	push   $0x801079f9
80106b2e:	e8 5d 98 ff ff       	call   80100390 <panic>
80106b33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b40 <loaduvm>:
80106b40:	55                   	push   %ebp
80106b41:	89 e5                	mov    %esp,%ebp
80106b43:	57                   	push   %edi
80106b44:	56                   	push   %esi
80106b45:	53                   	push   %ebx
80106b46:	83 ec 0c             	sub    $0xc,%esp
80106b49:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106b50:	0f 85 91 00 00 00    	jne    80106be7 <loaduvm+0xa7>
80106b56:	8b 75 18             	mov    0x18(%ebp),%esi
80106b59:	31 db                	xor    %ebx,%ebx
80106b5b:	85 f6                	test   %esi,%esi
80106b5d:	75 1a                	jne    80106b79 <loaduvm+0x39>
80106b5f:	eb 6f                	jmp    80106bd0 <loaduvm+0x90>
80106b61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b68:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b6e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106b74:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106b77:	76 57                	jbe    80106bd0 <loaduvm+0x90>
80106b79:	8b 55 0c             	mov    0xc(%ebp),%edx
80106b7c:	8b 45 08             	mov    0x8(%ebp),%eax
80106b7f:	31 c9                	xor    %ecx,%ecx
80106b81:	01 da                	add    %ebx,%edx
80106b83:	e8 c8 fb ff ff       	call   80106750 <walkpgdir>
80106b88:	85 c0                	test   %eax,%eax
80106b8a:	74 4e                	je     80106bda <loaduvm+0x9a>
80106b8c:	8b 00                	mov    (%eax),%eax
80106b8e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106b91:	bf 00 10 00 00       	mov    $0x1000,%edi
80106b96:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106b9b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106ba1:	0f 46 fe             	cmovbe %esi,%edi
80106ba4:	01 d9                	add    %ebx,%ecx
80106ba6:	05 00 00 00 80       	add    $0x80000000,%eax
80106bab:	57                   	push   %edi
80106bac:	51                   	push   %ecx
80106bad:	50                   	push   %eax
80106bae:	ff 75 10             	pushl  0x10(%ebp)
80106bb1:	e8 ba ad ff ff       	call   80101970 <readi>
80106bb6:	83 c4 10             	add    $0x10,%esp
80106bb9:	39 f8                	cmp    %edi,%eax
80106bbb:	74 ab                	je     80106b68 <loaduvm+0x28>
80106bbd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106bc5:	5b                   	pop    %ebx
80106bc6:	5e                   	pop    %esi
80106bc7:	5f                   	pop    %edi
80106bc8:	5d                   	pop    %ebp
80106bc9:	c3                   	ret    
80106bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106bd0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bd3:	31 c0                	xor    %eax,%eax
80106bd5:	5b                   	pop    %ebx
80106bd6:	5e                   	pop    %esi
80106bd7:	5f                   	pop    %edi
80106bd8:	5d                   	pop    %ebp
80106bd9:	c3                   	ret    
80106bda:	83 ec 0c             	sub    $0xc,%esp
80106bdd:	68 13 7a 10 80       	push   $0x80107a13
80106be2:	e8 a9 97 ff ff       	call   80100390 <panic>
80106be7:	83 ec 0c             	sub    $0xc,%esp
80106bea:	68 b4 7a 10 80       	push   $0x80107ab4
80106bef:	e8 9c 97 ff ff       	call   80100390 <panic>
80106bf4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106bfa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106c00 <allocuvm>:
80106c00:	55                   	push   %ebp
80106c01:	89 e5                	mov    %esp,%ebp
80106c03:	57                   	push   %edi
80106c04:	56                   	push   %esi
80106c05:	53                   	push   %ebx
80106c06:	83 ec 1c             	sub    $0x1c,%esp
80106c09:	8b 7d 10             	mov    0x10(%ebp),%edi
80106c0c:	85 ff                	test   %edi,%edi
80106c0e:	0f 88 8e 00 00 00    	js     80106ca2 <allocuvm+0xa2>
80106c14:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106c17:	0f 82 93 00 00 00    	jb     80106cb0 <allocuvm+0xb0>
80106c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
80106c20:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106c26:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106c2c:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106c2f:	0f 86 7e 00 00 00    	jbe    80106cb3 <allocuvm+0xb3>
80106c35:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106c38:	8b 7d 08             	mov    0x8(%ebp),%edi
80106c3b:	eb 42                	jmp    80106c7f <allocuvm+0x7f>
80106c3d:	8d 76 00             	lea    0x0(%esi),%esi
80106c40:	83 ec 04             	sub    $0x4,%esp
80106c43:	68 00 10 00 00       	push   $0x1000
80106c48:	6a 00                	push   $0x0
80106c4a:	50                   	push   %eax
80106c4b:	e8 50 d9 ff ff       	call   801045a0 <memset>
80106c50:	58                   	pop    %eax
80106c51:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106c57:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106c5c:	5a                   	pop    %edx
80106c5d:	6a 06                	push   $0x6
80106c5f:	50                   	push   %eax
80106c60:	89 da                	mov    %ebx,%edx
80106c62:	89 f8                	mov    %edi,%eax
80106c64:	e8 67 fb ff ff       	call   801067d0 <mappages>
80106c69:	83 c4 10             	add    $0x10,%esp
80106c6c:	85 c0                	test   %eax,%eax
80106c6e:	78 50                	js     80106cc0 <allocuvm+0xc0>
80106c70:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c76:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106c79:	0f 86 81 00 00 00    	jbe    80106d00 <allocuvm+0x100>
80106c7f:	e8 4c b8 ff ff       	call   801024d0 <kalloc>
80106c84:	85 c0                	test   %eax,%eax
80106c86:	89 c6                	mov    %eax,%esi
80106c88:	75 b6                	jne    80106c40 <allocuvm+0x40>
80106c8a:	83 ec 0c             	sub    $0xc,%esp
80106c8d:	68 31 7a 10 80       	push   $0x80107a31
80106c92:	e8 c9 99 ff ff       	call   80100660 <cprintf>
80106c97:	83 c4 10             	add    $0x10,%esp
80106c9a:	8b 45 0c             	mov    0xc(%ebp),%eax
80106c9d:	39 45 10             	cmp    %eax,0x10(%ebp)
80106ca0:	77 6e                	ja     80106d10 <allocuvm+0x110>
80106ca2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ca5:	31 ff                	xor    %edi,%edi
80106ca7:	89 f8                	mov    %edi,%eax
80106ca9:	5b                   	pop    %ebx
80106caa:	5e                   	pop    %esi
80106cab:	5f                   	pop    %edi
80106cac:	5d                   	pop    %ebp
80106cad:	c3                   	ret    
80106cae:	66 90                	xchg   %ax,%ax
80106cb0:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106cb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cb6:	89 f8                	mov    %edi,%eax
80106cb8:	5b                   	pop    %ebx
80106cb9:	5e                   	pop    %esi
80106cba:	5f                   	pop    %edi
80106cbb:	5d                   	pop    %ebp
80106cbc:	c3                   	ret    
80106cbd:	8d 76 00             	lea    0x0(%esi),%esi
80106cc0:	83 ec 0c             	sub    $0xc,%esp
80106cc3:	68 49 7a 10 80       	push   $0x80107a49
80106cc8:	e8 93 99 ff ff       	call   80100660 <cprintf>
80106ccd:	83 c4 10             	add    $0x10,%esp
80106cd0:	8b 45 0c             	mov    0xc(%ebp),%eax
80106cd3:	39 45 10             	cmp    %eax,0x10(%ebp)
80106cd6:	76 0d                	jbe    80106ce5 <allocuvm+0xe5>
80106cd8:	89 c1                	mov    %eax,%ecx
80106cda:	8b 55 10             	mov    0x10(%ebp),%edx
80106cdd:	8b 45 08             	mov    0x8(%ebp),%eax
80106ce0:	e8 7b fb ff ff       	call   80106860 <deallocuvm.part.0>
80106ce5:	83 ec 0c             	sub    $0xc,%esp
80106ce8:	31 ff                	xor    %edi,%edi
80106cea:	56                   	push   %esi
80106ceb:	e8 30 b6 ff ff       	call   80102320 <kfree>
80106cf0:	83 c4 10             	add    $0x10,%esp
80106cf3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106cf6:	89 f8                	mov    %edi,%eax
80106cf8:	5b                   	pop    %ebx
80106cf9:	5e                   	pop    %esi
80106cfa:	5f                   	pop    %edi
80106cfb:	5d                   	pop    %ebp
80106cfc:	c3                   	ret    
80106cfd:	8d 76 00             	lea    0x0(%esi),%esi
80106d00:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80106d03:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d06:	5b                   	pop    %ebx
80106d07:	89 f8                	mov    %edi,%eax
80106d09:	5e                   	pop    %esi
80106d0a:	5f                   	pop    %edi
80106d0b:	5d                   	pop    %ebp
80106d0c:	c3                   	ret    
80106d0d:	8d 76 00             	lea    0x0(%esi),%esi
80106d10:	89 c1                	mov    %eax,%ecx
80106d12:	8b 55 10             	mov    0x10(%ebp),%edx
80106d15:	8b 45 08             	mov    0x8(%ebp),%eax
80106d18:	31 ff                	xor    %edi,%edi
80106d1a:	e8 41 fb ff ff       	call   80106860 <deallocuvm.part.0>
80106d1f:	eb 92                	jmp    80106cb3 <allocuvm+0xb3>
80106d21:	eb 0d                	jmp    80106d30 <deallocuvm>
80106d23:	90                   	nop
80106d24:	90                   	nop
80106d25:	90                   	nop
80106d26:	90                   	nop
80106d27:	90                   	nop
80106d28:	90                   	nop
80106d29:	90                   	nop
80106d2a:	90                   	nop
80106d2b:	90                   	nop
80106d2c:	90                   	nop
80106d2d:	90                   	nop
80106d2e:	90                   	nop
80106d2f:	90                   	nop

80106d30 <deallocuvm>:
80106d30:	55                   	push   %ebp
80106d31:	89 e5                	mov    %esp,%ebp
80106d33:	8b 55 0c             	mov    0xc(%ebp),%edx
80106d36:	8b 4d 10             	mov    0x10(%ebp),%ecx
80106d39:	8b 45 08             	mov    0x8(%ebp),%eax
80106d3c:	39 d1                	cmp    %edx,%ecx
80106d3e:	73 10                	jae    80106d50 <deallocuvm+0x20>
80106d40:	5d                   	pop    %ebp
80106d41:	e9 1a fb ff ff       	jmp    80106860 <deallocuvm.part.0>
80106d46:	8d 76 00             	lea    0x0(%esi),%esi
80106d49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106d50:	89 d0                	mov    %edx,%eax
80106d52:	5d                   	pop    %ebp
80106d53:	c3                   	ret    
80106d54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106d5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106d60 <freevm>:
80106d60:	55                   	push   %ebp
80106d61:	89 e5                	mov    %esp,%ebp
80106d63:	57                   	push   %edi
80106d64:	56                   	push   %esi
80106d65:	53                   	push   %ebx
80106d66:	83 ec 0c             	sub    $0xc,%esp
80106d69:	8b 75 08             	mov    0x8(%ebp),%esi
80106d6c:	85 f6                	test   %esi,%esi
80106d6e:	74 59                	je     80106dc9 <freevm+0x69>
80106d70:	31 c9                	xor    %ecx,%ecx
80106d72:	ba 00 00 00 80       	mov    $0x80000000,%edx
80106d77:	89 f0                	mov    %esi,%eax
80106d79:	e8 e2 fa ff ff       	call   80106860 <deallocuvm.part.0>
80106d7e:	89 f3                	mov    %esi,%ebx
80106d80:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80106d86:	eb 0f                	jmp    80106d97 <freevm+0x37>
80106d88:	90                   	nop
80106d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106d90:	83 c3 04             	add    $0x4,%ebx
80106d93:	39 fb                	cmp    %edi,%ebx
80106d95:	74 23                	je     80106dba <freevm+0x5a>
80106d97:	8b 03                	mov    (%ebx),%eax
80106d99:	a8 01                	test   $0x1,%al
80106d9b:	74 f3                	je     80106d90 <freevm+0x30>
80106d9d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106da2:	83 ec 0c             	sub    $0xc,%esp
80106da5:	83 c3 04             	add    $0x4,%ebx
80106da8:	05 00 00 00 80       	add    $0x80000000,%eax
80106dad:	50                   	push   %eax
80106dae:	e8 6d b5 ff ff       	call   80102320 <kfree>
80106db3:	83 c4 10             	add    $0x10,%esp
80106db6:	39 fb                	cmp    %edi,%ebx
80106db8:	75 dd                	jne    80106d97 <freevm+0x37>
80106dba:	89 75 08             	mov    %esi,0x8(%ebp)
80106dbd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106dc0:	5b                   	pop    %ebx
80106dc1:	5e                   	pop    %esi
80106dc2:	5f                   	pop    %edi
80106dc3:	5d                   	pop    %ebp
80106dc4:	e9 57 b5 ff ff       	jmp    80102320 <kfree>
80106dc9:	83 ec 0c             	sub    $0xc,%esp
80106dcc:	68 65 7a 10 80       	push   $0x80107a65
80106dd1:	e8 ba 95 ff ff       	call   80100390 <panic>
80106dd6:	8d 76 00             	lea    0x0(%esi),%esi
80106dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106de0 <setupkvm>:
80106de0:	55                   	push   %ebp
80106de1:	89 e5                	mov    %esp,%ebp
80106de3:	56                   	push   %esi
80106de4:	53                   	push   %ebx
80106de5:	e8 e6 b6 ff ff       	call   801024d0 <kalloc>
80106dea:	85 c0                	test   %eax,%eax
80106dec:	89 c6                	mov    %eax,%esi
80106dee:	74 42                	je     80106e32 <setupkvm+0x52>
80106df0:	83 ec 04             	sub    $0x4,%esp
80106df3:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
80106df8:	68 00 10 00 00       	push   $0x1000
80106dfd:	6a 00                	push   $0x0
80106dff:	50                   	push   %eax
80106e00:	e8 9b d7 ff ff       	call   801045a0 <memset>
80106e05:	83 c4 10             	add    $0x10,%esp
80106e08:	8b 43 04             	mov    0x4(%ebx),%eax
80106e0b:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106e0e:	83 ec 08             	sub    $0x8,%esp
80106e11:	8b 13                	mov    (%ebx),%edx
80106e13:	ff 73 0c             	pushl  0xc(%ebx)
80106e16:	50                   	push   %eax
80106e17:	29 c1                	sub    %eax,%ecx
80106e19:	89 f0                	mov    %esi,%eax
80106e1b:	e8 b0 f9 ff ff       	call   801067d0 <mappages>
80106e20:	83 c4 10             	add    $0x10,%esp
80106e23:	85 c0                	test   %eax,%eax
80106e25:	78 19                	js     80106e40 <setupkvm+0x60>
80106e27:	83 c3 10             	add    $0x10,%ebx
80106e2a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106e30:	75 d6                	jne    80106e08 <setupkvm+0x28>
80106e32:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106e35:	89 f0                	mov    %esi,%eax
80106e37:	5b                   	pop    %ebx
80106e38:	5e                   	pop    %esi
80106e39:	5d                   	pop    %ebp
80106e3a:	c3                   	ret    
80106e3b:	90                   	nop
80106e3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106e40:	83 ec 0c             	sub    $0xc,%esp
80106e43:	56                   	push   %esi
80106e44:	31 f6                	xor    %esi,%esi
80106e46:	e8 15 ff ff ff       	call   80106d60 <freevm>
80106e4b:	83 c4 10             	add    $0x10,%esp
80106e4e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106e51:	89 f0                	mov    %esi,%eax
80106e53:	5b                   	pop    %ebx
80106e54:	5e                   	pop    %esi
80106e55:	5d                   	pop    %ebp
80106e56:	c3                   	ret    
80106e57:	89 f6                	mov    %esi,%esi
80106e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e60 <kvmalloc>:
80106e60:	55                   	push   %ebp
80106e61:	89 e5                	mov    %esp,%ebp
80106e63:	83 ec 08             	sub    $0x8,%esp
80106e66:	e8 75 ff ff ff       	call   80106de0 <setupkvm>
80106e6b:	a3 84 51 11 80       	mov    %eax,0x80115184
80106e70:	05 00 00 00 80       	add    $0x80000000,%eax
80106e75:	0f 22 d8             	mov    %eax,%cr3
80106e78:	c9                   	leave  
80106e79:	c3                   	ret    
80106e7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106e80 <clearpteu>:
80106e80:	55                   	push   %ebp
80106e81:	31 c9                	xor    %ecx,%ecx
80106e83:	89 e5                	mov    %esp,%ebp
80106e85:	83 ec 08             	sub    $0x8,%esp
80106e88:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e8b:	8b 45 08             	mov    0x8(%ebp),%eax
80106e8e:	e8 bd f8 ff ff       	call   80106750 <walkpgdir>
80106e93:	85 c0                	test   %eax,%eax
80106e95:	74 05                	je     80106e9c <clearpteu+0x1c>
80106e97:	83 20 fb             	andl   $0xfffffffb,(%eax)
80106e9a:	c9                   	leave  
80106e9b:	c3                   	ret    
80106e9c:	83 ec 0c             	sub    $0xc,%esp
80106e9f:	68 76 7a 10 80       	push   $0x80107a76
80106ea4:	e8 e7 94 ff ff       	call   80100390 <panic>
80106ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106eb0 <copyuvm>:
80106eb0:	55                   	push   %ebp
80106eb1:	89 e5                	mov    %esp,%ebp
80106eb3:	57                   	push   %edi
80106eb4:	56                   	push   %esi
80106eb5:	53                   	push   %ebx
80106eb6:	83 ec 1c             	sub    $0x1c,%esp
80106eb9:	e8 22 ff ff ff       	call   80106de0 <setupkvm>
80106ebe:	85 c0                	test   %eax,%eax
80106ec0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106ec3:	0f 84 a0 00 00 00    	je     80106f69 <copyuvm+0xb9>
80106ec9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80106ecc:	85 c9                	test   %ecx,%ecx
80106ece:	0f 84 95 00 00 00    	je     80106f69 <copyuvm+0xb9>
80106ed4:	31 f6                	xor    %esi,%esi
80106ed6:	eb 4e                	jmp    80106f26 <copyuvm+0x76>
80106ed8:	90                   	nop
80106ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ee0:	83 ec 04             	sub    $0x4,%esp
80106ee3:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80106ee9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106eec:	68 00 10 00 00       	push   $0x1000
80106ef1:	57                   	push   %edi
80106ef2:	50                   	push   %eax
80106ef3:	e8 58 d7 ff ff       	call   80104650 <memmove>
80106ef8:	58                   	pop    %eax
80106ef9:	5a                   	pop    %edx
80106efa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106efd:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106f00:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106f05:	53                   	push   %ebx
80106f06:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106f0c:	52                   	push   %edx
80106f0d:	89 f2                	mov    %esi,%edx
80106f0f:	e8 bc f8 ff ff       	call   801067d0 <mappages>
80106f14:	83 c4 10             	add    $0x10,%esp
80106f17:	85 c0                	test   %eax,%eax
80106f19:	78 39                	js     80106f54 <copyuvm+0xa4>
80106f1b:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106f21:	39 75 0c             	cmp    %esi,0xc(%ebp)
80106f24:	76 43                	jbe    80106f69 <copyuvm+0xb9>
80106f26:	8b 45 08             	mov    0x8(%ebp),%eax
80106f29:	31 c9                	xor    %ecx,%ecx
80106f2b:	89 f2                	mov    %esi,%edx
80106f2d:	e8 1e f8 ff ff       	call   80106750 <walkpgdir>
80106f32:	85 c0                	test   %eax,%eax
80106f34:	74 3e                	je     80106f74 <copyuvm+0xc4>
80106f36:	8b 18                	mov    (%eax),%ebx
80106f38:	f6 c3 01             	test   $0x1,%bl
80106f3b:	74 44                	je     80106f81 <copyuvm+0xd1>
80106f3d:	89 df                	mov    %ebx,%edi
80106f3f:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80106f45:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80106f4b:	e8 80 b5 ff ff       	call   801024d0 <kalloc>
80106f50:	85 c0                	test   %eax,%eax
80106f52:	75 8c                	jne    80106ee0 <copyuvm+0x30>
80106f54:	83 ec 0c             	sub    $0xc,%esp
80106f57:	ff 75 e0             	pushl  -0x20(%ebp)
80106f5a:	e8 01 fe ff ff       	call   80106d60 <freevm>
80106f5f:	83 c4 10             	add    $0x10,%esp
80106f62:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80106f69:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106f6c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f6f:	5b                   	pop    %ebx
80106f70:	5e                   	pop    %esi
80106f71:	5f                   	pop    %edi
80106f72:	5d                   	pop    %ebp
80106f73:	c3                   	ret    
80106f74:	83 ec 0c             	sub    $0xc,%esp
80106f77:	68 80 7a 10 80       	push   $0x80107a80
80106f7c:	e8 0f 94 ff ff       	call   80100390 <panic>
80106f81:	83 ec 0c             	sub    $0xc,%esp
80106f84:	68 9a 7a 10 80       	push   $0x80107a9a
80106f89:	e8 02 94 ff ff       	call   80100390 <panic>
80106f8e:	66 90                	xchg   %ax,%ax

80106f90 <uva2ka>:
80106f90:	55                   	push   %ebp
80106f91:	31 c9                	xor    %ecx,%ecx
80106f93:	89 e5                	mov    %esp,%ebp
80106f95:	83 ec 08             	sub    $0x8,%esp
80106f98:	8b 55 0c             	mov    0xc(%ebp),%edx
80106f9b:	8b 45 08             	mov    0x8(%ebp),%eax
80106f9e:	e8 ad f7 ff ff       	call   80106750 <walkpgdir>
80106fa3:	8b 00                	mov    (%eax),%eax
80106fa5:	c9                   	leave  
80106fa6:	89 c2                	mov    %eax,%edx
80106fa8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106fad:	83 e2 05             	and    $0x5,%edx
80106fb0:	05 00 00 00 80       	add    $0x80000000,%eax
80106fb5:	83 fa 05             	cmp    $0x5,%edx
80106fb8:	ba 00 00 00 00       	mov    $0x0,%edx
80106fbd:	0f 45 c2             	cmovne %edx,%eax
80106fc0:	c3                   	ret    
80106fc1:	eb 0d                	jmp    80106fd0 <copyout>
80106fc3:	90                   	nop
80106fc4:	90                   	nop
80106fc5:	90                   	nop
80106fc6:	90                   	nop
80106fc7:	90                   	nop
80106fc8:	90                   	nop
80106fc9:	90                   	nop
80106fca:	90                   	nop
80106fcb:	90                   	nop
80106fcc:	90                   	nop
80106fcd:	90                   	nop
80106fce:	90                   	nop
80106fcf:	90                   	nop

80106fd0 <copyout>:
80106fd0:	55                   	push   %ebp
80106fd1:	89 e5                	mov    %esp,%ebp
80106fd3:	57                   	push   %edi
80106fd4:	56                   	push   %esi
80106fd5:	53                   	push   %ebx
80106fd6:	83 ec 1c             	sub    $0x1c,%esp
80106fd9:	8b 5d 14             	mov    0x14(%ebp),%ebx
80106fdc:	8b 55 0c             	mov    0xc(%ebp),%edx
80106fdf:	8b 7d 10             	mov    0x10(%ebp),%edi
80106fe2:	85 db                	test   %ebx,%ebx
80106fe4:	75 40                	jne    80107026 <copyout+0x56>
80106fe6:	eb 70                	jmp    80107058 <copyout+0x88>
80106fe8:	90                   	nop
80106fe9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ff0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80106ff3:	89 f1                	mov    %esi,%ecx
80106ff5:	29 d1                	sub    %edx,%ecx
80106ff7:	81 c1 00 10 00 00    	add    $0x1000,%ecx
80106ffd:	39 d9                	cmp    %ebx,%ecx
80106fff:	0f 47 cb             	cmova  %ebx,%ecx
80107002:	29 f2                	sub    %esi,%edx
80107004:	83 ec 04             	sub    $0x4,%esp
80107007:	01 d0                	add    %edx,%eax
80107009:	51                   	push   %ecx
8010700a:	57                   	push   %edi
8010700b:	50                   	push   %eax
8010700c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010700f:	e8 3c d6 ff ff       	call   80104650 <memmove>
80107014:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80107017:	83 c4 10             	add    $0x10,%esp
8010701a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
80107020:	01 cf                	add    %ecx,%edi
80107022:	29 cb                	sub    %ecx,%ebx
80107024:	74 32                	je     80107058 <copyout+0x88>
80107026:	89 d6                	mov    %edx,%esi
80107028:	83 ec 08             	sub    $0x8,%esp
8010702b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010702e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80107034:	56                   	push   %esi
80107035:	ff 75 08             	pushl  0x8(%ebp)
80107038:	e8 53 ff ff ff       	call   80106f90 <uva2ka>
8010703d:	83 c4 10             	add    $0x10,%esp
80107040:	85 c0                	test   %eax,%eax
80107042:	75 ac                	jne    80106ff0 <copyout+0x20>
80107044:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107047:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010704c:	5b                   	pop    %ebx
8010704d:	5e                   	pop    %esi
8010704e:	5f                   	pop    %edi
8010704f:	5d                   	pop    %ebp
80107050:	c3                   	ret    
80107051:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107058:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010705b:	31 c0                	xor    %eax,%eax
8010705d:	5b                   	pop    %ebx
8010705e:	5e                   	pop    %esi
8010705f:	5f                   	pop    %edi
80107060:	5d                   	pop    %ebp
80107061:	c3                   	ret    
