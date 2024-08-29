Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BD2DDA6
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909184; cv=fail; b=VNn6G2bHH8PRrI7/PO3DIWAGjGq3t4DIAITEaDjrzYtThga7MtMoqECv1qTUKAp3xQ8ikuVo0D2OEnt2inzemGEfEnUslMJ9Ps/YDVEFVhlW8nzxvzS7WN70BEzV95gbXwyokZgqPR3d0I1uWyldACWdbMf5Io8g7Fsw7axYj3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909184; c=relaxed/simple;
	bh=K5SJSlOu6Lqx/+MJhmsJGiOzhfNQKuhSHySzPGjlI94=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fND5VUefWkbkxPOftI9CTwJXW/h/QcEjm0jMaDDNtqRNOUfZqRpsDC4Ht690Xof2fS72UiHK+RQPgdNaoOv5irKHVlTjhsxlUXwXUTzTQtEjFFmk+f5sYUdNc+k9bb2H32nHDJU2sVhKVtlYVlktU3dPuA1AJW3xGwBj5jycUXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=UfAjKKQA; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=nqzG31qA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="UfAjKKQA";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="nqzG31qA"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T1fbmG005695
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:in-reply-to:references
	:content-type:mime-version; s=corp-2023-11-20; bh=WirV8qIZT8XPDw
	68nCS11EgMUUAr1Mr3GEqO6oaQs80=; b=UfAjKKQA7pweUwcRTn8BtDQLCfgCjE
	d7y/iGTtn8T1LsoGaTSik4N8l3to7RDgqq03H6JNZoTEd3oazY+XWzEx+K6SZ0KV
	Tjr9YlN9VXz2FzArDwAx4R4b5x1gqriCLO5takDap5d53H/lqsUoJ07WCZOp0qFd
	loBvJhwLrrChbFlQvjs3DvvvaMRTI5UdEQJjKMi21EtVITy3jwh5PKJamwZKxKHv
	5unrKEwzfQfKLrQTcUEbU4FqfSA6HG5T2fODXmhG5MTnq05rnL+6D44ID2fs9wmS
	pTxWV5G9dKA5/NWNYle+hLeP1HA0xnWI3JZVL78TrJHnksbjTWOPCBcg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pwyu9eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47T3s1wH031752
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:18 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 418a0w8511-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 29 Aug 2024 05:26:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2YsWCZGcsxkc3b9EKMTck7wWBTyR5S6oQFKpmZv7H4MY+F8dy5vBe+QXMA5CI3weVmk67mWGEMw5UvuXdsotIeeuxMkLlb9pQM8POIE3e4EvPyqb7l/Ot9f9EVxCqqt5d/buMPi8xMu35p+4g3Ysjeh2UkTaPpsv7Ozk2kzGhb4z9KTFAlUvr4Fr7/6T+R6+Bk8abUn2bhmqSOmlMtOnmKw9DfK1k4RghV+AzWvXCWNIYhODGZIWeTrr7QXHYTIT1+FJ/65Obl6YEc0EioBJ5+akoGk9hq6SVeE+ewP3wg/pI7jNrv+6BFr98o5O+VakEw3dPE6H9Swzccn5GKN7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WirV8qIZT8XPDw68nCS11EgMUUAr1Mr3GEqO6oaQs80=;
 b=ANHFLS77gtnfSFxn1gJy6S1e5aRsEWliukSt0g3TYKAovno7fvna4XnON+4tEtCL4JnKnhFTO7EH2kUIkuEy76jRoeZFaFobVPmrmpdXPXiDVg7JzKp51jkUzPm0lurOB6KVS3q+wTHDa3gMRu8TQRPX0z5vnGgNtvy9GzX8Xt0gzQThAVXzo2WS99I+PR4NFmEHF9GIOlUr7p0GqtCxMKLP8s58co4VOkhKobzmvY22OGM7iYq0Nu0oY1ajcR3lRwVQyJWSH1KYlstFsE06n0uEnIH3THr8NUaDyvaf7+ZI4FStHAUrYAJAX3u/15KblIe/vAuTlZEGzL3w4/cBHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WirV8qIZT8XPDw68nCS11EgMUUAr1Mr3GEqO6oaQs80=;
 b=nqzG31qAFCI3VHknuCnKo39ZScKml5fwqyiteuD0/SiK0opIY1dHgtYsSHxIJoNmODju9dxRH2Mv9Y3LK28C5HBiENMTFdJufXEvGV+QmopCkqxV09DBXqDK3yqohs3Ke4In4zkYT4E4FBhIbFesfV1nIzseVxY4yZh3CGw0eLs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.18; Thu, 29 Aug
 2024 05:26:14 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%3]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 05:26:14 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 03/19] Widen the EPID to include the PRID
