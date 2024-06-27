Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E361A702
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719466546; cv=fail; b=kBtQx0bC8nY1XKGdfO6N3AS9fbYvT0+TsUevqkwJl9FPbJRbnegr4HEurXyHyOFSfOOqVwK2qnwvMpUqcuceaYuZ0KMN8o+O/fFETZj6Mg/nKLyYgsbBwlHk4dE8+E9pVqQgaNYg2fJHopxBVMy8Ah52fSotQSYRRAWjgGPBgn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719466546; c=relaxed/simple;
	bh=lk1xEeDdHW/fuWJ9oR5vPg8uPG738U6bAuuDKtrrNHI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gCJfty7J/qcPP5qRrN9GyScWi06e5yCkHFcVg8dHyfT2mr7Aq8+eFkCPFE019mXIy0qVD0Vseg4HQPLuX6tLgYVDcM2IamSrVW0MjfFBJHhfPRRd9gpwlQTwWpcOBRn+S9j2Sr0JD4kyNvVNayPBdDcBbjC6XjcRbHGkGImdtmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kt6uqfFh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=p0IiPUEf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kt6uqfFh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="p0IiPUEf"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QLMUHO006680
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=tXG4Bbk6IFCr6O
	uIxyajMaWbQRtixA008kcHFRDCSTo=; b=kt6uqfFhTRnTomIv6RI1PjDq630gnO
	akmaD+/csjpauMFanVf1Z6nEQ0NbYpbOJ7UDL7I1l61KihFdY4zrAE644dnEou35
	ceaMj0aOBD2KsMrC4czXMMWmo91pW+vRtZvOUZcjaUaQduFlauUlK0WmRFudLBfz
	Iq1Mg/OLCIHVWbNGg+hAVabeCaeBJEwB9HaAfi1JoHy2REzfXA0TeWtvue+Y9r/z
	JTzIOpXncsVerVgtDyUlHTVbA3rBJzK6u4qMJCvB3E0HCckv5q14myqbzIsRt26Z
	M+hzJmQsnJDbAQlA/j0/7qseIr2mO+vAPlIKvWfOqsZ6mfnY4gfOcUTw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 400ttn8hyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:44 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45R4GiiV017791
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:43 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn29v7au-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 27 Jun 2024 05:35:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PmZsJC6NLTR12Q5EVplwGY5NXWofCdTl62kkYxi0Mh+mEgc2QP+XDvsWIhUd28ZapOKeT9zH2OSrFOStEAx7J02VFNY5bIN42ndkkXTSfXGtEa5KDGwymdHVlMTRYXE1RuBDPQZuEZYXUZBQVpRvfk/672nvjaxsMkuKIo4eDhtJ3DOO+J1AkiEL3JfXefEyVCV3+yuxmbbb/kcmKkS97IS4F5XEO7o40b+VwWalcXvowLNvjeLIn2DUn/+B2Vi7H1WPEgVsQwMX3It+eWreD8bh9i+N3D4Rur+CdUxWNKVxWh4oLwQFwUGNJriX4AO6J1RYDitwmP4cdpF2gAfA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXG4Bbk6IFCr6OuIxyajMaWbQRtixA008kcHFRDCSTo=;
 b=OMIVC8VqUApQ1Cyu39qV0fntPM7JMN4V0Si8amlWrjcvA1mvkEzIs95qqwbweEYpYrJu43U5+/U2QfQ0K6GV7GTk3QEQXFyhmGepMfOR++a1OH2ZOcGRfEyd39WP1a/aDBcMqjUPUeMlW70s/D3RUONq0vOMQOhdheBv3NP6hzXDWYjOlXs3bVN10Kjppr3i/7uhMS+DEJGZGL+HmKR8vhb67Uw7sKzNYiA4eEbnjB9mT6ZC/gcCxoNFzIo7lK8ogAjYKUKMYsKxPXYjzF+zX+QXbDHZ65OkLJa6IG+tHY07xfK4xzFFZHnonqR0H7vrvUtxyauk8IBaAaCWihDiWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXG4Bbk6IFCr6OuIxyajMaWbQRtixA008kcHFRDCSTo=;
 b=p0IiPUEf+bR54i8RdHZRIL+0hy08ssxb+ShOZ+KVALuc0MHJiOvwZa2d4/sHWWOsMUNsYUBr1FfszcmpjF+gv45pI24enLNABjhy9fE8hwUVTJGaZH3jnVYS8+vTPFOKn9ypvA0zXCHAKFj3FrZSjlMrURYcK1llos5/qhh1xBk=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7400.namprd10.prod.outlook.com (2603:10b6:8:138::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 05:35:39 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 05:35:39 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 16/38] Move dt_probe_clause_t to be available outside of dt_probe.c
