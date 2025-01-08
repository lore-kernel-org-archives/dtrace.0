Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFD51F8AC5
	for <dtrace@lists.linux.dev>; Wed,  8 Jan 2025 11:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736336089; cv=fail; b=rZYVrSDGNgh6TOKtk97fgJfdu+EH46OB5NIAdXqAGSNmwvfdIt0Ssr9m4X6m0j55f6Z1ssYM1W+FznqQsZcBSqZ4bSp2bQZfEJii2wNwbAypootR9XJzegmbisEwIGaKCU5xXQeCe1bsIAwXMPjysW5DlEXVfOCqi+SoJt40D70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736336089; c=relaxed/simple;
	bh=um/oIicl+RexT7IgEu2dxqeXLB/AB3A9LUtHaWkDrPY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=T+K3FejRUxGUygrf8QE2SvJ6hatLEyW4bwD1m3pv6KypTm5sBdXHULIj5+3YcoG9niyEOJozUZjIhSXuuc1hasd7wI7ox7U9xbCgA7vfDcrWchYFn/Yo+CloxNZQV6YmD5ldRMwwYP08eNlQXOlBdePqP+Jm899peMGHsOePdHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=duMT5lpI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LuO1xQ2O; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="duMT5lpI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LuO1xQ2O"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5081twgW005965
	for <dtrace@lists.linux.dev>; Wed, 8 Jan 2025 11:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=um/oIicl+RexT7IgEu2dxqeXLB/AB3A9LUtHaWkDrPY=; b=
	duMT5lpILV+adjokk+gOqo/KZIti2iUVlxb03tf09+Hvoqj7UTyVCLLZZV6c8fp4
	Mb+okf74SbTJWjTfD7vBlPtgvgoryNmd6RNxUOqDi5QFHWcbDC9f5w50sed4ZOZP
	D+LchxFK4hDmqz3JJcv13r31ZzBR9wpBGxtiHgqav5ZMly92SalaaOHELqvOt8j5
	fDmGy3QifCQJCj9R2Fc71aYH5Bo0g0k31Ze6rrzRMqrrsGIjf+DgoYIgeBBMvckG
	2N4PsiLA+povDoxl8s6L5mRyObBWo2Idx5+pXm3TUSgeolkWZyVsJy7jb4iccYu8
	qJnfKU+uwe+sgw9m+Xo/Ww==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xwhspf4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Jan 2025 11:34:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 508B1xjL020026
	for <dtrace@lists.linux.dev>; Wed, 8 Jan 2025 11:34:45 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2046.outbound.protection.outlook.com [104.47.74.46])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 43xuefyye5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 08 Jan 2025 11:34:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moHXYOXaod9X7pndojkZIgpvafDnObp3pxcEZt36TDkxbtHEwt1h+Gv9x2mozenaqx3bJWXC/CR+8oCl96hYyKlwQfggZsjVL8AW2XkgdYSMzy/bwK7j1qhOo1k7gppbuq2hGXNt7vkATrThdxYCruSI42DNjFE8mhHzko1lpBbzOWq1kR6r28YNfP4sBp41szmR2k7NMlJa44aRxI2JAFCTjdNdVoNJN+JKWBCeEGsU0J7Gl+4PxgkNHC90a47psnz8ILMf94Poz1/sFCQ2wKUXb+DxRLxT2sTMIPn1c8JBrkQv7SgWOqMqeDYeDIeD/fvKa16WxR3NB3Y7BzinPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=um/oIicl+RexT7IgEu2dxqeXLB/AB3A9LUtHaWkDrPY=;
 b=L93mJUrP+TlQNipr2kh4N2uOf5DAXlwFZ7Uy3GKvsyA+nO1Q3msyG8XAzaF0EUO82n+KO5AZf2627RZj8gTPhb4e2/7/RfyRFTkIoMUCeyEq6vz5mjGHzfy4n4J2gfiZAzhKWeEhDx7zpATTuyYoCHj2ZqN11TKiV4XwWaPSJcx4Lh228mIHf4NBYOFBPgVN8u8aafipzP5mp+JkumL4ep12xRec66M+rdOrwBBzoMH8X0+DRuinhyHfzySWEGq6zPPd9cadkoTu1UNJlngEdjzlmhBeH94ot/Nw7xyIa/bC2wfsmQqoV9dQKvmnk7KCccJuHNhwv+PTXSySJH94ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=um/oIicl+RexT7IgEu2dxqeXLB/AB3A9LUtHaWkDrPY=;
 b=LuO1xQ2OreRgkL7aJRWrPYwMpGbrUftzFTxS2a9YHPGsSStoh6VEPyX7Qeco/YLU5Q6yjr9MbN3MHr7GAZIj5OgAWULvx1RglF18AAqkMv7jc3nxjsxsRX62k9xFsuqg7zPNQDQ+FdniPvYGJWY0MdE5PPgRxUCxysHxY4cIH60=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by MN6PR10MB8119.namprd10.prod.outlook.com (2603:10b6:208:4f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Wed, 8 Jan
 2025 11:34:42 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%5]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 11:34:42 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>,
        DTrace mailing lists
 <dtrace@lists.linux.dev>,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] io: adjust io provider for NFS tracepoint variants