Date: Thu, 29 Aug 2024 01:25:42 -0400
Message-Id: <20240829052558.3525-3-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240829052558.3525-1-eugene.loh@oracle.com>
References: <20240829052558.3525-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0431.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::22) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: e59f6e2c-65e3-4905-2455-08dcc7eb1991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nQskP8cHy38ua7UJAnz7tME34ClvR4nlJmxaIjw9LiUMtPw4roW9H3DM3EMo?=
 =?us-ascii?Q?GO7QTHzkDi6fmlAGSY/pptIDFDd1rfjY2S7MEOSWCHRS36PT9UDJAOrd0mow?=
 =?us-ascii?Q?Fw6hzfUed2pP47wiitiujJXwEq+fYea0ONjlhCfx1ub58Rn6cBRKmpa6fQfe?=
 =?us-ascii?Q?n7XzzgpZJNCJhjNbQpmaxH24weqDopJlFSIHQ8poa728/fb9gUeOXtikRLx6?=
 =?us-ascii?Q?HhgBP4uo98apnrxUDROP4BrIYmqpyoe0BVKkod/z5nw02KqUJ6+XYDH3Zy/u?=
 =?us-ascii?Q?6v6DE46LJgnNIRFhY9QHecxfkQ5fmDwqxKxMko3AxcPT1wAhxl1Da6SYEUWb?=
 =?us-ascii?Q?5hzcRVnaoOW3WeRNvZQaMjqFfUKY+BqxigK218QNQPgXeMizt0431ji/Bxjv?=
 =?us-ascii?Q?FRrlS9MNyop7aQiY36VaC8yEPDPTzHV0XTHLvWSJHgX43B8nB72c380/8TNW?=
 =?us-ascii?Q?NyyykITHQfhOzHjtOE9qXiMeX2jhbdH+Vr3mMGwDeJ+qxGdeFus4+vPl2Gri?=
 =?us-ascii?Q?zD3nA6nTWguCzwXGVG3CbXiMBvvQqQFALA9QQFND6EsnnXOeEBecPS0u6/wk?=
 =?us-ascii?Q?QS1PmPV/doQnqnrLx5UTnN4cjQNUpiQ/PvowYEQBguGT7qgw1YVE/GneWNyF?=
 =?us-ascii?Q?jgbsNZSnB9sm+jkqsyrw8zMurb+zvdy/8aFpHrZUJcPTJmiYM/OSGPbtoa4E?=
 =?us-ascii?Q?+m7aI6MXR5p+JuK1OyA3vZd7nx87F8sQxx0+YG/KlHSZ+jRynxRjpuk0x4oY?=
 =?us-ascii?Q?M2N6ObNx7Q0+lv9SFLcvGRCSMNQqNV5HPrsyXf9IJ8MiF5AsBRM5XYXUo1Ud?=
 =?us-ascii?Q?yv8kRHp7synecqZACfSKdVyRur3VnB1zayxXvUhNFvYkn6LI2fPqtZgCKbhN?=
 =?us-ascii?Q?iAAJuiE3txY3QXHpQ/oCrCQQhqa1SmwfRsmDiVFIMfKMXagUYPqX2t4MdlIM?=
 =?us-ascii?Q?LUs6wbeCWlmY6KozEsYpspkCBFveP0Nl7dvP32yIRbC23D6uEi7tOKElp5rm?=
 =?us-ascii?Q?iLA/IihH3zeWjg/zt82jYbF8J4g+N+NyZBKNjDx93epkskYlc9TynAKPl2Ur?=
 =?us-ascii?Q?ksNUovCS5Zbe5eMS2AACFv9UsQYQ42itvh3dmTPiI3ENhyE0WpfcPKxDQCdn?=
 =?us-ascii?Q?2aEmW2l9E8b5d4DGha9Tk9OWPpmng1xrBSo+i6CGyEBFC+Y95K/xlc/woePY?=
 =?us-ascii?Q?soQsBdbnKxqG4Yuq6c4HucEJIfipj9b7oCU7DkScPrf0lXRHS5UOrW8WhD6b?=
 =?us-ascii?Q?ANimfM47cf+tIUDVn7PUnvgEYqt1B1ecsdY6lR0GTlyrVBXxNxKq+v/kWxKU?=
 =?us-ascii?Q?70djkC84zf2IDjMszdTuWFs+sQFt+o0qotspDgg1U8+RYg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uujb0lAFx969Ui6JQVoc1MfWU+HqUfB1f99qmLTDDKGnByadzLhaAWyDTh4Y?=
 =?us-ascii?Q?o43xhP0Dy6dUeps3S92yNoyu5jwhJK/Es4fJa80gC/NAPG3nuVGYjK8duQIH?=
 =?us-ascii?Q?vj52JPkiqVEi0YvAaJyPSzfNhyAHp8ii1YSG7IyvG4vP7ZSLGvP46Nue1M/Q?=
 =?us-ascii?Q?8Mwv2uCqLTMjAAR5Uhn7+g9vk93MAcWthOyMMWQUqFLlnKT0562PKv7U/Q1+?=
 =?us-ascii?Q?dB5v21JQV789xee+mX6xkag/OG583tKgJxifFkVrj4uJx/eMwqd0RKfCcPHr?=
 =?us-ascii?Q?vszVG9AnOEUiWsh9AknqfzU7TNl7n29lUioRP7cdarW9xvN6leoMLURpeUOn?=
 =?us-ascii?Q?brreAmjd1ubjd6q64zGb3u9/CD4ihVfCLDA5J01jgUgU1S4cWGBpSZswJLwK?=
 =?us-ascii?Q?5ey+AaP2aJxrWywctlvLCe9gqsuM+Vc6Yy0HgcySMMDtwD+DdQ6QoES9aktP?=
 =?us-ascii?Q?Yg5h6ItSXPP47gD3bvkyTiS3zrExJfsrmYbWKhdI/utaQIC/cDrjxIEGBLcY?=
 =?us-ascii?Q?KhGBrnkIr+npaXLYZJGIPssqoA+2c9+5JWnYi7fB4uaTahn79xpYIxjpEOWS?=
 =?us-ascii?Q?eE6RRCKBy0wieHG8Hl6KS5TPEXmfFQmCExQX6M5GnfBeEBC5WeZPJUoY7Ubz?=
 =?us-ascii?Q?UTWm2xix7Efo5d1GbCk9IXJKJjODzVcOxcgVxJkpc5AgD/lioRnni1XuLDKF?=
 =?us-ascii?Q?8fi+jUvnFL7AY0nQYDbQUcTcfWoA0Oc9xwAjIAibHeTk+1IktXmu5JbhDOmD?=
 =?us-ascii?Q?yV1BOBLWJo8eE0NCBpzvWIcjAUqzvMfL7gDYGir+ttyHahBUKyBFSHlJDCat?=
 =?us-ascii?Q?t4/Ot4tkReD4QGYktpPOtOQDhWJtij/FT5W/2WVLBtek+rbG2Uwljt9O0jBP?=
 =?us-ascii?Q?gtbUHoOPXcJW9LEAzG8yPqNegYQuvs6pSILzeP3c+AH6J49rTstEbP4Zh9Bx?=
 =?us-ascii?Q?i7KkEH1+sUTsatn9SVjoTwx2OqxFgRLzaoagzY6XOrTFfVWVHv6FrRxCr5jb?=
 =?us-ascii?Q?0ExS2b73B6k3fN0Pkx0xkP2fUTYNMLxSWqOZAfQ/4bN9/es5wkz5O0kIlzX3?=
 =?us-ascii?Q?in1CaLvGf69eCLn3oLbDp7K0nymg+j7umYlZVQkmXOkp7foNr9E2TECBLjTP?=
 =?us-ascii?Q?8AfLm5UpF6sL3HhTSpywcoIeIfsI+OttVbW+Pi58teBZwuKz/4gSo7RWoSqg?=
 =?us-ascii?Q?wQw4nAW1m+5snD9eH9laQfiOVOwGnYlbj7/MiHpByPx2TCokfmYGsETmKzju?=
 =?us-ascii?Q?C2lsDq9BV8WrZRFWTMAJ8lm4I8zeH7v5x7qmYcbzIlGBJZ+pWghrqz2kwAEh?=
 =?us-ascii?Q?mESCPfm3OYk5pxk54QZd9Tg+UhwYHWg6NyC0Zp7ug4YigDuTOBYipBk6JiXx?=
 =?us-ascii?Q?krq7gvEpf8EbCd2Vxm8yD3lTz/T41xswUsnSp1O7gAJ+9vrUy6o+HxRhQ6w2?=
 =?us-ascii?Q?PapZ+9KYWLSSEhZ62Y7TgqeVxpmDIBFWJnIcFZdC5N+oXP7zhRDLtG5tYrov?=
 =?us-ascii?Q?Snak5+28Bo4lW2H+uEiSLtJzwnxzhD3F1Udglne4Ss6YjAy4Yy2blSXnrcNl?=
 =?us-ascii?Q?K68fIqu/f6HKz8DDEUPUw0SS8gzzIrFkefOT3Z0K?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2T4rr9RQNmSRr7SgrDFRAaJw2Ys2c85RI7EUcLZ8kycxrqvBI2FZAR0OyQotgiHDpwGjsPHi/P9mQe+N1YhjtLZosxvY5S9GFhzb2vSnH48FXAEFRzlPjR8NxVGyOsPnDvpBLXS/AUyrhnKlKBuF3/1iBjpMBTDSSq+TzPXZqhny1dTRiOMOSf1SHwIVVnt+VAsyzxWEHfn5R7KqDHAE9oR/MHzdFcy95tG8n4TrbI1Dvbl0bhd5AOZl/Sb9ndrErwWvr67ZVAzSY4oF52lPUmCbBAnGpDwj7hWSG/C62hpnKZLj46VT9DKkiYMAEpeIbc/L3ErUjy8Wd0IyupLnPQ92MsgxS2n5k06iftcWQSOhJrxA1tnaxl9e2xQafyMB2ZPpGTH/ggL+UKvEvY56+4dfZaKPkYBYzho/y6YVC814UpSEr8pX8PH+3DmxZdvvBsiT7M8DguMMY05vgqRuKn8HwmWMXdAgJfpTR5U5BIyaR+lIROQD2JIjwmIBCidlwe5tb8W8TljrWNeQ5UrbN+dyBLKfEjprmL3LYdKLqNOL1/IIzgke0edtOk5me6dBJSXFEHjmvFNZCR5PgWEqVqPQo6UJY94HcSUD84o6o68=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e59f6e2c-65e3-4905-2455-08dcc7eb1991
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 05:26:14.5700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGFCLH1mdEPxMvkmZ9HN+c/kfN+UeIeQTK/x/JfYqgWDLN3TuBdwP/+txqOMPjM1/hrNgLkLp23Yusx3blWVVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408290037
X-Proofpoint-ORIG-GUID: jH6V55kSgls8XU1HevCt97sl0qWSfBGT
X-Proofpoint-GUID: jH6V55kSgls8XU1HevCt97sl0qWSfBGT

From: Eugene Loh <eugene.loh@oracle.com>

Each output record has an EPID associated with it.  When the consumer
reads a record, it uses the EPID to look up both a PRID (so it can
report PRID and probe function and name) and a data description.
During code generation, the PRID and data description are known,
and so the EPID is set during relocation.

However, we want to support underlying probes that trigger for PRIDs
that will be discovered at run time.  So, expand the EPID to 64 bits:

*)  the lower half, known at code generation, will index into an
    array dtp->dt_stmts[] of statements, which have information
    about probe descriptions, data descriptions, and clauses to call

*)  the upper half will have the PRID, which will be discovered
    at run time

Statement descriptions include a new member dtsd_index, which is
the index to dtp->dt_stmts[].

The consumer gets information about the firing probe from the PRID,
an index to dtp->dt_probes[].

The lower half "EPID" depends only on the statement and no longer
on the specific probe that is firing.  Its value is known at code
generation for a compiled clause.  It no longer needs to be set in
relocation;  that relocation will be removed in a future patch.

The buffer memory pointed to by dctx->buf is rearranged so that EPID
will (still) fall on an 8-byte boundary but now take up 8 bytes.

We do not need to expand:

- the mstate (since it already had the PRID)

  Rename mstate's epid to be a statement ID, stid.  When
  the producer needs the epid, it can construct it from
  mst->prid and mst->stid.

- the output buffer (since it already had unused padding)

The new, wider EPID is seen for the built-in variable epid as well
as the epid that the consumer reads.

The probe descriptions dt_pdesc become superfluous and will be
eliminated in a future patch.