Date: Thu, 27 Jun 2024 01:34:33 -0400
Message-Id: <20240627053455.21567-17-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240627053455.21567-1-eugene.loh@oracle.com>
References: <20240627053455.21567-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::15) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 063d1e8f-1fb2-42d8-0d10-08dc966afa88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zXkEwiiGgi4b4udhf27vO9O8HOB1LdMMI3saYzXnTLHhSdRweIrwSuHDR9UY?=
 =?us-ascii?Q?oc7xYM3geR8gF1E19vT1CaAgJ/x1umRPi6zEIHqIROs+oykR2eJJhwsAST/o?=
 =?us-ascii?Q?OsgfrW1AkDl8j6KpPRHLYtBQnVLlQ4JNOjVmBk/lSg0rHSAKg2MbTEJdyRfc?=
 =?us-ascii?Q?HYyW7pZz/geUiMLIuRPhI7T8mnnzU2OrazexS4ymYWUv2V7rJQeita4KDSLd?=
 =?us-ascii?Q?L12LvGcmSVjeSYsqm0Nm+LTT9x0ucj/DrbNuYunIdUGLFuiklADCExpG9TY1?=
 =?us-ascii?Q?7jwC370v3ov3v9gVMgZ25HvCPetwJEtQoFgPcRtuJdJ/zsnCPeeeP5S1o0Zl?=
 =?us-ascii?Q?V+qBzGg34WTvsIjVXvWdv8HwvKpS+mK6lnWgANyvlPJWmJ33T/SZQ5EWZrt0?=
 =?us-ascii?Q?A+bdKSSwkv3SZD3GbQJj+4WrDhbBsY+e8YagefUVX+CSlE8azu3VvOrjSkC8?=
 =?us-ascii?Q?A+A4z8s72F6sAZn5RcgdBsUJl8V7S7s5+e96c0FdDbYU+Ksq27k3Q0zj1/ft?=
 =?us-ascii?Q?ZaftYNlSK1vSMlfpbK7Bbe2PznRRx8nvpEHaCcD2kjhPaoD3r7CeNIT4qe/B?=
 =?us-ascii?Q?Q/iWs08H0uoXs96O/ITlwNOhOdtjOg/kWCRB9Xy8tp8txAcuiXeXKALfHZlb?=
 =?us-ascii?Q?+UEtfxb9kpQL2mZm2pBCJU+HfJGZCeAqbUHFkkVcWRIQVuUlsI/nzDESqVxo?=
 =?us-ascii?Q?GUtXBdQJ155BxXSdHhOrBYaN0j9IAiXuP3NJQZYgQCcLJI0s2k9pPDEqHEdR?=
 =?us-ascii?Q?79uChM+jxcDbKR9/g3U13KqfdqPhUTAh+HqbBO4YmEXlfQUlUrcunEJlhGQd?=
 =?us-ascii?Q?FUZ+iVFvTwHpsbjv7w2Cse+ex41a4hrUo0glCjrYXLak5H793Kzs2aPG+Tt1?=
 =?us-ascii?Q?4agsgPGFzIDzynX7HSw12dkXysZTCj1zgNaVrwL4jL850nUj2RFNL44ok4Lm?=
 =?us-ascii?Q?8VHqDf0Fs4uoc9lD0ARx4sF8lzNER5sBwOx7lM9FDWZhsOkJhH4FCaTUxGtY?=
 =?us-ascii?Q?uSe4utXpVu9rD1azDf5fyRoKR3M/zFcQp0jAWCjzy0l4CqdSnG+UnhgR7BLJ?=
 =?us-ascii?Q?JsGEnw7XZIOZREJuMbtdo9006tP2Ba8hjsNed4IFYuePIK9fkitfUwQ20v5Q?=
 =?us-ascii?Q?H3ikOyxDWKj8oN3dLbb9UTuyQCZ5dcHCFmgi4OJhh8lV0icvuW7rXTttIP44?=
 =?us-ascii?Q?kXlptLlM92GyaZNxojGuvyuYrfJrO1zfqSdjsC3TNwIbNAtzbzNCMFGZhpKo?=
 =?us-ascii?Q?h7SLtCasLQFNeYCnWAvhJV23LCc2rCPXDvqtUqFE7L3Ouchy0cEQEe6JiVeE?=
 =?us-ascii?Q?Aum9B+obP4i5z5FzQI/euArKJw5UzrL1a0CwJddPKBl5yw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qwpi3yjGoZq1fECF0ZfkN1zr2+d3aN2elqsNfhGfpeQkhmXhjMHO9U+1m7WK?=
 =?us-ascii?Q?Nuz4DXmmUfB2mzhJ7CNtwgrknnZw0kCCH+5Id/pvxnqVwvmEcAP0ijakms7J?=
 =?us-ascii?Q?PyYxkJxwNgHM+cUggqq0FBbJapiPhJhKLgj/FT5gs5LKOgA03WPDcaYWJ0LI?=
 =?us-ascii?Q?uALdFAPQRF5jqZcsk9oUvXs32fp/kt7UP0WdYOfQxQx9NIMVjWyj1BTvdgDx?=
 =?us-ascii?Q?8Evva1OfaUZTFzJyCuREWcvSFnTDT3+OCc3jwJM4yYkJk6MXzfiaLUur1t6V?=
 =?us-ascii?Q?fGcz9N/GAnPDfJ4wU52cB5+2OBV7MbRDU4Wd5Rx02fQtYlRANeLYUlkxQIca?=
 =?us-ascii?Q?8YGDbiQX+nAMJEPXk7RV6w9xNnGahYcGcikjcWqVaGEEWobcxWrCiGhBGLnK?=
 =?us-ascii?Q?PKSaDAukNco3plJ2eUPOz2H+x5iNJhzW3kgl/6D43rFcN13MrVGtt81aBZJ4?=
 =?us-ascii?Q?RJxWopvUZxFb5mTNAZmWhEeDKPeShtjiCr8ZrQrnBQTilL6tz8ylguK7+mZj?=
 =?us-ascii?Q?6YqimJbVMM8VP029oPAkX43qOXCJK7oyZP+y06+pqqu2kIIYir1R37/64z4Z?=
 =?us-ascii?Q?oKnRr4Dp4WnBzZjjg4GtIW52+oE27tFWZCHiZ76yYXAXfBy/6l+OFMA0Q3LS?=
 =?us-ascii?Q?H8QAqroKeEpu1pFhWbVSp1PD8d3YmsXyDfoMWNzOBMdpmLXL0vk0VK0HJHjF?=
 =?us-ascii?Q?VxxlayQNs8g/+lSiIPsbq+66+Fxa3C7+r/IuHbdH9nNZt/rt/+B6Ogzwt0bY?=
 =?us-ascii?Q?Jw+H4RGBKlWMMD0kOumZeuCAUws3w/5miyvXzsA05PAUEhUJ5UvaAjpR9sjv?=
 =?us-ascii?Q?1XsfecrWqWyplF1HB0jcZQGv3av1WPpgPHweBzoWn0Up6VvCVtWVVUkdVXGk?=
 =?us-ascii?Q?EUJ8MNTPYrDhCfHUI5LkM/7S348iVYmo36Sb4Hsq4Tg+wESuQ1Z2ra/18i8E?=
 =?us-ascii?Q?Ar+wTtf4XfTGiISNiIZuN9MF2r2d5eJ2t9fmLyvEQ2BbI+zIfEgIof+YGVQB?=
 =?us-ascii?Q?5xMSmKmnK01r08iNmUp10JR3ovE3DPMYn7Uh0bCzxv5loaKxfMcF3f8CinZ3?=
 =?us-ascii?Q?OxD5oftPlQ2+GhNnU2Puh1KrxZzP0OF5Ftuq8Yp0K6unlXGPvqzQ8MpaOMbM?=
 =?us-ascii?Q?5ZXlfr0KrsgmsY4IquExg7EnSTMu5v4seiun+VcpqxhAK49zVz0FiAqVbyjB?=
 =?us-ascii?Q?WT6PahzyM9UK0nPh9qwah5QPuBcd0wysowf0GUtlycSFcOTMWgfvQ0m0/po1?=
 =?us-ascii?Q?zqPd89BNnJNO8xDoRe/7LESrCEpVDJzvBPoj92weJ8JSMabIQTOSmyq1yjv3?=
 =?us-ascii?Q?H6kRyiPa0FfLJzq/Ffvee0FJUFjMGdsIvmRXP7ETuziayb1BVJqwu3haGet9?=
 =?us-ascii?Q?4tE/WYfliDdanAoZ0Rb8k6ErPFm6XRkTuszdL21K8z8FIStGqh/8vqbaBmTz?=
 =?us-ascii?Q?/rhDzGF7D9vBqFObTmtcxbBsOIMMhxjnSRbdTgfsW2R7pdQPC9lhFT1CEyWn?=
 =?us-ascii?Q?tXEOvzC5KaT47SbVB2AXHeL6IjN3F8T5zNjg6GwICQcu4OOg76hd1+Kbh5pa?=
 =?us-ascii?Q?RYz+g984cDRD/NvIvqnjHVzW0do3TSbTTBW7WBm/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	q/XWVoBICTAJL3dGWe3N0kPYnZvrc48h+x4acTHCh4ZYScOQqKRWTGWX7Lz7xM4ZRHGjEbTifENB6F3B12bIr9p9XRlRxiQT8seyTRZ0pTIK1ngDmK3M8qXE9gZDEixgJiBtEEg0mnp5i3bnzbe5QEf7TfSu2hAi0DCpoHUzo9MwkSD1U1NVn46dRUnjZxiErTafBOKTYTA0gpGbag/7IsNntCmNS7bv1GXrxTWM92YbYxyKxOyIRmJQivdDe7jmjUvmuVa0//q5AJxDgoZku3y0ArRBRCU3MHZYGUnhV9VtL581zmitciOYbhKbcQAJRyc6SIutSQSNypX7tOOVKN9WnG8hZ2VUfQuswhXU6+GGfFaAi1mupNGLpw8HN1KJ9HIZMM0AIMQpysrrpU4Hj+6Kj7U1aGcMRW+/UBM3eoZg6Tpak71j6O9xR9E6EufGlPRAY5gFth3TK9ZeLe1LqxvKPyuEUB9fWmcc9YsJT08V0MfrbLXiZ9Bs19/NEV8K7vZrUdoOWchD7Srqf70Yg9SURxo65Xbz12e3mLArCDRjdEgyrSJ6IHkIY2J1xMzI7Z9I+yuo40j6XnRsjpSeIiPM4XXSWyMbfBaomqp3Lqo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 063d1e8f-1fb2-42d8-0d10-08dc966afa88
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 05:35:39.5084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Mal6qevngo822SfUGjaCsqr52tZY/U8dIQECNEyTjYYkFx9GvNdbWePZUnusrGuXflYIGaSZnER/aywhwP4/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7400
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406270040
X-Proofpoint-GUID: PI0ms7NfQpC2aZntmb1r0JysOtbl2dN9
X-Proofpoint-ORIG-GUID: PI0ms7NfQpC2aZntmb1r0JysOtbl2dN9

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_impl.h  | 5 +++++
 libdtrace/dt_probe.c | 5 -----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index d15c238c..2132eda2 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -283,6 +283,11 @@ typedef struct dt_percpu_drops {
 
 typedef uint32_t dt_version_t;		/* encoded version (see below) */
 
+typedef struct dt_probe_clause {
+	dt_list_t	list;
+	dt_ident_t	*clause;
+} dt_probe_clause_t;
+
 struct dtrace_hdl {
 	const dtrace_vector_t *dt_vector; /* library vector, if vectored open */
 	void *dt_varg;	/* vector argument, if vectored open */
diff --git a/libdtrace/dt_probe.c b/libdtrace/dt_probe.c
index 0b53121a..d0ae63d1 100644
--- a/libdtrace/dt_probe.c
+++ b/libdtrace/dt_probe.c
@@ -24,11 +24,6 @@
 #include <dt_list.h>
 #include <dt_bpf.h>
 
-typedef struct dt_probe_clause {
-	dt_list_t	list;
-	dt_ident_t	*clause;
-} dt_probe_clause_t;
-
 typedef struct dt_probe_dependent {
 	dt_list_t	list;
 	dt_probe_t	*probe;
-- 
2.18.4

