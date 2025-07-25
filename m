Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568D724468B
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 16:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753462067; cv=fail; b=NDwzjtZDXdpv3/pEWNjE5UeuZzEYgtvi2ydn0nLK+4VN76LSfG7T/7Ysd+nS1f5OSZqG5JyuqWvS5+t7eXjsGmTX7djewWKNZdJlgUpMeDVU3o5GJrwb3QgXI96F+Hjnvd9cKr7YFwHO1TMaJsHCKWaBGN3I47tPl0owu/FmvAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753462067; c=relaxed/simple;
	bh=hJWBv2svfOGX3PxYTTy/yFCz5g/oz+BjTKpZT5Ras6Q=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=GTt0kDL07NAe/VfA00PrXtKwPe8eeuZOktDkfTbUHTPMsAzG83JWFn+ygL6CCTtfplvLvCTxN0srbKGV7puZGNTAEYjPOLqrVl/JGc0oa6vas5+Y0+QY3sRTSn/TdBsbWATStX1LNlSBCblkTsvuVCGD8MJsHDAKSEDT9agE6YY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=IAocBVM7; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JUxvaNHn; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="IAocBVM7";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JUxvaNHn"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PGCTCu019706
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 16:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=fgHTkSx0CYt71ZgQ0354jqR0wTmTa2th+rz63G5ztak=; b=
	IAocBVM7Vk+WSJwk0jIXD5PCyu/B5+yVoo5RGPCKnIQtdLGnp75WjepEJ0kBofYL
	B7mLWJxDCUvhaRQw/R3YrrlKVuQIz+QMWixjCUaG5nAOCJDgIpokOTnfVJgJ5JyJ
	qd0mlL+JOX2JQhcpR93EPT3plXQOlcDIGpfc+R6eiIUG6V+FU1LvL35rIsBxx5yV
	QBByUipOLjxNMwS2SgH+DbwVDCxxwhJ3c4HOMAa+vzeesLxQCia1ckIG5hur1wU3
	cOok7qIJQWzStBULlnK3bSwynXezcqb6prNigTsvW3t7bJFs45T0csv15uFSwFdD
	ZR8yUEeHhZSb+NEycAxTrw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 483w1j1ehs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 16:47:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56PF8UAG011317
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 16:47:43 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2044.outbound.protection.outlook.com [40.107.244.44])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4801td87pq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 25 Jul 2025 16:47:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCVLSy1ImPfM9F4fXWGwZ7nR+yA1BsAFPMiWQ0M6ru2GBtVXDzNII7yH/y1PwnItU0XMXmc7BOY+SvKeL8sVU8IU1Ch/Q9hLpRu+50wsV8VuUTKhddBMkL23bqDyh3QL9xOkRW1cK7zkfa7zwDCMtzUPm3jfjyG71dhUjfYjAf/NNXEKrz2j/47jmfCOQfv1d1M6pU0ctqJU0QL+bKEykmpqem74pe2loO5SKecW3iQzGo1MuLY5r5yAtMiQgc4rfED4CWhBqVZIi39Y+jXOwFGhu1Qqa9PdhkwZRk1uja6mJoiMclhz+UaMLL3/eXqZjdyWJCyf6nyf5kZBuxsQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgHTkSx0CYt71ZgQ0354jqR0wTmTa2th+rz63G5ztak=;
 b=f7FJijh+wleK64aqlZr/q16yVnlV70oT2Y/01VZcmQxNoDFTdHT6krE5siP6T92k/BNBWC57abbx1fpBIf7Rk0l7F70SYEqqhrWLtqTIkLVXqMEKR89Du9OmbX064CHFbHAjGgb1SeFRXbRbhrxt27hlXFH52YpLHoogdbTPAiUNXjpsQ3zMSeGwDeAmJAQqF/b+2ZuA8BRGOed5EyWzV5Rab3zgCk7PuwmiWOtQ286rMjaxXvvzQp3kIEXOY2pvBEEbBM1FAYAJvKRC5EOPVamq1dy0KwrjZnwbS/s3f8PlVL012deQyBVchdMmcZFcPDkzswhCN+PlGIIjtr+XAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgHTkSx0CYt71ZgQ0354jqR0wTmTa2th+rz63G5ztak=;
 b=JUxvaNHn/UKj/UbiBfGlJlEdHN8e79o+w9Tnp6vXOIXVE5FhfeGa/U0kYHX8tAoSGbMRC6/jowCX1L/j6YIsceo6kGaVipzvtTiGj0TlhhmNUkWf6msTIW0xgCMoJNrAHvdivcLQHO23z6uSoALtY+PrNqGpzhiaXnOg9vdP3KI=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DM6PR10MB4363.namprd10.prod.outlook.com (2603:10b6:5:21e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 16:47:40 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.042; Fri, 25 Jul 2025
 16:47:40 +0000
Date: Fri, 25 Jul 2025 12:47:38 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Update the VERSION in the GNUmakefile
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:36e::6) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672401BCE9AE1D5F52583FFC259A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DM6PR10MB4363:EE_
X-MS-Office365-Filtering-Correlation-Id: 737921e9-06ab-42dc-6f40-08ddcb9af7ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lURAQrGP7xHBLQgQ4ZsIussE0LxmjNlBFHSApuRYJg0ILh+O6I+nqDUni4vq?=
 =?us-ascii?Q?4oL0v3zzwsM392uW97DVEtI5u0ccjxxtgW6V8VbSiGpQXxkAIsCB5QLGbCjC?=
 =?us-ascii?Q?3LZX/oKPC+G6CVJmYGksUDVhgOo+UEokGotsOkMBkkNNhUtyJgwHymnsl++W?=
 =?us-ascii?Q?sxjG3Uz27/NlNcaDMlHd7inZn4hLy1j3ooLryV9BcIoYvrrmsfK1pxdepi+Y?=
 =?us-ascii?Q?LaxHS4Xfo7crTTKf9BfgZuhLx291/ozztQZJrGHp/ik/XununutAHjEV4zfU?=
 =?us-ascii?Q?Hfx0bVGPUYZRNth/prFXSQk6EYwjtv8IfxZct7ckY0oI7MXCeoTS+/09WRIc?=
 =?us-ascii?Q?HqO9CbjIF1JVbrlk7UAeQGonazWCMdlQFZhLFpQhxJTPWlQVzTw5UQ+0b085?=
 =?us-ascii?Q?JHIp0GGMPoETuLVMDDLq+2E9ShzEb/92eWVorQK/prbyAF9t5k7OEoKZ/CAR?=
 =?us-ascii?Q?/G3+u++6czmsw/S/aGf6Hz0OjLlkZdZLc23E4YCzRbPWpA+qxTudwcg+/SGR?=
 =?us-ascii?Q?S80WzHGM9MSmA0TxX8FbiKyjHZ60QgZhKODs31mimFHxJcbpOmrA1Xza8sHO?=
 =?us-ascii?Q?LbW5F0Mk/5bOMUmOoQN5KRgaQoW3taR5mI5mYOyfigtQGrD66kplzr5mNe5o?=
 =?us-ascii?Q?BFBiyyks1POLvNGBqsru6OPzFKk5eY/hEU54gx1lPAjtjEVjC3EfajKH9/2w?=
 =?us-ascii?Q?3tW0/8Y+I+ktJYPOpcwp5aY+sqaZTkJOYAyn0ddyxuWtsPEV4tkdR8XZElPZ?=
 =?us-ascii?Q?myHLMg9AyUhC/q7wJTPQIRESO2H7T0NAvjNnebXW441D3OzC70nM/5nYnToX?=
 =?us-ascii?Q?YQNlGWhEgJuQJE8hVxuAFYtPewybPEaVlEfEtvgfsRkgrsvmbxWFPqkYe89T?=
 =?us-ascii?Q?kjCxj+3Qg2HFgP9U5mTkKvwMV568bfn5SimewYJPl1K1NNcTZiV4vtSkJj+6?=
 =?us-ascii?Q?YF+hH5zfzG18H0nbSe9CZr+2qIgRzSLioFNduAMEwtncYqAaj9Fw76GtH2bs?=
 =?us-ascii?Q?nGe3yF40dMf1yHNK03ieyJkvy9y+cgfp5GFCwq5Mk9SqguVvSy0EpReIM+dW?=
 =?us-ascii?Q?J5wXr7JYA+cLL1r6QLSNdwoMyAKIoBdHAIKHiX/+HwcDBUK7m49qm05Wh5XT?=
 =?us-ascii?Q?kT+2T4Pm/uhgstuQ74ndTW8yBzkk6iYZNFql+ezG3KNWgUYf62bpDsTwWJBS?=
 =?us-ascii?Q?w9SsaKE/D7IT4JFQExHxF1oAqpYUcfWWD6rU7XqmITgfBjJaxw5LJozGc//C?=
 =?us-ascii?Q?u/VbAebvycoRlolOi7gsELR6jBPFVcxiad19T09h790pwlE3EOEQ0fmXwzc8?=
 =?us-ascii?Q?QOcrxh87x42CVSGBx/1dKGQMo3Qc38aPqRfcVUvUM5zVXyqPAyVbDP9IP6Qd?=
 =?us-ascii?Q?7aZvUldWonSq3nnBW4RGMhyrnAFGsNq1Qn3n4sMXEYaD0ThcPiF8dmKK5HTF?=
 =?us-ascii?Q?0eW4nO9zpRE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vRJ1enMz3I4mz+N8UV/eBEpnHePAJRuR2fPPgEVSJYml+y134YR9DiaoqSMB?=
 =?us-ascii?Q?73Cf0na+db4JH8c1XpLLbMpQM37pYRPnlQ9ZyfXBVN5K3LbYqNMw6LXAQ+nB?=
 =?us-ascii?Q?xPGSoWww1m4PSvWiYfFkenqLxP71MR8Jjowo1kMeWJ6VIH4DuVxWRFNIhg3Y?=
 =?us-ascii?Q?U54Mqtqx4Bqyl8o3Wi+p3uoO33Ywqbu7a2VoqhLRUPXDpVg/23A3zwhJAhtf?=
 =?us-ascii?Q?mQwdTcmsHb9x7sgjm3lcNAq58XGMgWVfBeYfu57tqdqRoAyCkUgb5xMkrsN+?=
 =?us-ascii?Q?E71Ejkm8jVVHPotBrpuDflM6MVgp9WJTHnxck9sIY6b0zU0/+9H3dbkGZOKq?=
 =?us-ascii?Q?ocanQSMVOgFipVrH2we/pw27gtQyOt4O654PLbNZAzOVRjxA5KcD64zzxv/9?=
 =?us-ascii?Q?ni/3YqEOOPlxgoRn+9mru7oL80bFyRfxaJjVH9MIiqG/pOVnaW863jsEgYdf?=
 =?us-ascii?Q?2BkGWFZDGEIXjD1dEAtU1Zrf9fq0F8NK1tSwAQs7C7lmSm3Y+Gp1/+F4eR2h?=
 =?us-ascii?Q?9DIfQAEs59ddr3ouctXQsEt/kRNMhEkxll4GIuW0wDMiYKcJ+7Q+cALsw2BF?=
 =?us-ascii?Q?HrKmZhQC99/1Mx8UiVUg141R7r8iFZ5sNJBQ1TeJeZHRWQrfTNY2uG2uJZf2?=
 =?us-ascii?Q?wduXqerLudwy44dNCUZJxzQ7mDN+mpzmIYp7s0O/k36uZuZ7s4Ffpye7RAoY?=
 =?us-ascii?Q?f+24sJGvNqgr4mlvrCbwsWcBNu08pgHQKeaidm51GsChIA/gD9MpCJpn5U7X?=
 =?us-ascii?Q?AW6pfiNkx9q5PvkNovoDVB3iIPARD503YKDLLCX2cwHPaRzuEXIXmrLeI/ZJ?=
 =?us-ascii?Q?4lH1cC10CrWGNCdmFcT1dBIedcNtKdLZ75UXefDjrN/dvpB0JGZ2tmV31RJI?=
 =?us-ascii?Q?cAbitu9tCGfK+tPkkBGoq3EYSSx+qKZhumPxfjPrj5dPRhhByEebyt2yFL6P?=
 =?us-ascii?Q?EPSbjAuLr5BE4v6IephTRnCx7qGxmZ7d4/Hf9UtXK6T9hFXdlAaDLdDw3yUi?=
 =?us-ascii?Q?HGyD7F20mgEJsi6m/rLgsFAkUvvhJ9qXSDfx/CCLbw8ab2Aw5Bi8o+U7Dw2p?=
 =?us-ascii?Q?xdgaOPs9OUcWINXi7Rc1LE7n9yZFI8ztkUZyvhoerqUQiPoI+J+Jc2YjYVv4?=
 =?us-ascii?Q?0xyUbcIeAiYKzri6pS/AQldD7NzQPvI4E7t1e91iSGTG4O2JU9bxFxRGCPSi?=
 =?us-ascii?Q?b4DNNTm7/T3KyCOsXHgSIR4ooLrxeqryPl7povAxpBFyhGRx6WwQFXqvsyDU?=
 =?us-ascii?Q?AbUaas8n2JFsy020DHrjyYqFk2N7sNXFDC3Plvh1jYswIeVt789a48z78PD6?=
 =?us-ascii?Q?jdYnjQujwE1AO2SxOoTaN6imgVK7B/ub9hjWk4NUUCBM/wZWTnnAcI0ANq2F?=
 =?us-ascii?Q?bFLOOmvBAOQOyiNGa5Fm/k5ZfaiqgAijbRHLqt0z8QZfNwDMR8/Q7IXTkDyC?=
 =?us-ascii?Q?fOdeb4f19rzHs5hqfIp44qda0i7Fa89iZwlL0jo86NHeAmCznsROlEFd6lMU?=
 =?us-ascii?Q?eEJ+IJfWBPepoSje7HHfiEk6XboV3xOP6mtTpym3bTBgeQjKOILsY6KazOmY?=
 =?us-ascii?Q?fLCsJr/LHQonPfiEyYBxsS0cX2DlZlo6GxVOj5XDSfOCuReKyl/ERkIAkgLB?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8+fK01RQZxsYS5NhHHtVNH3b7TJChOciYv4yDF29szvN0/oY+SkStPPVbmuA8UFeOnfR2dsRVAgJ6ZvjXLbwwtmF/VCJflj8fMjsab9dS7OwHUJyyH4a8mXmXOq8W5wb30cjTr0t7HplG/EBiMbjX6WJ4rTYZI+MQeLjsql/SC1UNIlHBXxNCpZG7IG7/26ynQ22T4ul+K255zr7FTmJzVYwtBgZT1Om6QlBQn/ynuLj4dpn2mOYLGcAmglw1/mLL/Ku1m24E6u1JdG5aoYPNhduHLhCHx6W7QnfWpT8clSoS3XkXPVpPKXAYOKUM79j77Akzn9x1yahLISpiIciy4muvXlTyjP4jrgJRsqq41mKJ4YpFbJJvpQMvFXdRFjLhiVD5ZUQkKzutKB38QO9hDP/NWx+WdyKw0zk5VWOIuHVBAXbNp55xJ8KA/tc3M3uHvF3fNEWSPcewmtSXE+4+p/fzEZ54ECVgoLF2lbubH61PYy87tFNCZSlBUERY3PZOpZsN7uBa3ZvrAPk5sq9w92oy1CbAgCVicRPkEXUSK7WH6onjsIcbTXKafU43wVQbV1B0MKG7F/3nO+MtXM8c2fihVcqP7oy1Ley8LNKDOg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737921e9-06ab-42dc-6f40-08ddcb9af7ee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 16:47:40.2744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNKjkI322wQ4HsKmisDlZQRMvKKdMg8VrUKg6x82twreKne1T7eQQbZJ+SmiiquWxy+V9nWj5Qqb67xufZ0u67Ul1loVfB7tH7tCyqtnlOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4363
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_04,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507250143
X-Authority-Analysis: v=2.4 cv=Jq7xrN4C c=1 sm=1 tr=0 ts=6883b52f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8
 a=1xoOB3sFsA3ewJaKzrUA:9 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: tc8GKFuY5N7Q-AOzrRNiSIiAwZMNOW25