Update test files:

- Where the upper 32 bits of the EPID are known (since the PRID
  corresponds to a dtrace::: probe), update the expected EPID in
  the .r files.

- Where the upper 32 bits of the EPID are not known, add .r.p
  processing to filter those bits out before comparing to known
  results in .r files.

- Increase expected EPID width.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 bpf/get_bvar.c                                |  6 ++-
 bpf/probe_error.c                             |  2 +-
 include/dtrace/universal.h                    |  2 +-
 libdtrace/dt_bpf.c                            |  2 -
 libdtrace/dt_cc.c                             | 13 ++---
 libdtrace/dt_cg.c                             | 49 +++++++++++--------
 libdtrace/dt_consume.c                        | 28 +++++++----
 libdtrace/dt_dctx.h                           | 16 +++---
 libdtrace/dt_handle.c                         |  9 ++--
 libdtrace/dt_impl.h                           |  1 +
 libdtrace/dt_map.c                            | 11 +++--
 libdtrace/dt_open.c                           |  2 +-
 libdtrace/dt_program.c                        |  7 +++
 libdtrace/dtrace.h                            |  1 +
 test/demo/dtrace/error.r                      |  2 +-
 test/stress/buffering/tst.resize3-manual.r    |  2 +-
 test/stress/buffering/tst.resize3.r           |  2 +-
 test/unittest/actions/setopt/tst.badopt.r     | 14 +++---
 .../arrays/tst.declared-bounds.runtime_out.r  |  2 +-
 test/unittest/codegen/err.deref_0.r           |  2 +-
 test/unittest/codegen/err.deref_1.r           |  2 +-
 test/unittest/codegen/err.deref_i0.r          |  2 +-
 test/unittest/codegen/err.deref_i1.r          |  2 +-
 .../unittest/codegen/err.deref_string-assoc.r |  2 +-
 test/unittest/codegen/err.deref_string-gvar.r |  2 +-
 test/unittest/codegen/err.deref_string-lvar.r |  2 +-
 test/unittest/codegen/err.deref_string-tvar.r |  2 +-
 .../codegen/err.str_NULL_plus_offset-assoc.r  |  2 +-
 .../codegen/err.str_NULL_plus_offset-lvar.r   |  2 +-
 .../codegen/err.str_NULL_plus_offset-tvar.r   |  2 +-
 .../codegen/err.str_NULL_plus_offset.r        |  2 +-
 test/unittest/disasm/tst.vartab-bvar.r        |  2 +-
 test/unittest/drops/drp.DTRACEDROP_DBLERROR.r |  2 +-
 .../tst.DTRACEFLT_BADADDR.null_ptr_field.r    |  2 +-
 test/unittest/error/tst.DTRACEFLT_BADADDR.r   |  4 +-
 test/unittest/error/tst.DTRACEFLT_BADADDR2.r  |  4 +-
 .../error/tst.DTRACEFLT_DIVZERO.div.r         |  2 +-
 .../error/tst.DTRACEFLT_DIVZERO.mod.r         |  2 +-
 test/unittest/error/tst.DTRACEFLT_UNKNOWN.r   |  4 +-
 .../error/tst.clause_scope-begin-ended.r      |  2 +-
 test/unittest/error/tst.clause_scope-begin.r  |  2 +-
 .../unittest/error/tst.clause_scope-regular.r |  2 +-
 .../error/tst.clause_scope-regular.r.p        | 12 ++++-
 test/unittest/error/tst.error.r               |  2 +-
 test/unittest/error/tst.errorend.r            |  2 +-
 .../alloca/err.alloca-bcopy-before-beyond.r   |  2 +-
 .../alloca/err.alloca-bcopy-before-bottom.r   |  2 +-
 .../alloca/err.alloca-bcopy-beyond-top.r      |  2 +-
 .../alloca/err.alloca-bcopy-crossing-bottom.r |  2 +-
 .../alloca/err.alloca-bcopy-crossing-top.r    |  2 +-
 .../alloca/err.alloca-crossing-clauses.r      |  2 +-
 .../alloca/err.alloca-load-before-bottom.r    |  2 +-
 .../funcs/alloca/err.alloca-load-beyond-top.r |  2 +-
 .../alloca/err.alloca-load-crossing-bottom.r  |  2 +-
 .../alloca/err.alloca-null-deref-lvalue.r     |  2 +-
 .../funcs/alloca/err.alloca-null-deref.r      |  2 +-
 .../err.alloca-scratch-exceeding-bcopy.r      |  2 +-
 .../alloca/err.alloca-store-before-bottom.r   |  2 +-
 .../alloca/err.alloca-store-beyond-top.r      |  2 +-
 .../alloca/err.alloca-store-crossing-bottom.r |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy1.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy4.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy5.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy6.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy7.r     |  2 +-
 test/unittest/funcs/bcopy/err.badbcopy8.r     |  2 +-
 test/unittest/funcs/copyin/err.badaddr.r      |  2 +-
 test/unittest/funcs/copyin/err.null_arg1.r    |  2 +-
 test/unittest/funcs/copyinstr/err.badaddr.r   |  2 +-
 test/unittest/funcs/copyinstr/err.null_arg1.r |  2 +-
 test/unittest/funcs/copyinto/err.badaddr.r    |  2 +-
 test/unittest/funcs/copyinto/err.badsize.r    |  2 +-
 test/unittest/funcs/copyinto/err.null_arg1.r  |  2 +-
 test/unittest/funcs/err.badalloca.r           |  2 +-
 test/unittest/funcs/err.badalloca.r.p         | 12 ++++-
 test/unittest/funcs/err.link_ntopbadaddr.r    |  2 +-
 test/unittest/funcs/err.link_ntopbadarg.r     |  2 +-
 .../inet_ntoa6/err.inet_ntoa6.arg1_null.r     |  2 +-
 .../err.inet_ntoa6.arg1_null_const.r          |  2 +-
 test/unittest/funcs/strlen/tst.null.r         |  2 +-
 test/unittest/funcs/strtok/tst.strtok_null.r  |  2 +-
 .../funcs/strtok/tst.strtok_nulldel.r         |  2 +-
 .../funcs/strtok/tst.strtok_nullstr.r         |  2 +-
 .../funcs/strtok/tst.strtok_nullstr2.r        |  2 +-
 .../funcs/substr/err.substr_null_arg1.r       |  2 +-
 test/unittest/pointers/err.AllocaOverrun.r    |  2 +-
 test/unittest/pointers/err.BadAlign.r         |  2 +-
 test/unittest/pointers/err.InvalidAddress2.r  |  2 +-
 test/unittest/pointers/err.InvalidAddress4.r  |  2 +-
 .../speculation/err.CommitWithInvalid.r       |  2 +-
 .../speculation/err.DiscardWithInvalid.r      |  2 +-
 test/unittest/speculation/tst.negcommit.r     |  2 +-
 92 files changed, 197 insertions(+), 146 deletions(-)

diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
index a0c04f3a..e9733bb1 100644
--- a/bpf/get_bvar.c
+++ b/bpf/get_bvar.c
@@ -48,8 +48,10 @@ noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
 			mst->tstamp = bpf_ktime_get_ns();
 
 		return mst->tstamp;
-	case DIF_VAR_EPID:
-		return mst->epid;
+	case DIF_VAR_EPID: {
+		uint64_t val = mst->prid;
+		return (val << 32) | mst->stid;
+	}
 	case DIF_VAR_ID:
 		return mst->prid;
 	case DIF_VAR_ARG0: case DIF_VAR_ARG1: case DIF_VAR_ARG2:
