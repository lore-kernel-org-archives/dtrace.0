Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B6D8836
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 04:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722574393; cv=fail; b=Kj1+32rod2EXtnhWaQkuGsRQLUsCNfYy0uqn7VAHbs/Dd5O3jLVb30v9szS2/U54ND4r14fwFfCK7TCUVEIOybHZpa7P5PiofFJG5t0K3xQvRaoGtID2dNN2CUyaa4pB8jw/T+ul5bszOP0BODJ1avONb89sosTzRSj1UUkzzq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722574393; c=relaxed/simple;
	bh=26RiWbZPOsNOulgsDmYeFBYoTzbumUFwhV7JtTc/VR8=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=jXNUyp1/TDU5lL80UWc4OSwYc4CNd4bSRrQdILzwvze2LC9JbkS2Zi6mNIm/ercSBb4hd5BwXShDM+feLvNlnvpQyas9GRmh2d+qWsoyWVDNt2am59G+CaNBDK3xyNqllUGtRIh4hxOLuLcJ+2TuUc4ERKN2t+ZrU3UbvBZPx/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=TsQfwlFm; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vlbzbksr; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TsQfwlFm";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vlbzbksr"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4723fVqt014011
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 04:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:subject:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=hmoCOfRxUIVv8/wqL2xMBGPK8IzY6LyPTTt5m9IdsBM=; b=
	TsQfwlFmlb/dzK0AFqX8nE9kyFTNCL76MT8JR+zQWtBLicNtW6cE1e6TpvyDU8nP
	gt0KEU0PpIlyMoOjSvWAgq6IPdatLg3MM8DclJ2B01497YAmkBfFA5cu0prBM+JA
	9jN4zzZPtuUS/3tDvo5e2ASHFBMKUg0Ofm8Op0kcG0+wGfNzKK4liQM4X8x3vPwb
	Q9Pz40cKCu7Wurj4arLbxthDHi99RccJBe/+VYeo7LLSUklldNMZfEsOzvP7B3AC
	kMIvwohXPByZdevSKCZ1A/vQPCpYT83UDmG88Of7f9+tejJBDkNA/qCOJQIQjK29
	+xhBs20UndKW7GYRvn9jhQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rje8gcph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 04:53:09 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4722f2xH019077
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 04:53:09 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qjmuhhmy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 04:53:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iS0KiQ4wvc+ap6w8U2VwFjTSNG74c/BxWkRKitHCjq/ul4TLCmafVznBWjNvk+mmLkOn2hpYN4dWFaTPWvz5Y32H/PJrci+FWo8/fqA2qD14ZFTVAmAFfAeNJ4sUIYczaSIb6cnAggq4dFK4OeBiNlMb9Gkz1KG3FGx5roukitEWa+p/68jux010XHOcxhCOAqCVlHPMK7v1Ay7kTz3BBu455AFqia7Qud00LbodlxbeyuKCqxCE+iqC3E8zYyK7XwBpSBkpq5bbNoX0+0bzWnZIENnSao6sg3OgjSYswjaWlnu6R/ygSgGj8Ze3DGCVtoIU6n+JsV6t90e8/H3O5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmoCOfRxUIVv8/wqL2xMBGPK8IzY6LyPTTt5m9IdsBM=;
 b=E1ix2A44Pxq7vagMCgs/MztlMf2zT3mNK5Il1MPdBtXPULvlpMnrYAmiejE9vm/sfXLIdNYZvIVMlZ+lthDQq8B4d37YkanwxWApraZgaHQkFtAeVaJA6kc7zspn3mt+6BSUF1ddKWZBJA8rle738E+U/wGe7gxKAi70XLXaL7thXh404vPHqCvcnEjBbgbTuS3bZattVFZEKXm4JIEjQon8cYYa1jX0qX7OhvpdMUGuuOZjwzSAAfT6Zi8FBy4N9ErHW9Z+gX6YcjfIz883k692p+ocUy9uw6a8gPtrkMdTXXXsEW+8G0KKGQzvXd1Jv7qxBKNMRRpQnpQhwvUzZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmoCOfRxUIVv8/wqL2xMBGPK8IzY6LyPTTt5m9IdsBM=;
 b=VlbzbksrBCJuNKqCvGXijUcxz3tOG3S6La1rTw9oxVilXLfaMJOPsmhfNLkPaOdJS8sqZXoZ709mI6V877Eu5t2cfvhknRtAlygRVhFoFNylPaSWxic7fAqqzTydGQzRSf5+pNHX4Fk1jzfhADbMTCG9nZW6hUk5iFxJOxXJqI4=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB6701.namprd10.prod.outlook.com (2603:10b6:8:137::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 04:53:06 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7828.016; Fri, 2 Aug 2024
 04:53:06 +0000
Date: Fri, 2 Aug 2024 00:53:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: DTrace development list <dtrace-devel@oss.oracle.com>,
        DTrace dev list <dtrace@lists.linux.dev>
Subject: Issue with pid provider test
Message-ID: <ZqxmLtaDi6mYkn/D@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0158.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::13) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: 8520ddac-310e-4242-ea33-08dcb2aeff60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WCW1Ahox5eYOmcROSDuRRx7N9GeMIoWwqZEPrLSmtMFnaOSXRxbqaVfdTGIV?=
 =?us-ascii?Q?r8HJcviwBE8xnf8qljqDBRS1c3Koj40+b4GvrteW4xwDlXBttQrIdMiej8so?=
 =?us-ascii?Q?XF5gsaMLquTYjtwllVvN7mcZh6hQSNrydfGq/ULnKNy3or96WcaArFSJwSXl?=
 =?us-ascii?Q?9k0a8lTMTSKy0qC8w2LhriE+oLHoBGtvB7Z8PewofJGIOEToQIeKwG6bSHF0?=
 =?us-ascii?Q?E6DTq9ymvM+hQdhdiC3cO269SkL24fTk3zb0dYNNbTqjIA5zgcWmvCY5SZwL?=
 =?us-ascii?Q?5WrK12yp6fzK8GTihLghmgQOAFPfVwWTc0JGFVZaa2hbxjbgsWXW6Xkj0Rt/?=
 =?us-ascii?Q?/fnOf5bURpjBZrZIktF7lcEic4PSjX/d+Z8c9IT5QAYfZN/5DlgX/XTP+NtA?=
 =?us-ascii?Q?4xRXQYD4YRQeISa56IqoYiJntLEG0MrbaHk0/jUbGzYN+09Npw1sp3LSWfp1?=
 =?us-ascii?Q?PpN5kC3SxcjQUfYYzEXLzqkMtBR7rJzO+3IduIykMdhE9giBCcniyjkigZdh?=
 =?us-ascii?Q?kDpUgrvtKofMXQclH6sF3tpwfIFZXzUbaAWhuLSBnMqu18vwbFJY5V4JLdOD?=
 =?us-ascii?Q?5OtYqUeo0viThAvYmyNTWtO9PdkVkOC81+2OixHosIx//vcfJyW0IeaKLr3z?=
 =?us-ascii?Q?vzgwoMvZkcYQm9rWWKh/wO1jxuj/xaqQO6MFTmaFDtt01lRUxjnCaLAv/hzT?=
 =?us-ascii?Q?nCufM9iRHTQ7W5VFNPNxmqW+buqZI/XvaSmcG4/bDt8DI4kvbsiRuT4DQbUU?=
 =?us-ascii?Q?IxPGvAAkaF+mCRhcrc5/Jr91mNyZ3Kd6l81jSPE1g0Z/5vQSqREnO0gGwuic?=
 =?us-ascii?Q?/NaI2LEB9ViXaitgdm0IkVNjgIcnlqttGDjZdJkU0ocaL2OgTWbBrLvxovQy?=
 =?us-ascii?Q?xT4x2x1vqxKaueupHvEI4Tx2cHS+BR9C2GBy+owUTYG9Ecbdd3Avg2l2EDxX?=
 =?us-ascii?Q?Fpy6Uk5IU2NbqIserH/qZk7pLxPi9O1dInyb3fW0az5G7PFt6O0UPc73oz46?=
 =?us-ascii?Q?5go3LwcWJjT6kDzpOVoJ9z3vUhYHyJHWYibRIwu6pjDGz1ESQa4SKA8KzNVM?=
 =?us-ascii?Q?/dUwXzQy0Zbg1rfTwBgds34a9ZNItQ/yOdnCxWPH1vAAWDWh4uzVsUFOq7oD?=
 =?us-ascii?Q?uMlaN2ZoTZO49gbB1QbVbU1kIbv8VxRA0RQXzJZZT7RoFn5Kb0Do+DwYBVXe?=
 =?us-ascii?Q?RCVZtT0fRAil2BEPiHHz050CJuUJkWm3QsCozakkSfWcuWkDhwymXb5DRBWK?=
 =?us-ascii?Q?b+BooCX42i+AMYIFjY8yXb/c47T9AQFQArxjvtfKaTipqLMtqHy/4CAq5hYY?=
 =?us-ascii?Q?ThGP7cfLsBCyrOWYZ9fCS0/SMRr9VVvk47BwdusZSNMVvw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GKLQYsKEyRdJzeMhptB/yiiW7iBx8V27X/qG+u8vO6HQMjKCH071hjosIPIT?=
 =?us-ascii?Q?NJk+bHBBdYeCM55eRNELVQiTmdcHpuvjFhPiHcq2xxdVh5Rods3TPKZtkZRJ?=
 =?us-ascii?Q?ZCsMWfPi+uvSTyHfJcG7NkAi6nBjqPvr53FZp87+Tm4Yg5zD0TqmRjiiRf5c?=
 =?us-ascii?Q?PSdjln/FWz+wwLX6eX4hbbauNUbZYnCB4SaIvgr8qgOt5HbIlFajWwE3c01c?=
 =?us-ascii?Q?ttFumdO5MCyKe8wcgXksyC13JavMWhtWJTzVQb4c2KEaaossyKbV6ABfbUCW?=
 =?us-ascii?Q?x0reRnQSRpyEEI3NYTip3Cch9jfXZxAAS1wDCcdDEi/5vAV7oSoRFKOkprlF?=
 =?us-ascii?Q?kkSgnSJ9l6co34IYfSrRo5drS6Nhgzz5COOxcoEFr2CuRf7RuEeSLMbtR7pj?=
 =?us-ascii?Q?kYSw8hwyLY08Eb6KAJrENiP/3KBdPjo31gWs68wQmCQFL/tJHz+s49GU2/9W?=
 =?us-ascii?Q?FFGkYiuSdzMAVXOhzzZ3hx1L19mbYAsklqpNWuTjJJNr47TJ5tWgppN1Vfzk?=
 =?us-ascii?Q?EU7jZVCqHpzbpF0vKOqHZH1t6T7KDxB9ZH81osQCO17o4sWt/AMXTrj1zOKZ?=
 =?us-ascii?Q?fbSby4MaQCqxs6PRaNLIEnOdJtZ/WdSUHLGKPJO8HA9biIt/SbeMRDmeMZ1D?=
 =?us-ascii?Q?C1V5RSNrKM15HUGuzxVhFIdnvgcgRvcUh3jQgjCG8zrmghS3asggN1/XNqSt?=
 =?us-ascii?Q?IACyHv64Aqlget4c3IWDTNPehKcFmZX7huiJ2okVu5c75/EGhD21bPPTfAcH?=
 =?us-ascii?Q?NQ2ViLxap7ok4UjViNmYr9U1mvn3IVoT64fNWnk2HLCN+/OZCnGBW5xiQDfN?=
 =?us-ascii?Q?gXaAM+Tyvy5ySX7kw5uhSZFc8VKPB4cOY9Baw4E92kErMgee/eBHBZPRT0gs?=
 =?us-ascii?Q?VcXC97XS1fMFavddhR7A44QLE+aoSecQWkNSUbK+MzhPVqhM1WEOlwnf2Kno?=
 =?us-ascii?Q?DmyNTzK75Av+BU74q8j1XIEt6DXny5tvBabYfT6arqlXdNsQRy6rhbIi08SO?=
 =?us-ascii?Q?/yvkDVxzOMDInDewbueq0/8w5n46dkI7Nkv/oQlenTs8xYY6zTzW6zPXXsh2?=
 =?us-ascii?Q?ROWSLtCdvQHfNIWaQLJj6G1SO7MfDQjpQ/RcHslUZeeggHgZ310LeCOjdf+r?=
 =?us-ascii?Q?rNr0CGOwEvndN4CaN985NFH3aa6FYgKadTQI/fQ5ERdK0CKqact4n5LDKmws?=
 =?us-ascii?Q?U5SwAzUYkSEwKwJdweDTVMbL6V9QnYnIVTl06Jcnv5AAoXM0ODGLLhNvqMLn?=
 =?us-ascii?Q?AiZxoer+2wmwfPjglEwFFKTXILA6ZT9PlHpTYHy7K0UGVht2VxbjJ/5bpv+9?=
 =?us-ascii?Q?3Fcddn4W4mBze7vuGuvpcpcF7nwKZtQcbyYcvS4wEXnZVgTlgOx7RctkZNK8?=
 =?us-ascii?Q?CeLGnlBTpNhd475Qx/y3JFlWLJUo+cDR8DaZ2gT2drGrulWisieNXQFSBU+R?=
 =?us-ascii?Q?2dCPWtIqfGPce/9RCf1XzpfMuJ+3ChbZlVjrmDY/RyEXha2C1ELjICSiFHLN?=
 =?us-ascii?Q?OSU8qB1yaHKIwCjp7EqeG/FuP80fnzd4tJg3Bo5Fnm9ssjb83wK26ssZPi+F?=
 =?us-ascii?Q?B1PW6s7pKSKwIGG9ddrPKciT40YN2j0eZwf6zVF6I9NQ+KJa/mH6dYEjEpYo?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	06YPnuE4Lc3j4ALX3ff8F+4+v9/VwnFErbJBS0LDz191diF7QdVkdzoGZeRHx9P8wfoGv6YqThlE2JMLehZ95R/2dHs55GJV20w6friTr+FA8EP2riLiZII4e+3+jILq9vcV5gH60Wtwp6g8VwaGeSgOW9bGH53yNXpjeKrqJ5442HN/TzPt67FaTD/Pim3txueP2aFaJVOH0hvuwgFn53OYLejQ3xMYTNFqJ+rR9GNmYun5NWYxdMp3O/gujjn7RX1jjz/4srPnkDgHDA4uJiF/mDGRa/cWVLx7dewrEX09pQ7Sxk0XXbH1lQ2hxVNZu6IAPm0fnogWt9cntkLwJu6TRKozXPPEpmzMtPMeQxwN5YAOR8Tel7ZbutyFZszKKFZaY7zmQEMMb/B87FRLbI9HOvUkuUWYJ8Hs8yMbohjruRzMHo3nNUo8ZwVBILIGzsWvIKXGc+geFJE7ut+LRzbA0ApBputsE7dS28nnTVxIT1rweFnT5wWhMtUL90u3d8De+jFnoZ7BuIo0pQUL/0J9ecUykbKyDOldvx8WI8FIorrPxdgK2pUIikp6B9mwAZp9frpgQNB5OZjhzCJQDJCr+KQeTSY2m9tS0uxs/Ug=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8520ddac-310e-4242-ea33-08dcb2aeff60
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 04:53:05.9218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rlJYThPaFV+I5pLioMFkpTGqjk9MSvYnx6+58DNJXYVeHGq4okGallAwqUguIdxa2Wn/TN0OlV8X7udQFjsSPFPjsDXSe//4UTJ5xvEt5kM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6701
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_02,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=981 phishscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408020031
X-Proofpoint-ORIG-GUID: jSp1-Euop124hCD4axDvrM3xIDqIyO2g
X-Proofpoint-GUID: jSp1-Euop124hCD4axDvrM3xIDqIyO2g

So, due to the complexity of dealing with different gcc versions and the
limitations of uprobes, the test/unittest/pid/tst.emptystack.d fails on
Debian unstable because the kernel is unable to place a uprobe on one of
the instructions.

The test fails because the stderr output reports:

dtrace: Failed to enable uprobe:ca21_17c733:main:1062

Disassembly of section .text:

0000000000001050 <main>:
    1050:       66 0f ef d2             pxor   %xmm2,%xmm2
    1054:       48 83 ec 18             sub    $0x18,%rsp
    1058:       f2 0f 2a d7             cvtsi2sd %edi,%xmm2
    105c:       f2 0f 11 54 24 08       movsd  %xmm2,0x8(%rsp)
==> 1062:       66 66 2e 0f 1f 84 00    data16 cs nopw 0x0(%rax,%rax,1)
    1069:       00 00 00 00 
    106d:       0f 1f 00                nopl   (%rax)

I am not sure how to best handle this discrepancy.