X-Proofpoint-ORIG-GUID: tc8GKFuY5N7Q-AOzrRNiSIiAwZMNOW25
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDE0MyBTYWx0ZWRfX8MG5LOa5zPwo
 R/l3KgCpqFZq0gSE6RTNOkephzTwGUSZBpXu3j54cC8wq1655PiddN3cSSKHce4heGqxO7qsfwQ
 wCp4jI9rK3ijeVoGBJV9fbxpwjMTmd19PArNX1KQxAq9mguYMdfb5V8JU9sNzWkk8gzDvx1MYKa
 qtcIhLuZ+YE59YuYC+KCSqZRhig1Onor+vkZEa4LomFLan1ZHGNN1lcEoH6MkRYYALDfoQuuVeF
 jd4sDRB9zJvk8vMkVjp3uztITX+svvq4eMl0peAkItES8XC9rV8SdkpLdygkLiKfgJ6LffNoQgA
 hQihxxXSgB9VxHEIthJ931f5u4OXf8J3VWm40cmqaakL3uBJ2MV/0xkahlbbA/KFbp8GGWNpyBw
 FDv9QIB+YfeafwqT+qGEa+6lnQcgXQrX5bEkslmDKTMLasUeIHHqZj2sMDIasNq7mrMO+OOG

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 GNUmakefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/GNUmakefile b/GNUmakefile
index d1e18bb1..0c95fe56 100644
--- a/GNUmakefile
+++ b/GNUmakefile
@@ -14,7 +14,7 @@
 SHELL = /bin/bash
 
 PROJECT := dtrace
-VERSION := 2.0.1
+VERSION := 2.0.3
 
 # Verify supported hardware.
 
-- 
2.43.5