diff --git a/bpf/probe_error.c b/bpf/probe_error.c
index ee1a1793..fba779a8 100644
--- a/bpf/probe_error.c
+++ b/bpf/probe_error.c
@@ -29,7 +29,7 @@ noinline void dt_probe_error(const dt_dctx_t *dctx, uint64_t pc, uint64_t fault,
 	int		oldprid = mst->prid;
 
 	mst->argv[0] = 0;
-	mst->argv[1] = mst->epid;
+	mst->argv[1] = (((uint64_t)mst->prid) << 32) | mst->stid;
 	mst->argv[2] = mst->clid;
 	mst->argv[3] = pc;
 	mst->argv[4] = fault;
diff --git a/include/dtrace/universal.h b/include/dtrace/universal.h
index d6562489..655ea772 100644
--- a/include/dtrace/universal.h
+++ b/include/dtrace/universal.h
@@ -37,7 +37,7 @@ typedef uint16_t	dtrace_actkind_t;	/* action kind */
 
 typedef uint32_t	dtrace_aggid_t;		/* aggregation identifier */
 typedef uint32_t	dtrace_cacheid_t;	/* predicate cache identifier */
-typedef uint32_t	dtrace_epid_t;		/* enabled probe identifier */
+typedef uint64_t	dtrace_epid_t;		/* enabled probe identifier */
 typedef uint32_t	dtrace_optid_t;		/* option identifier */
 typedef uint32_t	dtrace_specid_t;	/* speculation identifier */
 
diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 70597d65..3f9c42ea 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -774,7 +774,6 @@ gmap_create_cpuinfo(dtrace_hdl_t *dtp)
  * The size of the memory region is the sum of:
  *	- size of the DTrace machine state, rounded up to the nearest
  *	  multiple of 8
- *	- 8 bytes padding for trace buffer alignment purposes
  *	- maximum trace buffer record size, rounded up to the nearest
  *	  multiple of 8
  *	- size of dctx->mem (see dt_dctx.h)
@@ -783,7 +782,6 @@ static int
 gmap_create_mem(dtrace_hdl_t *dtp)
 {
 	size_t	sz = roundup(sizeof(dt_mstate_t), 8) +
-		     8 +
 		     roundup(dtp->dt_maxreclen, 8) +
 		     DMEM_SIZE(dtp);
 
diff --git a/libdtrace/dt_cc.c b/libdtrace/dt_cc.c
index d1ee3843..cf3c5504 100644
--- a/libdtrace/dt_cc.c
+++ b/libdtrace/dt_cc.c
@@ -123,6 +123,7 @@ dt_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdesc_t *edp,
 	if (sdp == NULL)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
 
+	sdp->dtsd_index = dtp->dt_clause_nextid++;
 	assert(yypcb->pcb_stmt == NULL);
 	yypcb->pcb_stmt = sdp;
 	yypcb->pcb_maxrecs = 0;
@@ -133,8 +134,8 @@ dt_stmt_create(dtrace_hdl_t *dtp, dtrace_ecbdesc_t *edp,
 	return sdp;
 }
 
-static dt_ident_t *
-dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
+static void
+dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp, dtrace_stmtdesc_t *sdp)
 {
 	char		*name;
 	int		len;
@@ -156,12 +157,12 @@ dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
 	/*
 	 * Generate a symbol name.
 	 */
-	len = snprintf(NULL, 0, "dt_clause_%d", dtp->dt_clause_nextid) + 1;
+	len = snprintf(NULL, 0, "dt_clause_%d", sdp->dtsd_index) + 1;
 	name = dt_alloc(dtp, len);
 	if (name == NULL)
 		longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
 
-	snprintf(name, len, "dt_clause_%d", dtp->dt_clause_nextid++);
+	snprintf(name, len, "dt_clause_%d", sdp->dtsd_index);
 
 	/*
 	 * Add the symbol to the BPF identifier table and associate the DIFO
@@ -174,7 +175,7 @@ dt_clause_create(dtrace_hdl_t *dtp, dtrace_difo_t *dp)
 
 	dt_ident_set_data(idp, dp);
 
-	return idp;
+	sdp->dtsd_clause = idp;
 }
 
 static void
@@ -214,7 +215,7 @@ dt_compile_one_clause(dtrace_hdl_t *dtp, dt_node_t *cnp, dt_node_t *pnp)
 	 * Compile the clause (predicate and action).
 	 */
 	dt_cg(yypcb, cnp);
-	sdp->dtsd_clause = dt_clause_create(dtp, dt_as(yypcb));
+	dt_clause_create(dtp, dt_as(yypcb), sdp);
 
 	assert(yypcb->pcb_stmt == sdp);
 	if (dtrace_stmt_add(yypcb->pcb_hdl, yypcb->pcb_prog, sdp) != 0)
diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index a7861829..2c559868 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -277,15 +277,9 @@ dt_cg_tramp_prologue_act(dt_pcb_t *pcb, dt_activity_t act)
 	 *	buf = rc + roundup(sizeof(dt_mstate_t), 8);
 	 *				// add %r0, roundup(
 	 *						sizeof(dt_mstate_t), 8)
-	 *	*((uint64_t *)&buf[0]) = 0;
-	 *				// stdw [%r0 + 0], 0
-	 *	buf += 8;		// add %r0, 8
-	 *				//     (%r0 = pointer to buffer space)
 	 *	dctx.buf = buf;		// stdw [%r9 + DCTX_BUF], %r0
 	 */
 	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, roundup(sizeof(dt_mstate_t), 8)));
-	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, 0, 0));
-	emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_0, 8));
 	emit(dlp,  BPF_STORE(BPF_DW, BPF_REG_9, DCTX_BUF, BPF_REG_0));
 
 	/*
@@ -1057,10 +1051,8 @@ static void
 dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 {
 	dt_irlist_t	*dlp = &pcb->pcb_ir;
-	dt_ident_t	*epid = dt_dlib_get_var(pcb->pcb_hdl, "EPID");
 	dt_ident_t	*clid = dt_dlib_get_var(pcb->pcb_hdl, "CLID");
 
-	assert(epid != NULL);
 	assert(clid != NULL);
 
 	/*
@@ -1093,18 +1085,22 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 	 *				// stdw [%r0 + DMST_FAULT], 0
 	 *	dctx->mst->tstamp = 0;	// stdw [%r0 + DMST_TSTAMP], 0
 	 *	dctx->mst->specsize = 0;// stdw [%r0 + DMST_SPECSIZE], 0
-	 *	dctx->mst->epid = EPID;	// stw [%r0 + DMST_EPID], EPID
+	 *	dctx->mst->stid = STID;	// stw [%r0 + DMST_STID], STID
 	 *	dctx->mst->clid = CLID;	// stw [%r0 + DMST_CLID], CLID
-	 *	*((uint32_t *)&buf[DBUF_EPID]) = EPID;
-	 *				// stw [%r9 + DBUF_EPID], EPID
 	 */
 	emit(dlp,  BPF_LOAD(BPF_DW, BPF_REG_0, BPF_REG_0, DCTX_MST));
 	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_FAULT, 0));
 	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_TSTAMP, 0));
 	emit(dlp,  BPF_STORE_IMM(BPF_DW, BPF_REG_0, DMST_SPECSIZE, 0));
-	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_EPID, -1), epid);
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_STID, pcb->pcb_stmt->dtsd_index));
 	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_0, DMST_CLID, -1), clid);
-	emite(dlp, BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_EPID, -1), epid);
+
+	/*
+	 *	Zero out the leading 4 bytes of the buffer.
+	 *	*((uint32_t *)&buf[DBUF_PAD]) = 0;
+	 *				// stw [%r9 + DBUF_PAD], 0
+	 */
+	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_PAD, 0));
 
 	/*
 	 *	Set the speculation ID field to zero to indicate no active
@@ -1114,6 +1110,18 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 	 */
 	emit(dlp,  BPF_STORE_IMM(BPF_W, BPF_REG_9, DBUF_SPECID, 0));
 
+	/*
+	 *	*((uint64_t *)&buf[DBUF_EPID]) = (dctx->mst->prid << 32) | stid;
+	 *				// ld %r1, [%r0 + DMST_PRID]
+	 *				// lsh %r1, 32
+	 *				// or %r1, stid
+	 *				// stdw [%r9 + DBUF_EPID], %r1
+	 */
+	emit (dlp, BPF_LOAD(BPF_W, BPF_REG_1, BPF_REG_0, DMST_PRID));
+	emit (dlp, BPF_ALU64_IMM(BPF_LSH, BPF_REG_1, 32));
+	emit (dlp, BPF_ALU64_IMM(BPF_OR, BPF_REG_1, pcb->pcb_stmt->dtsd_index));
+	emit (dlp, BPF_STORE(BPF_DW, BPF_REG_9, DBUF_EPID, BPF_REG_1));
+
 	/*
 	 * If there is a predicate:
 	 *
@@ -1132,10 +1140,9 @@ dt_cg_prologue(dt_pcb_t *pcb, dt_node_t *pred)
 	TRACE_REGSET("Prologue: End  ");
 
 	/*
-	 * Account for 32-bit EPID (at offset 0) and 32-bit speculation ID (at
-	 * offset 4).
+	 * Set the offset for the beginning of trace data.
 	 */