References: <Z32uRw0BCaUdtVFm@kvh-deb-bpf.us.oracle.com>
	<474ca7db-5d3c-0426-7b17-fb04043544c5@oracle.com>
Emacs: if SIGINT doesn't work, try a tranquilizer.
Date: Wed, 08 Jan 2025 11:34:36 +0000
In-Reply-To: <474ca7db-5d3c-0426-7b17-fb04043544c5@oracle.com> (Eugene Loh's
	message of "Wed, 8 Jan 2025 01:01:28 -0500")
Message-ID: <87ed1dh73n.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0485.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::22) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|MN6PR10MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7fdf6f-8fee-4812-0836-08dd2fd87187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WnpJSFVQNXRsK1A1RUlnUktnTXoxZTdodTJKMHlmSENucVU4eVpsQUxVOUQr?=
 =?utf-8?B?TGhBYmcxZFlyQXo2THJQRDlYc3g2aWdEVytCT0JDZGcrUjMyL2tmQVE0bDN6?=
 =?utf-8?B?WlBNaXFwSVJjYmczL1Q0R0hqQVBIdkltbm8zTWdiVmtEd0NhYU9SWTVqVm5H?=
 =?utf-8?B?QkdLUGV0Ri84S1BGd1ZLRXcvVmFTWXNsdHlXNElLS3ptdXoxWGYyZysyVkhM?=
 =?utf-8?B?ekVldVVCd2p1ZWVqOEQyS0lLU2dpQ3lrbHN6eHBWcGdaN1lKK3FUaDdpc2VO?=
 =?utf-8?B?M1Z4c3JUZG1tTXdjdDkvNGFuS1hzUlFTOEdEUnlYek9EeHBISGgvdVZwZXdF?=
 =?utf-8?B?eFc0OXpNY21GRSt2NzdJdElRQVBwMDJaeUlpeDBlRVYwSlJVV0VyZDUxS1E2?=
 =?utf-8?B?UGhnSGxoeDJ1MDFKalo0U3NsT2t1cWUvRU1iRzIzbDhwL3VKVU5Nd2Q2Mjhl?=
 =?utf-8?B?ejV6S25Pb2NoaDltbFRLWUgvY1VVVk5UTG5jcURXVFhhZW9KUjlaRG41Vm16?=
 =?utf-8?B?bTN2ZWMwYThUVDZCbG02OUhSVE9UQlhnUFk3Q0d5ZnBNb0toajhHb2Q1ME52?=
 =?utf-8?B?d0Y2VTdQQ0J0SURLWWhObllmQmpFcEhaK2JuTVBkT1k5cmVxdmpaMG9aNkRW?=
 =?utf-8?B?bmRxbCtsZk0yRnJ6c2ZvUGh5Zi9lYVRncVdYY2NSdVhwdGNLMFNTS3JFM3Jk?=
 =?utf-8?B?bldZWXRhdXNLSTE0YzFOYWMrMlhHbEE2VElNQi9OcExoeHRZajhCUy9NVmJ2?=
 =?utf-8?B?TGRKcm5GNXg2R0kzREJnU1M5NDlNUTQ0STdBUytpcmJXbFQxbkFOVXJEOXhx?=
 =?utf-8?B?eFF3V0ZYV2trUHh2VDAvdS9wMkV6VzlxVWQvdFEzU21yZ2pKRHFpTVh3ZHlT?=
 =?utf-8?B?UVgzSGhucldoYTIzcTFnaU9kR2I0dTlIQWc1TE5hQkhyWHExRTZ5OUV6NXQy?=
 =?utf-8?B?emFoWXpRQkNPdzErdnlzZEFsaWlKTnRvbTFTVGF1U2s1dVJjRXphczBvU0FS?=
 =?utf-8?B?R1JoNkF5b2ZsOFBUaml4NmZ5bzc0ZmJuZWI3M2w4dzREMXZRb2pSSXF1SWJC?=
 =?utf-8?B?bDFvVCtpbkRjcDRCODlJTS9vRUVZWUxZdjZjWDFGVHhmOE42NmlxQjhzdW1o?=
 =?utf-8?B?U3VVWTVueS9xdlVWMEVlQ2NUZUIxQ0VXekNZcm1nME8yNGNUaFFGUVFTZmhY?=
 =?utf-8?B?ajNzb1lzaXkzNm1PU1FaQ3JCRE1oakN3eE5oaXdWZ2xvTVIweVVQVGhRL20w?=
 =?utf-8?B?MlpWMmw0Umg4WUh1Z1BmYkJhZkU5QktnU0hCaUtWdnVpalpGRG90aDhsd0J4?=
 =?utf-8?B?N25SUVZKSDR3Q1pqd3FQUittQ2N1WTdDcnc0ZjVvbUdUZHBkUFA4UElieWRt?=
 =?utf-8?B?Q1dXSXB6S0hFU0NGM1d2b2p5OFFpYktMS055bVVlLzNwck54K2V1VTFDQTJw?=
 =?utf-8?B?MEhESnh4VHUvamZOdi8xNkxZc1MvWEhqZHpuK2MxTDZMRnF0anJFWlpnOWg5?=
 =?utf-8?B?WGNybzdHcWl6T0ExK0lPRFhBTXRqSHN4OHdRME0zL2lHUElKSzhHZldsRWNq?=
 =?utf-8?B?dTF3RFVCekRhbnEwUzNtNXk3VnJEUldJQ2wrUTNGN2JrZzc5Q3ZiQnRPVHJJ?=
 =?utf-8?B?WkdvK3IvUFIxTC85NzdaNGE2ZlJUY2hwRmFLMGw1dW5ndnJTVnFVNFZWZFlv?=
 =?utf-8?B?dDBINkJPMVZKb20vdlNqd2ZyRStES21jNGZLeGFwT3RaYTlWZ1JobkZoRVdT?=
 =?utf-8?B?eG5xeENQZUU1VTNHZHJ0VDVoRWxvWDVFVVhWdXhSci9QbWNjdVp1MkhBOUJv?=
 =?utf-8?B?UHRObTg5d2Nra2Z2d01YM0NCaEZSZUU0aUlGT3BZMXhwOTlVaHJmaTRXdkd4?=
 =?utf-8?Q?F0qteIjg5mCYy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVJhc3hDQ1diWHJkMHJ1WC9CZXJzYkM0U01QQ0xaQkFHSDVRVWRjSVkvUGNC?=
 =?utf-8?B?ckt6VG9XT05WWS9sQlJhTHlEQXNMRGloSHhFUGw1Zlp0WllzUEliNUl1a0Nq?=
 =?utf-8?B?ejZsNHBDREF1YXBVWWprWDM0Y1EwYlhaVTFYa0tOZ3YzM0RCZS9KOXRIMVU0?=
 =?utf-8?B?OThBc042NkhQaHljb1pycW9naWVmbzRvSHhwTGFMVjZmcU4rS3IzUThVUTRj?=
 =?utf-8?B?ZEFORUVFS3J3cUwrNXFNNXp3a0JBSHo1cXpTeFNYZ1Bna20xb3BvM1NxMlNx?=
 =?utf-8?B?ZFNqQWJvTEowN3owR3dBL2hjZGJNWUtrQ0hzUmRoVkhYYURYeFlLR2laSFg4?=
 =?utf-8?B?bDJBUVk5NVBOYTlpZ2p2TkxlUG1sOXkwY2dNRytpVDFydU5ISHR2WmV5V25j?=
 =?utf-8?B?YjFVdFYrNEd4U3RYT2hvMWNEcFpNY2t4K3N1VkFTcHVlQW1DNm5OUmMrRkor?=
 =?utf-8?B?QU1DcW9UdVdjY3RleUw4TituNzVrck51TENzUjBUdldNZ2xyVHVqemFKTE0w?=
 =?utf-8?B?MHd6TFQvbmFDVDlHaTFEVjNMR0tQVWVQVEFLTnMxaDViUGxGOEZCVDN3dVM3?=
 =?utf-8?B?UmJQaEkwMXVjaWFaeWdsUnJqcGZ1bHpnV282K0syWElNTEpFQTFIeEt3SXUy?=
 =?utf-8?B?Ynh1Z2h4M2cwclZCbmo0Qzg1c0JoQUhrMlg4SnhZcE5XV21YQlVWVUFOZ2Zl?=
 =?utf-8?B?K1FUR2RnSzNzWHhRMEd5MUNBQ1dzYVBlaWlCYjlTak02U3dRWlorRytmZXVx?=
 =?utf-8?B?VDZvQmZRcUFkbzRPT25VK05PeXJLUGpKc2U2TGNYRmZyY3BleEdZOHd1dDJo?=
 =?utf-8?B?OXhhNGd4UnFRK2crY09SNmJRQ3VoeHR6OUd1Wkp6UUFGNEViZXBjYWtTczdz?=
 =?utf-8?B?R2psd2ptSC93cTFBL3hSMlZ3cmFITUZadDVUaXJPMnBuUm01U1BaRVBkVmV4?=
 =?utf-8?B?NjZhQkJ3VE1EZnRobXpjZ3JTRDV6WmRSQmI1VFFuMHAxL0FPa1QzRVhNSmI5?=
 =?utf-8?B?M2JDY2ViNG9yaHZDc1BGcXhRVGg0MmJsWlo4YzcrZWcvTEF0Z3h5aXFxdXND?=
 =?utf-8?B?aTlBd0ZraHZtZ0RvdzRRZVNVREd6UE0wL01WRE1NT3NMMThWT0REZEFBV2x5?=
 =?utf-8?B?SnpTdHBwd3NqUy9sWk13VUM3Sm9LdXlCdG5FMEtqNG9KOWs5cEFzdDZ4ejB1?=
 =?utf-8?B?Uk93d0lhNHh2dVQ1MEJQQ3pzUWFycTdCTVdtWjRMak5SekxJODlOYW9YSHFs?=
 =?utf-8?B?djBFSzhXL0JrWms4Z0UvODRSM3I3K1F1M21jSjdJanVFQ3BVSXRzWVpBN21Y?=
 =?utf-8?B?WXpPZ2lSakRmcHRFZGhmZWw4dDY1dnVVSG1SUGI3NUp1cUlPK0RUSXJLaC9R?=
 =?utf-8?B?MnppaWVNeWFYQThBZlJGZDVpVXA2a1ltdUJuZHdBbFM1OWRBcTJzK0lTV3da?=
 =?utf-8?B?ODcvbm81M3gvblJja1QraWs3Z1lUNFZZOUdBWGxRMk82RGJSczlsVkV1UFBW?=
 =?utf-8?B?NGh2Y1BJQ0IxVTkzRmdEdHk4REpIUmdodkdmV1hWc1NVaFJYWjNiNkRqNXly?=
 =?utf-8?B?d05yM2luVXJIOVhWKzZXSHY5by9aQmVUazVoQW1tUVgzZjhCZ2pNUUxKL2lM?=
 =?utf-8?B?anRxTUVEMHlncW5ydDh6Ulo2MTN3VXRLOFI3dE1RcCtISlY0a2NDWVlCUXN6?=
 =?utf-8?B?QnZUVXEveHpuakxxSTR1cUpBZmQ2bW1Sa0hQY2xVZGN5THZFUGtEQ2hjd3Jn?=
 =?utf-8?B?d0dqMWdXNDRPajNJSzlaTkgwdFVEc042VTRmeGwwU2xsRjNjVTZLUHd3bnh6?=
 =?utf-8?B?a1JYeU1OWmQ5TWFxY3NWdENYYnhnc2JoS3VKZDN6MFlWeDg5dVpBVUxZZzM4?=
 =?utf-8?B?VG5uN2NkazZGem5wdVBCMi9EWVg0WEExTERxYk1tY0JIWVBsb2creTJGUUJk?=
 =?utf-8?B?cUx6TmlaWkpNbUFDQ21Bb3l3SmVPQzRsM2tDUU1CVjdpVXZ2cHZwU0hyT0Rw?=
 =?utf-8?B?SndXMmJ2WkVoTGNzQXlacnMxSS9oWjArTWkvN3ZKdjNyamlsT21OWVZIZEk4?=
 =?utf-8?B?V1hoV0lUd29rUFU4eVdKdC9UeENIMVQ2WlM5RDVUaDJXcTN6Y3djWkZvT1Zn?=
 =?utf-8?B?Rzh3Vk9UajJXMlJ3STZHamRjVUdvNHgxTFV6SjdhY2lJWU9Yek40MEhVY29F?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	r6h2BsjCM5JdoxZM79Hxq0azoFDuuWDTNsZ2lB/1yfrwIXX6bl6/56CRglJ8ow4Fh6cBHbAGnLCRjLBm7J8PwCzO8yaWQE6R60Bw4jsVu6mphjI10JdXZHnC1cL0yrrOuAG1UxtbMtjMXUjDy8j0Nk39ucIJVUJ037/CDJnUHQT16NKXNq1XhFDc53U077UMWcM+B6Osde9kSUdnUsY+R3E9TIvpfQYlNxtC+kFFBKLRi/b0D5CPBEVt9HPgBeD2s93tq5Lyr3iQHf0oos/KBJDuhl+1duUbC/r8IS0pY7dk15z6ax5i0DcPV6NOFxXvnZMxw+T7XpVSJRqyj6DfbvlQquOeJfLIruIETt5MlywSDvO6x5t5QFBtF/RRIOZF2si1wrSgPKKFfLlZA0Wj1kI53sFAoBxSXSYQObASYzMdpAM0I8Kb9WkTYp54AtEHuIjvkjKUcjEjGo+afRsKC5L4YuOMlJgrmeWdpPXydDyF7/SwCi7Ubm3GmGf8b+hiIgItT7qll84ScZbsmSlKckvBHM0+Qlg9HsgH6lW+tVbipSOeIQKu0rLwpoJX78SU3UaR7SORkKUNvSDyP4WGCRH5IqXu/XdYgu6Zmiu7hIQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7fdf6f-8fee-4812-0836-08dd2fd87187
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 11:34:42.2030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTaqZxbdpZH7+3KJZM6GfmK/iDqP/ljbVXahhJYQPbe3DsgkwQaIFv02DSQHe/ixESTMe8W0L+KP6hIWIAEhMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8119
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_02,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080094
X-Proofpoint-GUID: WDbkLpw9xyDbFIYSBPSsX1qfrFN4tMlN
X-Proofpoint-ORIG-GUID: WDbkLpw9xyDbFIYSBPSsX1qfrFN4tMlN

