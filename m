Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A1AC2E3
	for <dtrace@lists.linux.dev>; Wed,  5 Jun 2024 03:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717559555; cv=fail; b=VD0w4oZNzj16zYEs7hhXS575UUK3rqgJlg0aw7Kb2MyiwZ1XVqY6XJ3AuhSBMTskDhnY8xPrmq1uG1hScMGEF13kp4FVrx3ufxlbPnhsxtH4xHO+TYPfLvR31gsUalyq1Ygaf7j6uXVVJ/sJ0w7GLplyQ3TuveHO+4wH4J8BCoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717559555; c=relaxed/simple;
	bh=2+sJfNjx4/v0jtUIDprDxsqdQaXjI6jAPeW19kffHpc=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=eNLRgEu9vsKbZ2I3eTtFHLnKawOLYjocF4zYRQ/IoMw4LKyc4Zp4YrI9hXLT/dZs7fjpbd0qXcq7womtSUBS5zo1GKAopBTNslmlJZzCOXHcqFjOhkWryTgiebTgzR7gG9AHU0Z3cADXMEr7RUvjUq7u59VaLdHlcP4egC2S39w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=d8iJR9zH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CidmKEdK; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="d8iJR9zH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CidmKEdK"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4551DvPG005215
	for <dtrace@lists.linux.dev>; Wed, 5 Jun 2024 03:52:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc : content-type :
 date : from : message-id : mime-version : subject : to; s=corp-2023-11-20;
 bh=iXGO7OjjLJjX3NOGpARzgwtqjqksF0zYfvw1vnGu3jk=;
 b=d8iJR9zHVTuOfR8RPPD1SO1NmrozEaUU49zK9CYxa7zyGALqssfKMgWXygk6tIH2rysq
 HBqrBsKOW+DTg/xd5PpBwkG7qGLjFY+ov0L/l04VhvX5h0L0Uzr4hwqLNFcq4km/UjD3
 23qN7Y9qrYu373WQLHE3U1WDCXDDFVLypP05vtwCc3fGVJdXKrdlSYt/PlHYqRerPBzZ
 4RS41OcKbIAF27DNhjbxckCiNgx1zmIk8p8DjI/1erigzkY1XNL8Qp5u4Q1ejt7cIiX1
 C/MuqK3Kh72xG3frhIwdZNIEttkP4yoiLprcj+NQQYlXbVkGIRnPuM6+LXTXP9KQ8P2n Ig== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yjbrs8844-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 05 Jun 2024 03:52:32 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45534l8d025128
	for <dtrace@lists.linux.dev>; Wed, 5 Jun 2024 03:52:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrt9ffrw-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 05 Jun 2024 03:52:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LhnfJJXlDk7nQmMI69uO6IppUu3Qiu6yoCEh23CELbIVZcbJgn+parW47sbitrLvBN2A2VRemz4tyFq78lDdFG17zByNLbVS/36PN4OZZYovTN4t/nhLChzzicnKFto6MFj51zXrQnp8eOQwx7YtIi7sBz8uv0BtP5nFERBaXw8xDjwv4057bIR/HSRpzyRBxEPqdVkQjfg1+IHsyLxt+w7OvtlXUCfWROXFc0e9Dblqsx7jGBrqaHDIwqONMnRuS6yRt3eWPVN6B7uHgb81cNg17Tkr5ypJuGCsYBsKeUnewKHe3kdNtbzwrbiGozaHbfXunAzdUAim/w13yeuN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXGO7OjjLJjX3NOGpARzgwtqjqksF0zYfvw1vnGu3jk=;
 b=F8iRx3HUWqPqo+0F/HcqJWP7rj4yVfF+3sc11opB+Cf1fGLPKrNtfOwyNbpV2Eb5WdwPNdgFZxpGTieGGmdJlwKhrRX11DPXqajvLE9MkjmOccdLpOu2Z+oIwB3ke60Ie6MezZVlstA/gWZRHvh6U86WlWJlLpYMLESXQiwuMNUwxWY2MPHDs6Mc7HL9oMXsiOO4Nv9Ewz4sH+Fatm5hZGt5Z9JtHybyla1okF8kzgb8L2NxKgcJF0AejgVVnoQCtcR5ZDHf1Ed92ch3OyJoZgVtDJTBhZ797k0BdfbkLEk9lanWYRDpJxlepGXjduqywqv6QDkv2ifwSNOVX4uZBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXGO7OjjLJjX3NOGpARzgwtqjqksF0zYfvw1vnGu3jk=;
 b=CidmKEdKrNq31/Yl0g343sIYaP0RgFeoSEtbQZwPCthwDFoAiObIlJzUgHRHtz4COJJ3Ru/Op5kre/ruhp01hRTO6KRc9Jl8aBmuoKJ0DWxbESv7onJT014bM5MS8X2BKBoMChGbraWlgWDRKdbMkmvbfNbJERbkiWNwWm5fIaU=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by CH0PR10MB7437.namprd10.prod.outlook.com (2603:10b6:610:193::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 03:52:28 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 03:52:28 +0000
Date: Tue, 4 Jun 2024 23:52:25 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace-devel@oss.oracle.com, dtrace@lists.linux.dev
Subject: Re: [PATCH 06/14] Add clauses to per-uprobe list
Message-ID: <Zl/g+U1/Y3tDz9ie@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BY5PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:180::33) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|CH0PR10MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b0a095-c466-4157-07c2-08dc8512eb86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lMWLUg6Rd9D/IJEVikSfqvPlIomzcXbYbkIOOkROBokK2cGBdee2AIk7wTBf?=
 =?us-ascii?Q?9yoZx8jF6giAsrsefOBVgOSJC6DBit+V8nWYGupOcbFKiIpGuvAkfHh+HSab?=
 =?us-ascii?Q?v/XA3Ry4GEOzqyRAFN5GED4+VdUXals/NpWx0vWOMtO0PNstk0XELCEjVcwx?=
 =?us-ascii?Q?ZEhPo1TZKxhC0wBj+kCqqRz+GiZ1wQAKi3fdaEtD1o6aPSPrkKQhOeu4JoE/?=
 =?us-ascii?Q?hCP+n8TDzpflwBanza6LI+7Nm8Mlp9AJQ71sskzzApVfQcXQHk8Db50yB5yE?=
 =?us-ascii?Q?367gZMFBxOBO+B5Z/cLdzAaBs/4Im2/zM8ntRSghlvV2IkGbnzBAbt/7Gf3z?=
 =?us-ascii?Q?Y5CXuiRIBUrftPdpngiQidognvo8vwb0csn5W8N/MvJWBBhN5GQWailI+3KA?=
 =?us-ascii?Q?vbQv3Mm+z7/mQa44/d2KzXdrufa0Y6KyX5d4yh6a1GLDNAsFPW4xmBCazSMX?=
 =?us-ascii?Q?bjFxW8YawhKfdB5Lf+gifIVMnZW+MSYns0kQvcfSUvF6nOutQLQyg1pYjJlf?=
 =?us-ascii?Q?+R0W9htSyA3ltbzZQJNfRRF/iLtjDvl62m6mlII7pnRwfjhAStRiRL4GX/5o?=
 =?us-ascii?Q?TieU2Rb+m66Eh1LXQxG1rAlgYOyCYIIOCzIHwzTt0mnl1AIW9G4yjGOWbuoM?=
 =?us-ascii?Q?Xb3oSvxAgRy9aBZJXTPyUZz6YuayuPPit0X2zxIZzPEuYkUvbr/z+pAW0Mec?=
 =?us-ascii?Q?jNUwtOdyfzK8AVQnXPY0gu8H8wZC0qzG4x3yNhwIDjbkyjp8DwLVg/1uaC+l?=
 =?us-ascii?Q?uh8EoATmCxJVPzNEvuFQjtzRh2Xu3CN7T7QR5X1AYrlJBsj3N2pAG/fUENe8?=
 =?us-ascii?Q?Km3EIhz4pVwxuhd8a3M0BZ/eedVn2RamWphRL0DYV3KKXUpvjhzkiuHK5kL9?=
 =?us-ascii?Q?Lnc1Exv7gYWavEWhDB04kOkCmIt5rScxzuuRKv/t4DIJdxxMwIPzlS7o8DjI?=
 =?us-ascii?Q?YP1g0AbnfBcqvwqhgrrQHkG+oepzsjrwXQ0/ecD+bT/WjVJxwfyH2AF8y6EU?=
 =?us-ascii?Q?WxYIn7NebQVjE7b/c626kpvlZhL7EQ5t2dWOyZIslq+9bGzf1yN0mt+SVUfo?=
 =?us-ascii?Q?eCRmKKubi805MmjlrcdIV7qGY2OBpEF1Qq/lxL3plMksymgsbL4Hf/wv+ZwF?=
 =?us-ascii?Q?JOUjwCJE68td8cfP93gHls1LdcAafidFYMala8b89gHi8bQYh5+k5jypo+SE?=
 =?us-ascii?Q?mzZWtq5zzDTdzBJFCsehR2+s4CCDlJOMhzuSkOV6lsBmkoJ17p/WzxblTRgQ?=
 =?us-ascii?Q?SZAoK6D3vsOE/RrDQDpHZblY7ar4JzsRHVl0xu7XCw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pm/qhiajMe4CLHnnNS/0omn2gT4ykzBtnCiGOGgrepynRHYL2YqY8g9VkCA5?=
 =?us-ascii?Q?2XpXCfMaRYeH/KtJRAZO8Vipyf4NRp1rWLr1JR5U4aHID4RaoH6qWQIaK6Sl?=
 =?us-ascii?Q?3zhy2wL6N0s6wyJFMGGs3AZSE6tS3W2Ph+UatIADB9clCLBNTcZx40IEfvxY?=
 =?us-ascii?Q?Xrp6kDmmbmAd61owxzEHfmk/CBOGqA3tCuv6lEb2sj7761Wx++CZvYhS3l1F?=
 =?us-ascii?Q?78U0z/C+iqKXUzcGZHgXmMtmCtxav7QPiro6r0bTBJKX2KfK+EOoNtjQpkRx?=
 =?us-ascii?Q?WxXMF1KPF1Sxi0Sb+i33zScDhiIhxzMCDAPzbEXavl1FRL7jWEEf8KS7z7bS?=
 =?us-ascii?Q?uPy2CiL6cEHdz21ylBLrzNU2Gnz5Cw1upbppjHumGpI0OtoOfIsiPEGeK9Co?=
 =?us-ascii?Q?x9LNDWsobWo+ksboW6PhFmvDsakKoUvH8lCyzVn5bwj2CKuZm6PTh1ovsWKv?=
 =?us-ascii?Q?pIRpDiPdjr62HTWrSHMOoovaRbALNZUmLuIslHSsYEFFT6BWYtqE4wYeVdrg?=
 =?us-ascii?Q?CV+rWqS9epQkV9yG8Mf/uwdOk7bxTHyS2BX50nlnP2CWXevdeXevExJeSFpt?=
 =?us-ascii?Q?FzKbH8Hz5PMuVbWionQ83CQa7YwJpHfHKEoLUZWZHfDAFBIYUqotQ6yaWmDQ?=
 =?us-ascii?Q?pAeKtDm5/Baf7/Vcaaa8o234d2NPzU+SN866coPTOOmPvV9iv4IwwyPDKF86?=
 =?us-ascii?Q?TNoiK5w7R/ahxnrum7LEAA30/IYBA+giI8MpcBEeY8EEe9zTXEeTshzRUHDs?=
 =?us-ascii?Q?NYyjiRJQBicm8l1RLiTdo3IvbLg38iJv0DO4X6eDtPC/TY9LjsCGXZY4bRrR?=
 =?us-ascii?Q?H/GEh5vJg6POqvWRQeqneqBH94UaovK61JomLgFtK/RdEICNPcNRz7gzx8Dy?=
 =?us-ascii?Q?n1lZ4+ArAdhOgmBt3EYG1M9SG8PCWUOG2eiLZE9kQ6DRZkuXOndR4JgkI9N1?=
 =?us-ascii?Q?AvZFFjV0j42wwKPxff+zGpJGvdezAdGEuJW3uUwCRjnyb0lgJ2ZcZ3JM5REm?=
 =?us-ascii?Q?dzjCC6nbGx7MYdd4tqJlCz8XQ7OLfjNrO2D4Lc2dKNzSi+0L3LEgrekNgbvj?=
 =?us-ascii?Q?EwrIBKqGKhhN5mhu1NZ4Y68qZPRqZghrb2bM0BtEImpRNJHANoA5lBr6GhYB?=
 =?us-ascii?Q?0VOjE4EGwWNepHH8ial7pGby4gepqXDMOy+lYJa1mf42g624nC0MMqNGmgf1?=
 =?us-ascii?Q?j1k9Mo243JEv0DVq5itrP/gMsd+X2PKiNftxm+a8HIrXP6CqjNlUY/eGapf1?=
 =?us-ascii?Q?vXMjqgtal9NLzfSCsqQ3lU8SMZ6B+Stt8KrrRqDm4mLSGF6R0hE1BLNDswj9?=
 =?us-ascii?Q?SGWf3RqOtlmpSnNzdnI28Bx9JudPcOGXka20VbuZ8dijN6NZSME26YW5P2tl?=
 =?us-ascii?Q?a7CbUKv6TUVYUxHC/QZuCUMbxRFtcOtf/n7MYkgKru67hOTnaDrJ9090rk4i?=
 =?us-ascii?Q?+wTWmX/oQ3jvGyY5IdY8rsYe1czo+fOji0BwbcUeqK9QJICsCiO5v1bQQM6t?=
 =?us-ascii?Q?XnqsCHp3ACsRbUdAi2HMbSzFNbfmhKamJdOSpYBfvvXAlag1cwsZk8vFtSON?=
 =?us-ascii?Q?EBGQZ8BYNHwmxE0rNWqLoxCdaEIMSCuwA/soXO0dF91XGOZrkkFiHZ8WIz63?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	0LZyGuPYgiytmMNXCK1am+/n4Yhbh04JVDqG88GMqQ7LBMB7E3BTY98GwlUUpl4PjxVEwl2mX3o006fr5ky2D0yudRFg4xHYrMhv0UaIzUUVV9mc/KEBa1Db5fENmnVn/FJ1sHpW84Fgr1RfX/9vHBif7MadUCyLGmIcJ3kTT7xgwE7y1CgZVhtMJQo13+1oRi00+T/MgmoApqnDP4cYruMgRzWKjfu3dLNraiZJrFWq1lKesWhc1aV69I21VU9pPkUUAe3NPjJFFvRS/fn4vfyt10spmfzsMr8AZNW7WoGc/0E7ES/iDktrMQd0PYsLtoRArRVgFvgLahrlP5Dn/mGhcf6rzxez0cQKANPKuIAA5lbZ/4J+9AkftPM+dBMLwqp35srA1ENKROpyJZiFvKzFfPWmbPt6r65QNjprPaogA3AnfgqBmqK6f5nr7yG9NOaY2TMSAo5KbwdWdv7B3zlYG57/IC0+ricvjP9UamDjqkVOVnXK9qhKxUbMPNTT9uen8X6mU7J1jvQpwqM/Jn3/sijz5aCcTu2IJk7o6iI13LE6Nkq2raR5/QOBK8bGvD0GSyVuA+4eQoF5GCbOF5RCBtn0rdzx78xYxMSAqGo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b0a095-c466-4157-07c2-08dc8512eb86
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 03:52:28.8713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6dmJibA8gdsHVo/lf7x0HOwNxDi+b1ea/e9tYE2KV5YnXtRsbxuIKSrJci9dcyShpvAreSxXtmuJ0kGgZ0Y01SkM8xk2x0KjQPj4Dbdkgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7437
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406050028
X-Proofpoint-ORIG-GUID: eLNrimgcr2yk9rTr0MkBnL70xYS-abgl
X-Proofpoint-GUID: eLNrimgcr2yk9rTr0MkBnL70xYS-abgl