-	pcb->pcb_bufoff += 2 * sizeof(uint32_t);
+	pcb->pcb_bufoff = DBUF_DATA;
 }
 
 /*
@@ -1170,15 +1177,15 @@ dt_cg_epilogue(dt_pcb_t *pcb)
 		/*
 		 *	rc = bpf_perf_event_output(dctx->ctx, &buffers,
 		 *				   BPF_F_CURRENT_CPU,
-		 *				   buf - 4, bufoff + 4);
+		 *				   buf + 4, bufoff - 4);
 		 *				// lddw %r1, [%fp + DT_STK_DCTX]
 		 *				// lddw %r1, [%r1 + DCTX_CTX]
 		 *				// lddw %r2, &buffers
 		 *				// lddw %r3, BPF_F_CURRENT_CPU
 		 *				// mov %r4, %r9
-		 *				// add %r4, -4
+		 *				// add %r4, 4
 		 *				// mov %r5, pcb->pcb_bufoff
-		 *				// add %r5, 4
+		 *				// add %r5, -4
 		 *				// call bpf_perf_event_output
 		 */
 		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_1, BPF_REG_FP, DT_STK_DCTX));
@@ -1186,9 +1193,9 @@ dt_cg_epilogue(dt_pcb_t *pcb)
 		dt_cg_xsetx(dlp, buffers, DT_LBL_NONE, BPF_REG_2, buffers->di_id);
 		dt_cg_xsetx(dlp, NULL, DT_LBL_NONE, BPF_REG_3, BPF_F_CURRENT_CPU);
 		emit(dlp, BPF_MOV_REG(BPF_REG_4, BPF_REG_9));
-		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, -4));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_4, 4));
 		emit(dlp, BPF_MOV_IMM(BPF_REG_5, pcb->pcb_bufoff));
-		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, 4));
+		emit(dlp, BPF_ALU64_IMM(BPF_ADD, BPF_REG_5, -4));
 		emit(dlp, BPF_CALL_HELPER(BPF_FUNC_perf_event_output));
 
 		/*
diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
index 51eb6c80..e3ce2d3b 100644
--- a/libdtrace/dt_consume.c
+++ b/libdtrace/dt_consume.c
@@ -15,9 +15,11 @@
 #include <alloca.h>
 #include <dt_impl.h>
 #include <dt_aggregate.h>
+#include <dt_dctx.h>
 #include <dt_module.h>
 #include <dt_pcap.h>
 #include <dt_peb.h>
+#include <dt_probe.h>
 #include <dt_state.h>
 #include <dt_string.h>
 #include <libproc.h>
@@ -479,7 +481,7 @@ dt_flowindent(dtrace_hdl_t *dtp, dtrace_probedata_t *data, dtrace_epid_t last)
 	 */
 	if (flow == DTRACEFLOW_ENTRY) {
 		if (last != DTRACE_EPIDNONE && id != last &&
-		    pd->id == dtp->dt_pdesc[last]->id)
+		    pd->id == dtp->dt_probes[last >> 32]->desc->id)
 			flow = DTRACEFLOW_NONE;
 	}
 