On 8 Jan 2025, Eugene Loh uttered the following:

> You already have a R-b, it seems the code is right (woo hoo! cool), and w=
e're trying to get a release out the door.=C2=A0 But here are my
> "late to the party" comments.=C2=A0 Feel free to ignore.

Ditto :)

> The names v1 and v2 strike me as funny;=C2=A0 they just make up new numbe=
rs.=C2=A0 Not a big deal, but ideally the names might more closely
> reflect the actual version changes we're tracking.

Agreed.

> Breaking the function out into a new "v1" version is some unneeded copy-a=
nd-paste code bloat, I think.=C2=A0 The function is kind of
> large and the only difference between v1 and v2 is I guess in the two, re=
latively short, "start" sections.=C2=A0 So, keeping this stuff
> as one function -- with extra logic in the two "start" sections -- might =
be more compact and clearer than having two rather similar
> functions.

Agreed, but more generally it seems we are growing increasingly many
fairly similar fake bio functions in the io provider: with this I think
we're up to three. Maybe it's time to refactor some of this into some
sort of shared fake bio machinery? Certainly if we grow more I think we
should (and given the number of network filesystems, that seems quite
likely to happen).

> On 1/7/25 17:44, Kris Van Hees wrote:
>> Kernels prior to 5.6.0 pass 3 arguments (derived from the NFS hdr)
>> to the nfs_initiate_read raw tracepoint, whereas kernels as of 5.6.0
>> pass just the NFS hdr.
>
> Is the same true of write?=C2=A0 If so, then maybe say so and point out t=
hat what we're really doing is changing the handling of nfs
> "start" while leaving nfs "done" alone...=C2=A0 that would correspond mor=
e closely to what is happening in the code, which talks of start
> and done.

Good thinkiing. That would be commit
5bb2a7cb9fe58d2b1efedd6058d442c7871c45ec ("NFS: Clean up generic
writeback tracepoints"), also by Trond, also first landing in 5.6-rc1.
Same sort of thing.
