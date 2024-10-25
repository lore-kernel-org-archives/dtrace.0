Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31760215C6F
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729890346; cv=fail; b=jcWn5LdRO9CUrGJpKKGlAi2sRL2cBZKTFYQSQ05yIAOgChIZmzWdRbqaTAdmewWT1bnMej/GWBR6p9BQvT6eoEbuPlua43ZoS8QJKC9juDqt7vKoBfCY5V84EoZxOp25ggFJ9WtjlzVuh2EzxkMfVfmcQ0FWX/f2Qqzr97uurPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729890346; c=relaxed/simple;
	bh=5s+ZDnEB3raoDVk94rT08IvSI4F5i3+IU0EoSiG0bZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ktklxiHTLq/WPqW7P6tLUcFZtRw83GUhy6BbhLst8cbYSh1IhMGy4czJ+GZnRdo8qb1fHmyOFQNVo9/KGm51+h0obpw869D3BXOucPkyoK4F+dycObbqYJaAX1oWue1QNepnu69YDJpL7BdHAXutXnbNuql8iJaIDIZYBHOV/Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=e5Yx3FzI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pmMG1vaM; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="e5Yx3FzI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pmMG1vaM"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJdREs015520
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=x9eJ1Yin6s2cicjwxx
	CDOe9HNzFHh1bnYg4wf4UwY0Y=; b=e5Yx3FzIy3aEEd+XJjncr0p0oAeQD5SO10
	3W1ZgpFlS43HAGBzirwyRIhA+LjLTCYMkyAaGTEBsyr6Cd8v1Crx2tbIyr7+QLC7
	uFs4e3KHGeld8h15mcprPv9poXvQ/qEZx/xaImMu5aCo6pS0FzjxBdacm73eb4s2
	9jY6kBQE6O4oCnUOJXUWFS/QulwvTGk/UOPGhfqbX6G0OMZl7Ua9b8JyOgKjfqBb
	FAVPrQO5fcIewRNzLsZVg2h/m8sieGxpy2cBAd3Q7cn+FZqg6sP9Sfx+nQQBg+su
	n8V5DoQEBB4EWEne/aWq/af6oH8JXmXRnjw/xqPdu339XqR1+3yw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42c545e0u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:05:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 49PJjkXJ016383
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:05:42 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42emhebsnv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Oct 2024 21:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lw/952ygqZsxPJd9RCm8hXiwkv50JITOJGtn2UpJIQgOnDgN7w6VbRsKoZyr5xwksdKYspgNiWwZjQXvnS5AsqPzbtq9SfkTh/RhufPV7REGmMZlp/wlnmzcqCChhAvGtuA8CyP5v0PofWRsPKpmlJlAz3TAFPouSV0tI8EPprA733/xceyiXEhAjJl6JTGF4dhulQSREjPtTuG62MKqgIaKdaPAiWLYiIhHLEzfCt1EuoB9dXBs/lMHTbWUolDvF7c07GFVMDeJziUpmTanMfQrnOh5oGDyqVQ1xohoFCU1FEhD20RvV19NxFnlkYQmVY42TB9Pe4W/8L+eeE7HOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9eJ1Yin6s2cicjwxxCDOe9HNzFHh1bnYg4wf4UwY0Y=;
 b=s6i9FVwR83H5tEJtyZRAZV6RJ3mgSEV8feQVwS6/9L569+71RobF+t2UOD6ZpM8gqKIG4WJon7IKv7U81uN/z2g7Zbq+MAXlJit8XTt6/V+k/Hjk2pKKRURff/TUPxjn7qEmYFxRksyqKbTtVvvJjoWEGJHm4xHU9g2ynj5EiZzWaVP3fA8zQZFMsyX510SP0kPG5fnXiUUIxkEaN1ZliGKNGGzQCoESf331xGH3DSR8xj4R/PBOxFi8SGBQXGYDMxdEc4Jpb91458Xifj3KrE0sOXn5if0dVNHjwKDhW35HfdUETh03/ALYrKCFc1zRo7atJUARAbymVZ/yQ8FY9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9eJ1Yin6s2cicjwxxCDOe9HNzFHh1bnYg4wf4UwY0Y=;
 b=pmMG1vaMbF2mOQ600a7aOwEMQmOWPJUu1Tdm66V8BChTw/p5l8Y7aSKcPCDOIerMS9UlEBgEN11LyEtHG7QLSkK2jFytNBzRDYCKqLO0Mi8sWfOmFX3dHz8yhDaFnszkppfiQKiKb6DWf+nGvMmYURtwUJFMEInK/3uog2yKxBA=