@@ -2184,19 +2186,23 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 		     int peekflags, dtrace_epid_t *last, int committing,
 		     void *arg)
 {
+	int			specid;
 	dtrace_epid_t		epid;
+	uint32_t		prid;
 	dtrace_datadesc_t	*epd;
 	dt_spec_buf_t		tmpl;
 	dt_spec_buf_t		*dtsb;
-	int			specid;
 	int			i;
 	int			rval;
 	dtrace_workstatus_t	ret;
 	int			commit_discard_seen, only_commit_discards;
 	int			data_recording = 1;
 
-	epid = ((uint32_t *)data)[0];
-	specid = ((uint32_t *)data)[1];
+	specid = *((uint32_t *)(data + DBUF_SPECID));
+	epid = *((uint64_t *)(data + DBUF_EPID));
+	prid = epid >> 32;
+	if (prid > dtp->dt_probe_id)
+		return dt_set_errno(dtp, EDT_BADEPID);
 
 	/*
 	 * Fill in the epid and address of the epid in the buffer.  We need to
@@ -2209,6 +2215,7 @@ dt_consume_one_probe(dtrace_hdl_t *dtp, FILE *fp, char *data, uint32_t size,
 					 &pdat->dtpda_pdesc);
 	if (rval != 0)
 		return dt_set_errno(dtp, EDT_BADEPID);
+	pdat->dtpda_pdesc = (dtrace_probedesc_t *)dtp->dt_probes[prid]->desc;
 
 	epd = pdat->dtpda_ddesc;
 	if (epd->dtdd_uarg != DT_ECB_DEFAULT) {
@@ -2639,9 +2646,8 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
 		 * struct {
 		 *	struct perf_event_header	header;
 		 *	uint32_t			size;
-		 *	uint32_t			pad;
-		 *	uint32_t			epid;
 		 *	uint32_t			specid;
+		 *	dtrace_epid_t			epid;
 		 *	uint64_t			data[n];
 		 * }
 		 * and 'data' points to the 'size' member at this point.
@@ -2651,13 +2657,17 @@ dt_consume_one(dtrace_hdl_t *dtp, FILE *fp, char *buf,
 			return dt_set_errno(dtp, EDT_DSIZE);
 
 		size = *(uint32_t *)data;
-		data += sizeof(size);
 		ptr += sizeof(size) + size;
 		if (ptr != buf + hdr->size)
 			return dt_set_errno(dtp, EDT_DSIZE);
 
-		data += sizeof(uint32_t);		/* skip padding */
-		size -= sizeof(uint32_t);
+		/*
+		 * The "size" measures from specid to the end.  But our buffer
+		 * offsets are relative to &size itself, to preserve 8-byte
+		 * alignment.  So, we leave data pointing at &size, and we
+		 * increase size by 4 bytes.
+		 */
+		size += 4;
 
 		return dt_consume_one_probe(dtp, fp, data, size, pdat, efunc,
 					    rfunc, flow, quiet, peekflags,
diff --git a/libdtrace/dt_dctx.h b/libdtrace/dt_dctx.h
index 1422ad24..6592bef1 100644
--- a/libdtrace/dt_dctx.h
+++ b/libdtrace/dt_dctx.h
@@ -18,7 +18,7 @@
  * The DTrace machine state.
  */
 typedef struct dt_mstate {
-	uint32_t	epid;		/* Enabled probe ID */
+	uint32_t	stid;		/* Statement ID */
 	uint32_t	prid;		/* Probe ID */
 	uint32_t	clid;		/* Clause ID (unique per probe) */
 	uint32_t	tag;		/* Tag (for future use) */
@@ -33,7 +33,7 @@ typedef struct dt_mstate {
 	uint64_t	saved_argv[10];	/* Saved probe arguments */
 } dt_mstate_t;
 
-#define DMST_EPID		offsetof(dt_mstate_t, epid)
+#define DMST_STID		offsetof(dt_mstate_t, stid)
 #define DMST_PRID		offsetof(dt_mstate_t, prid)
 #define DMST_CLID		offsetof(dt_mstate_t, clid)
 #define DMST_TAG		offsetof(dt_mstate_t, tag)
@@ -82,16 +82,20 @@ typedef struct dt_dctx {
  * The dctx->buf pointer references a block of memory that contains:
  *
  *                       +----------------+
- *                  0 -> | EPID           |
+ *                  0 -> | pad            |
  *                       +----------------+
- *		    4 -> | Speculation ID |
+ *                  4 -> | Speculation ID |
  *                       +----------------+
- *                       | Trace Data     |
+ *                  8 -> | EPID           |
+ *                       +----------------+
+ *                 16 -> | Trace Data     |
  *                       |      ...       |
  *                       +----------------+
  */
-#define DBUF_EPID	0
+#define DBUF_PAD	0
 #define DBUF_SPECID	4
+#define DBUF_EPID	8
+#define DBUF_DATA	16
 
 /*
  * The dctx->mem pointer references a block of memory that contains:
diff --git a/libdtrace/dt_handle.c b/libdtrace/dt_handle.c
index 4c9b9413..b1ba5f9f 100644
--- a/libdtrace/dt_handle.c
+++ b/libdtrace/dt_handle.c
@@ -14,6 +14,7 @@
 #include <alloca.h>
 
 #include <dt_impl.h>
+#include <dt_probe.h>
 #include <dt_program.h>
 
 static const char _dt_errprog[] =
@@ -147,11 +148,11 @@ dt_handle_err(dtrace_hdl_t *dtp, dtrace_probedata_t *data)
 	 * This is an error.  We have the following items here:  EPID,
 	 * faulting action, BPF pc, fault code and faulting address.
 	 */
-	epid = (uint32_t)DT_REC(uint64_t, 0);
+	epid = DT_REC(uint64_t, 0);
 
 	if (dt_epid_lookup(dtp, epid, &errdd, &errpd) != 0)
 		return dt_set_errno(dtp, EDT_BADERROR);
-
+	errpd = (dtrace_probedesc_t *)dtp->dt_probes[epid>>32]->desc;
 	err.dteda_ddesc = errdd;
 	err.dteda_pdesc = errpd;
 	err.dteda_cpu = data->dtpda_cpu;
@@ -195,7 +196,7 @@ no_addr:
 		details[0] = 0;
 	}
 
-	snprintf(str, len, "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): "
+	snprintf(str, len, "error on enabled probe ID %lu (ID %u: %s:%s:%s:%s): "
 			   "%s%s in %s%s",
 		 epid, errpd->id, errpd->prv, errpd->mod, errpd->fun,
 		 errpd->prb, dtrace_faultstr(dtp, err.dteda_fault), details,
@@ -256,7 +257,7 @@ dt_handle_liberr(dtrace_hdl_t *dtp, const dtrace_probedata_t *data,
 	str = alloca(len);
 
 	snprintf(str, len,
-		 "error on enabled probe ID %u (ID %u: %s:%s:%s:%s): %s",
+		 "error on enabled probe ID %lu (ID %u: %s:%s:%s:%s): %s",
 		 data->dtpda_epid, errpd->id, errpd->prv, errpd->mod,
 		 errpd->fun, errpd->prb, faultstr);
 
diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
index 98fddc23..a2ae84f6 100644
--- a/libdtrace/dt_impl.h
+++ b/libdtrace/dt_impl.h
@@ -275,6 +275,7 @@ struct dtrace_hdl {
 	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
 	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
 	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
+	dtrace_stmtdesc_t **dt_stmts; /* array of stmts */
 	struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by dx_id */
 	id_t dt_xlatorid;	/* next dt_xlator_t id to assign */
 	dt_ident_t *dt_externs;	/* linked list of external symbol identifiers */
diff --git a/libdtrace/dt_map.c b/libdtrace/dt_map.c
index 60a2eca2..87ce5707 100644
--- a/libdtrace/dt_map.c
+++ b/libdtrace/dt_map.c
@@ -138,14 +138,17 @@ int
 dt_epid_lookup(dtrace_hdl_t *dtp, dtrace_epid_t epid, dtrace_datadesc_t **ddp,
 	       dtrace_probedesc_t **pdp)
 {
-	if (epid >= dtp->dt_maxprobe ||
-	    dtp->dt_ddesc[epid] == NULL || dtp->dt_pdesc[epid] == NULL)
+	/* Remove the PRID portion of the EPID. */
+	epid &= 0xffffffff;
+
+	if (epid >= dtp->dt_clause_nextid)
 		return -1;
 
-	*ddp = dtp->dt_ddesc[epid];
+	dtrace_difo_t *rdp = dt_dlib_get_func_difo(dtp, dtp->dt_stmts[epid]->dtsd_clause);
+	*ddp = dt_datadesc_hold(rdp->dtdo_ddesc);             // FIXME what releases the hold?
 	*pdp = dtp->dt_pdesc[epid];
 
-	return 0;
+	return (*ddp == NULL) ? -1 : 0;
 }
 
 void
diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
index 77ffb6d2..8ae6cdfa 100644
--- a/libdtrace/dt_open.c
+++ b/libdtrace/dt_open.c
@@ -170,7 +170,7 @@ static const dt_ident_t _dtrace_globals[] = {
 { "discard", DT_IDENT_ACTFUNC, 0, DT_ACT_DISCARD, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_func, "void(int)" },
 { "epid", DT_IDENT_SCALAR, 0, DIF_VAR_EPID, DT_ATTR_STABCMN, DT_VERS_1_0,
-	&dt_idops_type, "uint_t" },
+	&dt_idops_type, "uint64_t" },
 { "errno", DT_IDENT_SCALAR, 0, DIF_VAR_ERRNO, DT_ATTR_STABCMN, DT_VERS_1_0,
 	&dt_idops_type, "int" },
 { "execname", DT_IDENT_SCALAR, 0, DIF_VAR_EXECNAME,
diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
index afbf7265..ee743589 100644
--- a/libdtrace/dt_program.c
+++ b/libdtrace/dt_program.c
@@ -165,6 +165,13 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
 	dtrace_probedesc_t	*pdp = &sdp->dtsd_ecbdesc->dted_probe;
 	int			rc;
 
+	if (dtp->dt_stmts == NULL) {
+		dtp->dt_stmts = dt_calloc(dtp, dtp->dt_clause_nextid, sizeof(dtrace_stmtdesc_t *));
+		if (dtp->dt_stmts == NULL)
+			return dt_set_errno(dtp, EDT_NOMEM);
+	}
+	dtp->dt_stmts[sdp->dtsd_index] = sdp;
+
 	st.cnt = cnt;
 	st.sdp = sdp;
 	rc = dt_probe_iter(dtp, pdp, (dt_probe_f *)dt_stmt_probe, NULL, &st);
diff --git a/libdtrace/dtrace.h b/libdtrace/dtrace.h
index 09a87977..a23052e4 100644
--- a/libdtrace/dtrace.h
+++ b/libdtrace/dtrace.h
@@ -150,6 +150,7 @@ typedef struct dtrace_stmtdesc {
 	dtrace_attribute_t dtsd_descattr;	/* probedesc attributes */
 	dtrace_attribute_t dtsd_stmtattr;	/* statement attributes */
 	int dtsd_clauseflags;			/* clause flags */
+	int dtsd_index;				/* index in dtp->dt_stmts */
 } dtrace_stmtdesc_t;
 
 /* dtsd clause flags */
diff --git a/test/demo/dtrace/error.r b/test/demo/dtrace/error.r
index d3904f47..50b52370 100644
--- a/test/demo/dtrace/error.r
+++ b/test/demo/dtrace/error.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/demo/dtrace/error.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/stress/buffering/tst.resize3-manual.r b/test/stress/buffering/tst.resize3-manual.r
index 43b647c7..5493783e 100644
--- a/test/stress/buffering/tst.resize3-manual.r
+++ b/test/stress/buffering/tst.resize3-manual.r
@@ -1,5 +1,5 @@
                    FUNCTION:NAME
-                          :BEGIN           3
+                          :BEGIN            4294967297
                           :BEGIN 
 
 -- @@stderr --
diff --git a/test/stress/buffering/tst.resize3.r b/test/stress/buffering/tst.resize3.r
index 9c471158..807c4d1c 100644
--- a/test/stress/buffering/tst.resize3.r
+++ b/test/stress/buffering/tst.resize3.r
@@ -1,5 +1,5 @@
                    FUNCTION:NAME
-                          :BEGIN           3
+                          :BEGIN            4294967297
                           :BEGIN 
 
 -- @@stderr --
diff --git a/test/unittest/actions/setopt/tst.badopt.r b/test/unittest/actions/setopt/tst.badopt.r
index 29e39fd4..9373951c 100644
--- a/test/unittest/actions/setopt/tst.badopt.r
+++ b/test/unittest/actions/setopt/tst.badopt.r
@@ -1,16 +1,16 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): couldn't set option "Nixon" to "1": Invalid option name
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): couldn't set option "Harding" to "1": Invalid option name
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): couldn't set option "Hoover" to "1": Invalid option name
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): couldn't set option "Bush" to "1": Invalid option name
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): couldn't set option "quiet" to "um, no": Invalid value for specified option
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): couldn't set option "aggrate" to "0.5hz": Invalid value for specified option
 
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): couldn't set option "bufsize" to "1m": Operation illegal when tracing is active
 
diff --git a/test/unittest/arrays/tst.declared-bounds.runtime_out.r b/test/unittest/arrays/tst.declared-bounds.runtime_out.r
index 4917528d..43892f61 100644
--- a/test/unittest/arrays/tst.declared-bounds.runtime_out.r
+++ b/test/unittest/arrays/tst.declared-bounds.runtime_out.r
@@ -1,3 +1,3 @@
 expected run-time error
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): index out of bounds (8) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): index out of bounds (8) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_0.r b/test/unittest/codegen/err.deref_0.r
index 07c1dc52..654b9ece 100644
--- a/test/unittest/codegen/err.deref_0.r
+++ b/test/unittest/codegen/err.deref_0.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_1.r b/test/unittest/codegen/err.deref_1.r
index a2ca8ac4..d4a80bb3 100644
--- a/test/unittest/codegen/err.deref_1.r
+++ b/test/unittest/codegen/err.deref_1.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_i0.r b/test/unittest/codegen/err.deref_i0.r
index 07c1dc52..654b9ece 100644
--- a/test/unittest/codegen/err.deref_i0.r
+++ b/test/unittest/codegen/err.deref_i0.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address (0) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_i1.r b/test/unittest/codegen/err.deref_i1.r
index a2ca8ac4..d4a80bb3 100644
--- a/test/unittest/codegen/err.deref_i1.r
+++ b/test/unittest/codegen/err.deref_i1.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address (1) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_string-assoc.r b/test/unittest/codegen/err.deref_string-assoc.r
index 08277992..aa78c6eb 100644
--- a/test/unittest/codegen/err.deref_string-assoc.r
+++ b/test/unittest/codegen/err.deref_string-assoc.r
@@ -1,3 +1,3 @@
 66
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_string-gvar.r b/test/unittest/codegen/err.deref_string-gvar.r
index 08277992..aa78c6eb 100644
--- a/test/unittest/codegen/err.deref_string-gvar.r
+++ b/test/unittest/codegen/err.deref_string-gvar.r
@@ -1,3 +1,3 @@
 66
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_string-lvar.r b/test/unittest/codegen/err.deref_string-lvar.r
index 08277992..aa78c6eb 100644
--- a/test/unittest/codegen/err.deref_string-lvar.r
+++ b/test/unittest/codegen/err.deref_string-lvar.r
@@ -1,3 +1,3 @@
 66
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
diff --git a/test/unittest/codegen/err.deref_string-tvar.r b/test/unittest/codegen/err.deref_string-tvar.r
index 08277992..aa78c6eb 100644
--- a/test/unittest/codegen/err.deref_string-tvar.r
+++ b/test/unittest/codegen/err.deref_string-tvar.r
@@ -1,3 +1,3 @@
 66
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): invalid address (1) in action #2 at BPF pc NNN
diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r b/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
+++ b/test/unittest/codegen/err.str_NULL_plus_offset-assoc.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r b/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
+++ b/test/unittest/codegen/err.str_NULL_plus_offset-lvar.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r b/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
+++ b/test/unittest/codegen/err.str_NULL_plus_offset-tvar.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/codegen/err.str_NULL_plus_offset.r b/test/unittest/codegen/err.str_NULL_plus_offset.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/codegen/err.str_NULL_plus_offset.r
+++ b/test/unittest/codegen/err.str_NULL_plus_offset.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/disasm/tst.vartab-bvar.r b/test/unittest/disasm/tst.vartab-bvar.r
index 06d7c52b..53e5f618 100644
--- a/test/unittest/disasm/tst.vartab-bvar.r
+++ b/test/unittest/disasm/tst.vartab-bvar.r
@@ -4,7 +4,7 @@ curthread               scl glb r    D type (pointer) (size 8)
 timestamp               scl glb r    D type (integer) (size 8)
 vtimestamp              scl glb r    D type (integer) (size 8)
 ipl                     scl glb r    D type (integer) (size 4)