This seems like a very fragile mechanism to get a list of clauses that are
associated with a particular underlying probe.  It is assuming that
provide_probe() is called during the compilation of a clause, before it is
assigned an id, so anything that changes that would break this scheme.

I think this should probably use the mechanism we already have for adding
clauses to probes, but with a modification to allow us to add all clauses that
relate to a specific underlying probe to a single probe (perhaps the underlying
one, or some fake representative probe) so that we have this list of probes
available by the time the trampoline is generated, and we can just run through
that list and generate the code to perhaps bitmap checks etc.

I.e. I think inventing a new (fragile) mechanism is not warranted, and instead
we ought to be able to use what is already there.  It will need a bit of
design work to do so, but it leverages code we already have and a mechanism
that is known to work.

> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> ---
>  libdtrace/dt_prov_uprobe.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
> index cace406d..34906aa0 100644
> --- a/libdtrace/dt_prov_uprobe.c
> +++ b/libdtrace/dt_prov_uprobe.c
> @@ -62,6 +62,7 @@ typedef struct dt_uprobe {
>  	int		flags;
>  	tp_probe_t	*tp;
>  	dt_list_t	probes;		/* pid/USDT probes triggered by it */
> +	dt_list_t	clauses;	/* clauses possibly called by this uprobe */
>  } dt_uprobe_t;
>  
>  typedef struct list_probe {
> @@ -69,6 +70,11 @@ typedef struct list_probe {
>  	dt_probe_t	*probe;
>  } list_probe_t;
>  
> +typedef struct list_clause {
> +	dt_list_t	list;
> +	uint_t		clause;
> +} list_clause_t;
> +
>  static const dtrace_pattr_t	pattr = {
>  { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
>  { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
> @@ -243,6 +249,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	dt_uprobe_t		*upp;
>  	dt_probe_t		*prp, *uprp;
>  	list_probe_t		*pop, *pup;
> +	list_clause_t		*cl;
>  
>  	snprintf(prv, sizeof(prv), "%s%d", psp->pps_prv, psp->pps_pid);
>  
> @@ -263,6 +270,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	/* Mark the provider as a PID-based provider. */
>  	pvp->pv_flags |= DT_PROVIDER_PID;
>  
> +	/* Look up or create the underlying probe. */
>  	uprp = create_underlying(dtp, psp);
>  	if (uprp == NULL)
>  		return -1;
> @@ -270,6 +278,17 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
>  	upp = uprp->prv_data;
>  	upp->flags |= flags;
>  
> +	/* Add to this uprobe an index for the next clause to be assigned. */
> +	cl = dt_list_prev(&upp->clauses);
> +	if (cl == NULL || cl->clause != dtp->dt_clause_nextid) {
> +		cl = dt_zalloc(dtp, sizeof(list_clause_t));
> +		if (cl == NULL)
> +			return -1;
> +		cl->clause = dtp->dt_clause_nextid;
> +		dt_list_append(&upp->clauses, cl);
> +	}
> +
> +	/* Look up the overlying probe. */
>  	prp = dt_probe_lookup(dtp, &pd);
>  	if (prp != NULL) {
>  		/*
> -- 
> 2.42.0