Received: from CO1PR10MB4769.namprd10.prod.outlook.com (2603:10b6:303:98::16)
 by PH0PR10MB6959.namprd10.prod.outlook.com (2603:10b6:510:28f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 21:05:39 +0000
Received: from CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82]) by CO1PR10MB4769.namprd10.prod.outlook.com
 ([fe80::6801:f7c:753b:5a82%6]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 21:05:39 +0000
Date: Fri, 25 Oct 2024 17:05:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 2/4] test: Increase timeout due to long shutdown
Message-ID: <ZxwIH3Zf9REHycKs@kvh-deb-bpf.us.oracle.com>
References: <20241004044355.25870-1-eugene.loh@oracle.com>
 <20241004044355.25870-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004044355.25870-2-eugene.loh@oracle.com>
X-ClientProxiedBy: MN0PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:208:530::13) To CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4769:EE_|PH0PR10MB6959:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3e9df6-d7a5-4878-5acc-08dcf538c75c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wBtWar8WMCO9ICdiuDOhRb8eaz2lK05FX2aireevlx76bNhz0yTLLaFLFmQQ?=
 =?us-ascii?Q?vzVrTw3ffOZ5U5bi3c1bLxbEa4FwMn6vT36Mg7pVk9SvlvfAdz3J1AE8dbsw?=
 =?us-ascii?Q?2gPfWkXKRjaoODqturjqedGkNxKct9ZPWOifNm+5EZZinnlle6lpTRmg8XbJ?=
 =?us-ascii?Q?OY6YLBu7mlh+5RNrqMBzbX60axQc6lryAVzZuQ2YoCS/5OGJH+C5/PjCOuHH?=
 =?us-ascii?Q?4bmaqSF1qdOKk9/PvYMrW+JU+Q2Rl05oSPQPgrJZHC0YazG6IiEtApImLKLI?=
 =?us-ascii?Q?uGdzpX/08vpACpaaUG7aUNFnIaI5gBsirk7OO+vdNZmYg8ipXBGJGYaxxiQq?=
 =?us-ascii?Q?udb9N0EVvkSnWkQmyJ06x8IkyoY8UQoGOGFReqhzM1ENEvqWdQY1QsQf5X6B?=
 =?us-ascii?Q?5icEUuiT8gWWNzBfRuajYMmA9bHCHtBVtLo3alMg7Qqyxw6FttxfSd49uPAp?=
 =?us-ascii?Q?it5xz9gJZzcYqirTawdqpIa1XKDiSHHBPFSgaR9p+znVRA+Wx6mDn/Gy1tCk?=
 =?us-ascii?Q?93kUR//uK1EBl+APf4wPcIbeiH6bh29v6vr4zVYt8h68UUViJ+CQsUisuSD5?=
 =?us-ascii?Q?M5kJWEqNBk7FaQlgBvM0vxRMuPuo6p5Jh0xTMnBPQ0X8dtRpTBBC8Kbulba8?=
 =?us-ascii?Q?v9/iKHRgKzX1qEVEaMyAveYAefIYnXHAJgcYGYjdGB9deHmwAn2WjEfT5/2k?=
 =?us-ascii?Q?2jUOPrlWglmdNxZD2vEHLdEECxRnq/2VgJ1/foLOukk7bPjB6CR8li8/eq4v?=
 =?us-ascii?Q?v3pQjk/kzq8doo0Q8rl6gDUgGQqj9W2czWpQyOa+BydEl9P3d+3dPJLceHwY?=
 =?us-ascii?Q?Mpu/+9HKxuFAhtxszUslFukHp+mo4jofmnsMawIpo4lvaS9pC6Xu/OpFqFJP?=
 =?us-ascii?Q?kIb94WbLwvMYwKtJz/b6IiBeu3Ozm09zVUjD0hvPEBH0X4CrTSIXVtsqUDy4?=
 =?us-ascii?Q?5tS0ToUpQrA01I0JWsOBAVAP/Zvakh28e7RBFpnRjGlDNV3zJSUse70yJtiI?=
 =?us-ascii?Q?IVZt1HyvQIcKdmsEveaa0IfQJldb+ICkeb3rzWqPHMHszoATHCGbqwTqyaHP?=
 =?us-ascii?Q?Z8dOTOUK9yJbgwjL3OoDYclFSiOimA2Zb3FEocG4v9aQWg7R929/j8VjNqix?=
 =?us-ascii?Q?6Cet6DqvMe+8LVqw7oN94HzhepxqVtqHwu0dj+UsL6x2AMrUtmR42mci1SRS?=
 =?us-ascii?Q?ZOoZhHcbvdyb5QY6OyM8UbagNhf3R7k4vkxz5WK/Yip195CteFgjhWeN8u9j?=
 =?us-ascii?Q?xALPbs8uLfBrvppEDlTB2WRivfx3fF/W3mwC5qnMFhTho9eWsQtDyc0T5JOD?=
 =?us-ascii?Q?80KG+kvOn1whHxbCuWYowfGl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4769.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hQ/RsffNCgM2G9wf9MBs9gnouEOXLYb44Ya/6rMfpSCBPkhWNXoXxK7GnycK?=
 =?us-ascii?Q?x5Wjw03QSib8dBX6iL9ofcBdbqd3+kMY10amZAir7EZVRTnY4aLpRckr5YDo?=
 =?us-ascii?Q?CyRui7HVejW1OONuySVcVc0iEauGeAE7Oy/jgQIjNkYrGavHZHjeB3EF1wQt?=
 =?us-ascii?Q?U4i2sse4xyQeDXInwAKhqIxijwiQp3WlbSM9mGCxgjfCyP6wtI+nysloYggf?=
 =?us-ascii?Q?D4cr1Irx7EyP3/XSPZ8agckyFAVxNaU5CVo/ldxRzrrrhTWapIKFNIy5u+uI?=
 =?us-ascii?Q?q1ceeT7HgXJlp8vn4GaJ3ImZCVoWwW+GsRcW2o9ckHHNyMqufXUhkQ41Qg0z?=
 =?us-ascii?Q?XkDCGOuiO0OSrmSPtRiJJazBx82W1KwJVdwkzRdhJgnpTM2sVXocgPcIqpA6?=
 =?us-ascii?Q?/LelhqbHI/qazNyVZqabuucrJze7+QYd5mu6gByxKxFLvI5oqk4DuMn7nok4?=
 =?us-ascii?Q?boiz/hD0OdhVqJotxPcUMmOfwq+hpGk3Rykr90YzzHCyBUzOxAFaXbWAYxg8?=
 =?us-ascii?Q?ELHNUio/XyjHu/VW0guCwdUug1uGIN0d7fKxgsUnbdKk0e88r8QT657hoeb6?=
 =?us-ascii?Q?Qw64sWx64RZV30mU34xBfTD8JQX05qNQ0pk1I763wtmWKXCtB9h430ce+dFe?=
 =?us-ascii?Q?XGyB62GEzVas0P2CXxP7zxUkdQiioVgSjwjoy01j/7DcJ3ofEYDK6T3hKhVD?=
 =?us-ascii?Q?jp/ktkP4S/EiFHsZ4Tf607Hn2PyXiL1vdlGyf/n1OSbgr43vV5lurYv6hE68?=
 =?us-ascii?Q?BIOw6S/sgsNEdjTyZKKlohlypfbeZ5x1YVASDzdFIV6UdanyMpmt1iOcHmrU?=
 =?us-ascii?Q?Za3J59U47MVkFtAQzSHV2B+LPEWGtub/h8XYAPkyI04/x3EpMBk5KoYpzGoW?=
 =?us-ascii?Q?HsjTJeRSzDlMKRMBG5qVjESD3hqQkbKFvu2WQ/Sj+QIei3xANDsimDyEZG5i?=
 =?us-ascii?Q?TMwbaqhfjNjr94fzxU3e+k9DnFgThr/HlmUEIbIoCv2XQva9G2ch4RplySky?=
 =?us-ascii?Q?QspGkH3sdf5glMGHXQW15wrRnJXgUNevvtxr/CLAdC2jDCil9qc8/p6Gc+oh?=
 =?us-ascii?Q?wgrCho89wqL/7vNuMCiIchAaEbyKqKDLfTky/wZw4cfllmk6fIreTv0rKOE9?=
 =?us-ascii?Q?4VDOVJfif0nBW76aIouiF8V91In42de/8QZYuUmg7lwAKsViwbv7uI43LvQ7?=
 =?us-ascii?Q?1Ws1Im8fj8dq01Pw9igzIDsZO5fOL81P1s8AKRh00DLrjI1gW+LgPOPbMXMS?=
 =?us-ascii?Q?Y5JmJ3tV42UyN4lcMmY/4JFWQuyqauZa2VEo69O4ndzik+4PvGOzDpL0uyfF?=
 =?us-ascii?Q?viCBgbzwCcOEERA+dZOjKQwzNH8Rn0bb/QdE6n0de21hFTzfztYgbfvAtojb?=
 =?us-ascii?Q?3fqsd0EW2jf95LEUK+nDMMSTjvU615Rsai0sVmg0PqwibgvHZOnoAsnQuBL/?=
 =?us-ascii?Q?cpO3/QHfU51VjpfrJa9JcWBU1WeqyMERToD2LwfEnQT6L6FVMz4oVI4SHHpO?=
 =?us-ascii?Q?zQqEankyZOYjjnd3jt6QzplgccuoZAGlu3qxrYkKZTGBeWWeiTkH7zZxt8kD?=
 =?us-ascii?Q?r5JIAZp4q4Rr/ld8GMcgDoc8Gq9KJR4W1CrJPm2Mgk1fP+tHYxvqW/yy7Ru/?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	V7uF8+kPKtpbbP5t6b44K0FQTKZTZ3XpY82ClyfJ06Q8yQ6w39Wv+EcKkZeKKHcmvf9BDEwCVZx8jHCCFIIfnviPIyBCjhjMVLLp6+/A27vgOyr3BhkbHqaq3kR5OmZLtqHhEzHuBkqLh4sxHMQ/9pPUUaCSsN0QD+1HsxxRHP22UmHRZHqJwaoEcIb8r4kviet2ZzqbhMILwD22zXf6DntxfRqhCOfghslp8XDN6w/7WD4n/x/UsYoq5gV8ys3LdgAg4tctDbutdY3JfEBnRxcHq06S2E8UjtaOZsenfxIstmETig6l3Rejh8XDWxQ5aqPzGay6PB0pgriaCP4JMBFO3tUBTxfLbPEQ/O5igW7PjLLzrpuumwc+53tbZCnvClUcwFPbDqSw4kmB+p/vgRtQoA/c1yYvLLCLsgWhdX7/SdvNFp5u+AK7F9QV/HmLMhyGKqt13RBx/0134+MMnZhltBu3495m+kBSpW9MPETyubvyjqzAbzr42D98nolqH7K42hL8A7+/tkWqZNG6mD3onIUilvmMM6S/1aft8LLc9kjj6Awh+UDMHzaPJaAy63PiecPXckmSw53YuZX5TP56X/SKMoaAtG5p08T1oa8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3e9df6-d7a5-4878-5acc-08dcf538c75c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4769.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 21:05:39.2482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dn26JMPy0oQK5KeroptmMkh6YoXCoQiZMiq9ER4D3xWGTkqAyuwwXp2C0FEp7QIZTmUoMi6FJjR0ngWFEAVnGmDIYnjTizm5arl0ENBHvU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6959
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-25_14,2024-10-25_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410250162
X-Proofpoint-ORIG-GUID: eQHzgHn4LGTRjIRZG0a51V8LZwOkzaif
X-Proofpoint-GUID: eQHzgHn4LGTRjIRZG0a51V8LZwOkzaif

On Fri, Oct 04, 2024 at 12:43:53AM -0400, eugene.loh@oracle.com wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/pid/tst.entry_off0.sh | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/test/unittest/pid/tst.entry_off0.sh b/test/unittest/pid/tst.entry_off0.sh
> index f1a75b6ae..1a4c3d207 100755
> --- a/test/unittest/pid/tst.entry_off0.sh
> +++ b/test/unittest/pid/tst.entry_off0.sh
> @@ -6,6 +6,10 @@
>  # http://oss.oracle.com/licenses/upl.
>  #
>  
> +# Although the D script takes only "one second," it takes a long time to
> +# shut down.  Until that has been solved, increase the timeout for the test.
> +# @@timeout: 120
> +
>  dtrace=$1
>  
>  trig=`pwd`/test/triggers/ustack-tst-basic
> -- 
> 2.43.5
> 