-epid                    scl glb r    D type (integer) (size 4)
+epid                    scl glb r    D type (integer) (size 8)
 id                      scl glb r    D type (integer) (size 4)
 arg0                    scl glb r    D type (integer) (size 8)
 arg1                    scl glb r    D type (integer) (size 8)
diff --git a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
index 9fa54dd9..b62b05f3 100644
--- a/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
+++ b/test/unittest/drops/drp.DTRACEDROP_DBLERROR.r
@@ -4,4 +4,4 @@
 -- @@stderr --
 dtrace: script 'test/unittest/drops/drp.DTRACEDROP_DBLERROR.d' matched 3 probes
 dtrace: [DTRACEDROP_DBLERROR] 1 error in ERROR probe enabling
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.null_ptr_field.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR.r b/test/unittest/error/tst.DTRACEFLT_BADADDR.r
index b9f5f43c..3fe68c05 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR.r
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR.r
@@ -1,6 +1,6 @@
-The arguments are 3 1 1 0
+The arguments are 4294967297 1 1 0
 The value of arg4 should be 1
 The value of arg5 should be 0
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_BADADDR2.r b/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
index 6c5fa119..afa91eb1 100644
--- a/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
+++ b/test/unittest/error/tst.DTRACEFLT_BADADDR2.r
@@ -1,6 +1,6 @@
-The arguments are 3 1 1 16384
+The arguments are 4294967297 1 1 16384
 The value of arg4 should be 1
 The value of arg5 should be 16384
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
index e6d6afa2..671f4806 100644
--- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
+++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.div.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
index e6d6afa2..671f4806 100644
--- a/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
+++ b/test/unittest/error/tst.DTRACEFLT_DIVZERO.mod.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): divide-by-zero in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
index 1e4fdd64..21a52283 100644
--- a/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
+++ b/test/unittest/error/tst.DTRACEFLT_UNKNOWN.r
@@ -1,5 +1,5 @@
-The arguments are 3 1 PC 1 64
+The arguments are 4294967297 1 PC 1 64
 The value of arg4 = 0
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.clause_scope-begin-ended.r b/test/unittest/error/tst.clause_scope-begin-ended.r
index 8d57382e..d4c5ffd2 100644
--- a/test/unittest/error/tst.clause_scope-begin-ended.r
+++ b/test/unittest/error/tst.clause_scope-begin-ended.r
@@ -2,4 +2,4 @@ Error fired
 Clause executed
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.clause_scope-begin.r b/test/unittest/error/tst.clause_scope-begin.r
index 8d57382e..d4c5ffd2 100644
--- a/test/unittest/error/tst.clause_scope-begin.r
+++ b/test/unittest/error/tst.clause_scope-begin.r
@@ -2,4 +2,4 @@ Error fired
 Clause executed
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.clause_scope-regular.r b/test/unittest/error/tst.clause_scope-regular.r
index fff6fe1e..8f2adaf0 100644
--- a/test/unittest/error/tst.clause_scope-regular.r
+++ b/test/unittest/error/tst.clause_scope-regular.r
@@ -2,4 +2,4 @@ Error fired
 Clause executed
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID nnn: profile:::tick-10ms): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 1 (ID nnn: profile:::tick-10ms): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.clause_scope-regular.r.p b/test/unittest/error/tst.clause_scope-regular.r.p
index 7659601b..8117b8ab 100755
--- a/test/unittest/error/tst.clause_scope-regular.r.p
+++ b/test/unittest/error/tst.clause_scope-regular.r.p
@@ -1,3 +1,11 @@
-#!/bin/sed -f
+#!/usr/bin/awk -f
+
 # This report has a variable probe ID in it.
-s/ID [0-9][0-9]*: profile/ID nnn: profile/
+/^dtrace: error on enabled probe ID / {
+    $7 = and($7, 0xffffffff);    # mask out the high 32 bits (variable prid)
+}
+
+{
+    sub("ID [0-9][0-9]*: profile", "ID nnn: profile");
+    print;
+}
diff --git a/test/unittest/error/tst.error.r b/test/unittest/error/tst.error.r
index 0d29bcc8..e349434d 100644
--- a/test/unittest/error/tst.error.r
+++ b/test/unittest/error/tst.error.r
@@ -1,4 +1,4 @@
 Error fired
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/error/tst.errorend.r b/test/unittest/error/tst.errorend.r
index 73abf697..918abd84 100644
--- a/test/unittest/error/tst.errorend.r
+++ b/test/unittest/error/tst.errorend.r
@@ -2,4 +2,4 @@ Error fired
 End fired after exit
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967298 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r b/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-before-beyond.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-before-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-beyond-top.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
index 4257f567..5078f69e 100644
--- a/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
+++ b/test/unittest/funcs/alloca/err.alloca-bcopy-crossing-top.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r b/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
index f5ff855d..420d9393 100644
--- a/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
+++ b/test/unittest/funcs/alloca/err.alloca-crossing-clauses.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-load-before-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
+++ b/test/unittest/funcs/alloca/err.alloca-load-beyond-top.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-load-crossing-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r b/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
+++ b/test/unittest/funcs/alloca/err.alloca-null-deref-lvalue.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-null-deref.r b/test/unittest/funcs/alloca/err.alloca-null-deref.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/alloca/err.alloca-null-deref.r
+++ b/test/unittest/funcs/alloca/err.alloca-null-deref.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r b/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
index 4257f567..5078f69e 100644
--- a/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
+++ b/test/unittest/funcs/alloca/err.alloca-scratch-exceeding-bcopy.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r b/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-store-before-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r b/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
+++ b/test/unittest/funcs/alloca/err.alloca-store-beyond-top.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r b/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
+++ b/test/unittest/funcs/alloca/err.alloca-store-crossing-bottom.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy1.r b/test/unittest/funcs/bcopy/err.badbcopy1.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy1.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy1.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy4.r b/test/unittest/funcs/bcopy/err.badbcopy4.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy4.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy4.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy5.r b/test/unittest/funcs/bcopy/err.badbcopy5.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy5.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy5.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy6.r b/test/unittest/funcs/bcopy/err.badbcopy6.r
index 4257f567..5078f69e 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy6.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy6.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy7.r b/test/unittest/funcs/bcopy/err.badbcopy7.r
index 4257f567..5078f69e 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy7.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy7.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/bcopy/err.badbcopy8.r b/test/unittest/funcs/bcopy/err.badbcopy8.r
index 4257f567..5078f69e 100644
--- a/test/unittest/funcs/bcopy/err.badbcopy8.r
+++ b/test/unittest/funcs/bcopy/err.badbcopy8.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyin/err.badaddr.r b/test/unittest/funcs/copyin/err.badaddr.r
index ba4a4695..2ad8c0e1 100644
--- a/test/unittest/funcs/copyin/err.badaddr.r
+++ b/test/unittest/funcs/copyin/err.badaddr.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyin/err.badaddr.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyin/err.null_arg1.r b/test/unittest/funcs/copyin/err.null_arg1.r
index a806d107..40f558cd 100644
--- a/test/unittest/funcs/copyin/err.null_arg1.r
+++ b/test/unittest/funcs/copyin/err.null_arg1.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyin/err.null_arg1.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyinstr/err.badaddr.r b/test/unittest/funcs/copyinstr/err.badaddr.r
index 0f566d6e..30811f5c 100644
--- a/test/unittest/funcs/copyinstr/err.badaddr.r
+++ b/test/unittest/funcs/copyinstr/err.badaddr.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinstr/err.badaddr.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyinstr/err.null_arg1.r b/test/unittest/funcs/copyinstr/err.null_arg1.r
index cdd7c22c..31dd9088 100644
--- a/test/unittest/funcs/copyinstr/err.null_arg1.r
+++ b/test/unittest/funcs/copyinstr/err.null_arg1.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinstr/err.null_arg1.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyinto/err.badaddr.r b/test/unittest/funcs/copyinto/err.badaddr.r
index 11861e1f..f2e92fd7 100644
--- a/test/unittest/funcs/copyinto/err.badaddr.r
+++ b/test/unittest/funcs/copyinto/err.badaddr.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinto/err.badaddr.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyinto/err.badsize.r b/test/unittest/funcs/copyinto/err.badsize.r
index ec4b062e..8e8c1579 100644
--- a/test/unittest/funcs/copyinto/err.badsize.r
+++ b/test/unittest/funcs/copyinto/err.badsize.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinto/err.badsize.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid size ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/copyinto/err.null_arg1.r b/test/unittest/funcs/copyinto/err.null_arg1.r
index f568ee5c..346063c1 100644
--- a/test/unittest/funcs/copyinto/err.null_arg1.r
+++ b/test/unittest/funcs/copyinto/err.null_arg1.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/copyinto/err.null_arg1.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/err.badalloca.r b/test/unittest/funcs/err.badalloca.r
index 30224330..e2d013c8 100644
--- a/test/unittest/funcs/err.badalloca.r
+++ b/test/unittest/funcs/err.badalloca.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID NNN: profile:::tick-1): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 1 (ID NNN: profile:::tick-1): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/err.badalloca.r.p b/test/unittest/funcs/err.badalloca.r.p
index d7a88a39..15f99035 100755
--- a/test/unittest/funcs/err.badalloca.r.p
+++ b/test/unittest/funcs/err.badalloca.r.p
@@ -1,3 +1,11 @@
-#!/bin/sed -f
+#!/usr/bin/awk -f
 
-s/(ID [0-9]*/(ID NNN/g
+# This report has a variable probe ID in it.
+/^dtrace: error on enabled probe ID / {
+    $7 = and($7, 0xffffffff);    # mask out the high 32 bits (variable prid)
+}
+
+{
+    sub("ID [0-9]*: profile", "ID NNN: profile");
+    print;
+}
diff --git a/test/unittest/funcs/err.link_ntopbadaddr.r b/test/unittest/funcs/err.link_ntopbadaddr.r
index b798b5e0..acdf019c 100644
--- a/test/unittest/funcs/err.link_ntopbadaddr.r
+++ b/test/unittest/funcs/err.link_ntopbadaddr.r
@@ -1,3 +1,3 @@
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
 
diff --git a/test/unittest/funcs/err.link_ntopbadarg.r b/test/unittest/funcs/err.link_ntopbadarg.r
index e386a67c..2a22d504 100644
--- a/test/unittest/funcs/err.link_ntopbadarg.r
+++ b/test/unittest/funcs/err.link_ntopbadarg.r
@@ -1,3 +1,3 @@
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
 
diff --git a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
+++ b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
+++ b/test/unittest/funcs/inet_ntoa6/err.inet_ntoa6.arg1_null_const.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/strlen/tst.null.r b/test/unittest/funcs/strlen/tst.null.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/strlen/tst.null.r
+++ b/test/unittest/funcs/strlen/tst.null.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/strtok/tst.strtok_null.r b/test/unittest/funcs/strtok/tst.strtok_null.r
index 03226aa1..f7ae9418 100644
--- a/test/unittest/funcs/strtok/tst.strtok_null.r
+++ b/test/unittest/funcs/strtok/tst.strtok_null.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/strtok/tst.strtok_null.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/strtok/tst.strtok_nulldel.r b/test/unittest/funcs/strtok/tst.strtok_nulldel.r
index 70f8e4e2..d6bd31aa 100644
--- a/test/unittest/funcs/strtok/tst.strtok_nulldel.r
+++ b/test/unittest/funcs/strtok/tst.strtok_nulldel.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nulldel.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/strtok/tst.strtok_nullstr.r b/test/unittest/funcs/strtok/tst.strtok_nullstr.r
index a57b2469..0a555af5 100644
--- a/test/unittest/funcs/strtok/tst.strtok_nullstr.r
+++ b/test/unittest/funcs/strtok/tst.strtok_nullstr.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nullstr.d' matched 2 probes
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/funcs/strtok/tst.strtok_nullstr2.r b/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
index d7df3aca..3ec82a69 100644
--- a/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
+++ b/test/unittest/funcs/strtok/tst.strtok_nullstr2.r
@@ -4,4 +4,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/funcs/strtok/tst.strtok_nullstr2.d' matched 4 probes
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #2 at BPF pc NNN
diff --git a/test/unittest/funcs/substr/err.substr_null_arg1.r b/test/unittest/funcs/substr/err.substr_null_arg1.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/funcs/substr/err.substr_null_arg1.r
+++ b/test/unittest/funcs/substr/err.substr_null_arg1.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.AllocaOverrun.r b/test/unittest/pointers/err.AllocaOverrun.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/pointers/err.AllocaOverrun.r
+++ b/test/unittest/pointers/err.AllocaOverrun.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.BadAlign.r b/test/unittest/pointers/err.BadAlign.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/pointers/err.BadAlign.r
+++ b/test/unittest/pointers/err.BadAlign.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress2.r b/test/unittest/pointers/err.InvalidAddress2.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/pointers/err.InvalidAddress2.r
+++ b/test/unittest/pointers/err.InvalidAddress2.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/pointers/err.InvalidAddress4.r b/test/unittest/pointers/err.InvalidAddress4.r
index 187543b6..2b87fa68 100644
--- a/test/unittest/pointers/err.InvalidAddress4.r
+++ b/test/unittest/pointers/err.InvalidAddress4.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 3 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): invalid address ({ptr}) in action #1 at BPF pc NNN
diff --git a/test/unittest/speculation/err.CommitWithInvalid.r b/test/unittest/speculation/err.CommitWithInvalid.r
index fc072417..d37b53c5 100644
--- a/test/unittest/speculation/err.CommitWithInvalid.r
+++ b/test/unittest/speculation/err.CommitWithInvalid.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
diff --git a/test/unittest/speculation/err.DiscardWithInvalid.r b/test/unittest/speculation/err.DiscardWithInvalid.r
index fc072417..d37b53c5 100644
--- a/test/unittest/speculation/err.DiscardWithInvalid.r
+++ b/test/unittest/speculation/err.DiscardWithInvalid.r
@@ -1,3 +1,3 @@
 
 -- @@stderr --
-dtrace: error on enabled probe ID 4 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967297 (ID 1: dtrace:::BEGIN): illegal operation in action #2 at BPF pc NNN
diff --git a/test/unittest/speculation/tst.negcommit.r b/test/unittest/speculation/tst.negcommit.r
index 69f246a0..82f7a8f0 100644
--- a/test/unittest/speculation/tst.negcommit.r
+++ b/test/unittest/speculation/tst.negcommit.r
@@ -3,4 +3,4 @@
 
 -- @@stderr --
 dtrace: script 'test/unittest/speculation/tst.negcommit.d' matched 2 probes
-dtrace: error on enabled probe ID 2 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
+dtrace: error on enabled probe ID 4294967296 (ID 1: dtrace:::BEGIN): illegal operation in action #1 at BPF pc NNN
-- 
2.43.5

