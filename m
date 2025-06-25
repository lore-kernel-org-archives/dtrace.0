Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3B1367
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831394; cv=fail; b=p1A0gynCT0VOVvlP1FKDJ8i8r+TiGgxc06u7oPMQ/+TajXHV+nSk6VDAXtBonyE0rsjcRFb9WyXYRJ0oxLI75NUUtHvP/pYb1isR/6fSgULDzFfkaM/pv7C+cvDz7VWmtg2bfim4ujoLTC/aur6CTJk8jJwZwULyV8tmpDCEsW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831394; c=relaxed/simple;
	bh=kzjZ8guv0tFhYHFV9h4a0SBduSk2892t+8Q46r5Nb/c=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=X1RQc3N728pmzBQV/mPhPMVss8Rx8I/IzqXCS72IrL3182VebGWbhdJvoS6/HNQ51NOcvwXgWrXVPRjn0QLJiAHWSs1dDLu8f6Nd5oYKRlxd9RnOcsQrHx3cba/+2MVMbi+LRtv0YcTem+5GRSfasqDxECKN7QfxqYpLk6BzJbs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ktXt4rIH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qobDbY+v; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ktXt4rIH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qobDbY+v"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMiejl029821
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=GxY5SAwdSmOZ6iae6sjPoBoOxmnEW0riir8dFUJrlMI=; b=
	ktXt4rIHmZv4mjI7B9NLLRb8B3WvttsdXw5/cpPJnl1uB/Mb7outBS3+HgmkLFpL
	ATlbvxEWysdq0AG2qXl4AtAhn060oizk3mYoRm5/mCe2dwTRHK+64DtWGCRtXyTP
	ILSr+nyMvhWQB28NT353Kc51P2w/+WBrdjAE2LLeJKARxbNWpuMKxf0YziiUEFYp
	1jUs/76DI9iQUvvDYB7g0WLQCLXEicQ2vw77vyyJKQXZMtJBd0IIUMKfWIBBDm/C
	2vN1CfPozIqRWMYNZBE5fNbGAbaQmYWdjMuM+ks0NBRxxEnqc8Isj+5H7tTTC4B1
	AgqkLyIrGsF4wetYBVXCNw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds8y6mg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P3iWqE038894
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:09 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02on2052.outbound.protection.outlook.com [40.107.96.52])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehr5kns7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 25 Jun 2025 06:03:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atL64hGey2Z69O7Sga7HePhk0Eyn983ceSy+Zfb13vpyFS2S2qrNgeX0577lyhRuSGhdV4NDiVAw9oiMkxU2AxVubkj6BweD7U2q83SLOYrW+vZgyT0hnE9pZcreN1Q4F7y+f5S3KjwrV53RvTmq/jzH38zIkyTD8mYq0d271tR1DHkoJQRIUM70lEqNCZ1tXFIeY6fKolqLGeGKzlc+9nDtNw0aR4/4iIm58YrnRMVJgB6cgk5KgI2BzSUmY9Q5qHlqfRTXuW55c+/7RMli/NuKyDG1qWuykCYdePCrXA6kG3n9hi57kifkgiQWNYx4oF5Z+5mR5TEYG8sCHfksMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxY5SAwdSmOZ6iae6sjPoBoOxmnEW0riir8dFUJrlMI=;
 b=qwPCLHxOQ4w8EDa1BOFGYBphpMyCT428kRxmCaOksW2SMzm9vTe4dxen9IODaCpUgD1juYfrzNMtfMD0xItcB3sNCEAVJVei5uNiNVi6H5mctmjhNu+xSmyWJPWH+J8PJ7TNZ1Eb2668F/XR69zNt7x1PpGUTpTuc656R6vlqVdrgcreU/grcvsuRmvyQahQdIJ11WyeAoA9OgQzT3iChizyUkdn02ybwtCkb4FO+AYrMzJ9jZAmKnyEBb45Wcz+cAZUQvl1golJI11yoMYpXKsun27iiNcLxbew/LOxG3OBdlEEdv1E/dcBZOYJl0JSb1YLz6JYSoewnabDro5FqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxY5SAwdSmOZ6iae6sjPoBoOxmnEW0riir8dFUJrlMI=;
 b=qobDbY+vCT4c0jsIcZD15XsuhqEO/q7WEVw4itONqT3H8WT980u91B7w2QqvtSc/MR0Ja46WTeDbVp9ftVmDLyNKSK6amGt5qSTc2JIpYsFR/tscl2qU2cCvnqizljrWgCO7ep0dgMIMgxTYjA3E47bZteQtVpyshgVu0kXFfds=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by SN7PR10MB6476.namprd10.prod.outlook.com (2603:10b6:806:2a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 06:03:07 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%2]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 06:03:07 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] Optimize USDT discovery a little
Date: Wed, 25 Jun 2025 02:03:01 -0400
Message-Id: <20250625060305.15707-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0141.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::26) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|SN7PR10MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 221362bb-ee10-42e8-7809-08ddb3adf49a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w7N6u3Pm9Dpwvp1sw+w3GFoBOYbatjwP+jhJNCr6N7F9NqiPGeUoC3gtsc11?=
 =?us-ascii?Q?Tlz/ly9Nq0jaAoGnvORXTrmXF8mj4jwExHbRAWyDEy350oF1HuCfPAqYig9o?=
 =?us-ascii?Q?uXxYRZpu1TwlMsqsx4pASFicLQJ5phmI6kh77mY+q6hLm/8m/Dl5DftfF14p?=
 =?us-ascii?Q?tcMKbOukBkd+7KVtJlv4eEZ3gHsCMmrugXgr/ZbY9CEGPcaZcgRxp5qzaSXv?=
 =?us-ascii?Q?WEjyGhpIOWggRqIFKufROhaB09jklGEPeSAHwgh3eUQA91XbcB8M9kdsD20f?=
 =?us-ascii?Q?wyYbBwr3uqSMPNwE5RxVXaZgrcrbH783bwjn+hSmhO0rsgiw6N9xFH2rvtWq?=
 =?us-ascii?Q?CJfX7dKx7+ghDCEdDaXrZZWXQCc/c3x19LZfzMweHbDvzd53X4TyJ38Ovu9U?=
 =?us-ascii?Q?fCCKenXPCqaxSpOZCGpStexofIK93HCppyk8+0NsKnUuw5Wd/G72iQwEEppf?=
 =?us-ascii?Q?fuqCltMTYM/T2jwvNY2+NwR8EN5MES8dqFsjESYbP66+mz37skZLsiGdhZvb?=
 =?us-ascii?Q?+KxlrQXwrk+2TRdetqUaMe7I/KQ7YuRG4lgqWR53K5dn/m6jghlryYeOiqdE?=
 =?us-ascii?Q?l3XnaC3NE7HVUZIi8udH+ghine4BtPgwRvFL/SVXJR4UJ3CfvKFWM7Wh3Thr?=
 =?us-ascii?Q?sbOzwzSBhFdgvGQQXb8mwv2PA8pX8PF1v/j+s4IeIkXpdRQWZQDZXGHGZYyE?=
 =?us-ascii?Q?NA63al0DvOqFHQfgQ1GcM4PDRhwFGv8xIpRvfwis2YzuCTSD+1GEjcx1QBfY?=
 =?us-ascii?Q?Xa3o8qT3NMnREeW01sonyKuzAvAz+lrqR/tm/a2Q6fx4mKH7/TGHgA4E2OFA?=
 =?us-ascii?Q?qDuzrjVelBwDJn1mVK1u+0jvzW7TvGP1P0NCXh93hUN9BSBs1FppFiFP/+7J?=
 =?us-ascii?Q?CDiA0rvmEiT2ZwQqNyr5a2T4O04dQGa8t3jyRrhXwhaLxA8olH49bySZgsIs?=
 =?us-ascii?Q?OZUsoQHiZMM7cwNqaAvJCRgxXgoWM9JvkcR9v2SCsCYjvNSnd1X8Dm0xCOQD?=
 =?us-ascii?Q?qlRrOGP8Ag6YWyP0AzL31jKzu3lrBUR7sw9Ie1FtxjStQWgjUy0VfMg//fQO?=
 =?us-ascii?Q?G1bDbzodoBAOcj+mC1Zlo/h9GlT8tZSfMrX17Yr1Lygmwf1xrOjLSRDlj3e9?=
 =?us-ascii?Q?Zvr0h3xXcz2ShSGx/tFpyvm7/WpSXs73LWXdANNeuS57yo2CLsPdou06+/bo?=
 =?us-ascii?Q?UgWBT+c9Yh+d5eRk19nFdB9op+SfID++6dFsRVfh+qmsATyLa3i5Sz7UTTVP?=
 =?us-ascii?Q?bL2TdsCIyA9GU1anPkaIV3LeYEf1IKFJo4WcGWyctnX8gQmEpgM/P+0UOxRp?=
 =?us-ascii?Q?doMOaAZNryETD/V5DUCiE5ihLP9GRflox8N7ZjcwJBFPFSpwlfTOvLkzQmrv?=
 =?us-ascii?Q?D0LQoTYi97k3UCs62+d2MrLhLhOIUsfo5IRe9rsNU77Tw6cKGqKhHYRWniMM?=
 =?us-ascii?Q?NygFjIBc2ns=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bpc/s85ByhytBe9KAGcjpNpMNjZD9kxK3jpHA4BnIZ1CCUooHzYqEwuZDh8Y?=
 =?us-ascii?Q?Wqow3YOUE9H+tlVW8CMqIdTqRfQz0zaXFz6iTpH3ogd7/re7iifc8PsUCq/Q?=
 =?us-ascii?Q?krFxluye2EWuJAulQ0iSqz/CRyD2yF79GGEwIM4YqYbN7fHJLjw7gTnlcSz6?=
 =?us-ascii?Q?KtcrGbq6zgML1IrCrG/A2u8SxIke/wgYkXZpQbHuze5XLM0g6avXweMQRtyO?=
 =?us-ascii?Q?H0vYZseD1w9jJZT7yVCoYLXouUNSKqcahr+qfinUm9LKJkTaITi1k6/V0TxY?=
 =?us-ascii?Q?EwotHyK2/RKh6sS0VoHHs0T97vvdaHdcZ4iQ/PJNf0d712zX405Cq2XsWvpY?=
 =?us-ascii?Q?5ctEPhIZcTQ45YvxwJg+jt69fFOc5uxXvV558gRhUyKLmWGPIM6IQZijmjm8?=
 =?us-ascii?Q?sZdA9/P5xWv+/NnmFJwdRc1INFpKJTebG6JbQkvufu0mV0BwAVvGHEATLLa3?=
 =?us-ascii?Q?Iyc707GYi0HtQkn5PxiCvfUqSEgbn7Wek8pyuKgzN/jKoeiminMH+e3S7Urt?=
 =?us-ascii?Q?ScPptM832JXp0ZKx9ZTTJOtTmlUDD0yEFt6wr4no20Q1YepW0FXcRi6OxCtZ?=
 =?us-ascii?Q?EdMYuCxn6XO6ftxRfTVcII2Gy0cMaOPtghcxV8lkJPhLkJIkjUhoc8AoYnO4?=
 =?us-ascii?Q?CykyOl8YKrINpTgKhsYOdIADI+B0mnD1xxRdihMyx9F7YtcBmncjRk/TvXA7?=
 =?us-ascii?Q?RsBDzo4KdKSZzCIVxUv+EnFgvgQ9jkJOXu5VSiEr+SjFRj2HWRAQHqYqxBgp?=
 =?us-ascii?Q?4/lAZIU69wJN8BPuhfVp2TChi81nyQgazOesW7N1tFKa+vOStyFztjpOfB4E?=
 =?us-ascii?Q?q7tMgELjTuR16Qr06sBALILCHxg3tHvj15DHiwF+Wxlp+T7P7EeUbAqlqOkY?=
 =?us-ascii?Q?G5NVXFEZ0jqdNCkzAcVF1FGdFvfUoMS+W2YJ3KPjdEmRrWh8yUHDKjmbB86k?=
 =?us-ascii?Q?dfOQB1GDtEHunLZAgVhQeg1qka/7nLicOUFQQaBwyw6eyHbOLhr47x/IVjtz?=
 =?us-ascii?Q?godVDqI9ed1gQ39VKkh0pP9w8iHdozIx688IDL2iBnKhR87fZWZ4q6ST8JuU?=
 =?us-ascii?Q?BuChXQ4fT+mluUBWUM1pvkbhSM4RqLOpSOZIobg4rUykAsCIxyZ9KzO4d1vg?=
 =?us-ascii?Q?lIe5F9HyNjnG6JWfoJ7J9WijiTuTVBO4eHkEycnFtPV9BElOW2VM6Ls8vUDc?=
 =?us-ascii?Q?z/Dv5nKyIcBVesPjJW8KA/ZTh7147kBgeyFkHJoCJopsxpbTjt5It7Ye6KsF?=
 =?us-ascii?Q?6mT42yZJShUmPD4VZiqMVy5nc76/PU7HdVzePsneXvAEhO62moxxLaDY5V43?=
 =?us-ascii?Q?PgtF+rB8RUFjOWNTw/4yWWH0lBoToDZvuHT6QVrlChF8LgdvUb4jgZNaSJS5?=
 =?us-ascii?Q?bPvdEJXuuGD6W0yFePQm04ftdBA3X6J3wdfSY/PQT7le739Bg7f4g+kn1vQK?=
 =?us-ascii?Q?RdIDyYsjPmUWgNTIRWlWM3GoSe8vEI9uAnSAXPWwOI5LRiEps7lMSlatp5+W?=
 =?us-ascii?Q?d8lAD1p4UqsUB0TWVATYqXsN6IRCLOiqDaz6B0aru1U3wSlchH+ZI8NYuiDG?=
 =?us-ascii?Q?+xkfHoeFIgw0XbfXQpUC7ZiGVHP0enUip+ETwVKt?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GOenAWBkHR2Cc+MRF7C7v2P9RNYK8mGUNJHt8wbfG447AHYNkOsPSJc57u8LDqY+9XuAlfKz0DXeOsODJUqGM5rmp3rPh+y71VRvzqNdiDziVVOoDWZR4/TFF1y6mqlg3Xxj+rgYEEqcKEAmaQ08FSqMF5yOJQTdehmlFjrhXiolJrXKiRJAjI6R0ntLNZ1Ce+hqop4qRiJTDUCC4F/PNsrnuxshGLvjs6K/2dnnD9aUAlKPRTJcypkQlHQvfmCvZesrOfqhCE72JzDGOEutL9ukUGe5jNydmpJzimDCehhdB3EUSAQGiM49mjRtadsf82FOejABEG29hrFWONcReaEaf+omWW3RimwuLZrBH2/oHxSOEEqzU6mS0mCrR6Q8A+/JIAXBV3P+W1BaGn/eJ2bqickYHQRVPAMm3EbzxznTta8nICIGKqIKJi+htIsXMp51a6jkXZH5/jlBI3DVuVXLZ4p+LQDPrCw916qRFvex3EEFQdSz9QwkAa0ckC6rmxlNN26xOKaZ8dAdvYBnSpdyCAplpmY5SaHxV/hlzIl1rNmRktlwvKNueFma0f2T2qQ3xSVGIy3Zlw07PHkqJZXbV5FNr7YwY6wxhaHhuko=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 221362bb-ee10-42e8-7809-08ddb3adf49a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 06:03:07.2537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLETeKCXulWWuoKhhTkqpcVisMxJVB11ZopabABBtyz+4AnAZM5BiVA1wKtA5AjfYXacBva5soPizFXc3En0QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6476
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506250044
X-Proofpoint-ORIG-GUID: eFeTaK8bLR5LfFr0YR12Kz_GgLoo1yGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA0NCBTYWx0ZWRfXyfVR6u/Wj8E5 WS2MF4EG/VfHziTgOzQKOn3ziTNPYvDDdg/7ZS3IpWuzb5MH3nMYygNGY/CQHRcKOynXP411kvM RRZbNCK8AqgUA5G6YQYCknj81kImEC3PCUVP3WYlPCzD/wY8Zooy1ut7t6JQAHxtsY+IH7wmUC+
 WKGDdCaRqoUWwzGK3NnlhynQG7Hb8siuize1ZLUb07zlQ5y4IokBZgl4nvSpdTtq0bI90V9gc7s EW6KsClnNBjGha68jh7GchLxEdGWdHJcbcDTe0Erq9SP5yjSyW7yFu2i7OtG2O+Lo1ixG0dpnVk DmYIFzo0Aq3IAMz7ROtwCPuBwmRrMlP+oxpVudsvPEHokuQ+vHfH5sU9USS16m5NdscUsLMkzK0
 Y7h3gtf+wKS9R0nttjCKSyHw2qMWJ51bBeiCbzgRmoemMD1g++wnTB9f2Acc69bZrFv5mCet
X-Proofpoint-GUID: eFeTaK8bLR5LfFr0YR12Kz_GgLoo1yGL
X-Authority-Analysis: v=2.4 cv=PqSTbxM3 c=1 sm=1 tr=0 ts=685b911f b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=-lFj7RdxY2rfU3zXaNMA:9 cc=ntf awl=host:13206

From: Eugene Loh <eugene.loh@oracle.com>

We want to reduce the performance cost of USDT discovery if possible.

Specifically, a number of statements -- with probe descriptions such as
"dtrace:::BEGIN" that could never specify USDT probes -- will not get
their clause flags set with DT_CLSFLAG_USDT_EXCLUDE.  So these statements
get considered unnecessarily during periodic probe discovery.

Therefore:

*)  Expand ignore_clause(dtp, n, uprp) to support the case uprp==NULL.
    This case is independent of any knowledge of a specific underlying
    probe.

*)  During probe discovery, check ignore_clause(dtp, i, NULL).  This
    sets the DT_CLSFLAG_USDT_[INCLUDE|EXCLUDE] flag and allows faster
    exclusion of statements that do not need to be reconsidered.

To take advantage of this optimization, users should specify providers.
E.g., instead of "BEGIN" (which could conceivably be a USDT probe),
specify "dtrace:::BEGIN".

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index cf5cfd431..5ba50b678 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -504,7 +504,8 @@ clean_usdt_probes(dtrace_hdl_t *dtp)
 
 /*
  * Judge whether clause "n" could ever be called as a USDT probe
- * for this underlying probe.
+ * for this underlying probe.  We can pass uprp==NULL to see if
+ * the clause can be excluded for every probe.
  */
 static int
 ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
@@ -512,6 +513,9 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 	dtrace_stmtdesc_t	*stp = dtp->dt_stmts[n];
 	dtrace_probedesc_t	*pdp = &stp->dtsd_ecbdesc->dted_probe;
 
+	if (stp == NULL)
+		return 1;
+
 	/*
 	 * Some clauses could never be called for a USDT probe,
 	 * regardless of the underlying probe uprp.  Cache this
@@ -525,7 +529,7 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 		 * neither '*' nor a digit, it cannot be a USDT probe.
 		 */
 		if (len > 1) {
-			char	lastchar = pdp->prv[len - 1];
+			char	lastchar = (pdp->prv[0] != '\0' ? pdp->prv[len - 1] : '*');
 
 			if (lastchar != '*' && !isdigit(lastchar)) {
 				dt_stmt_clsflag_set(stp, DT_CLSFLAG_USDT_EXCLUDE);
@@ -555,6 +559,8 @@ ignore_clause(dtrace_hdl_t *dtp, int n, const dt_probe_t *uprp)
 	}
 	if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) == 1)
 		return 1;
+	if (uprp == NULL)
+		return 0;
 
 	/*
 	 * If we cannot ignore this statement, try to use uprp.
@@ -751,13 +757,9 @@ static int discover(dtrace_hdl_t *dtp)
 	 */
 	memset(&pcb, 0, sizeof(dt_pcb_t));
 	for (i = 0; i < dtp->dt_stmt_nextid; i++) {
-		dtrace_stmtdesc_t *stp;
-
-		stp = dtp->dt_stmts[i];
-		if (stp == NULL)
+		if (ignore_clause(dtp, i, NULL))
 			continue;
-		if (dt_stmt_clsflag_test(stp, DT_CLSFLAG_USDT_EXCLUDE) != 1)
-			dt_pid_create_usdt_probes(&stp->dtsd_ecbdesc->dted_probe, dtp, &pcb);
+		dt_pid_create_usdt_probes(&dtp->dt_stmts[i]->dtsd_ecbdesc->dted_probe, dtp, &pcb);
 	}
 
 	return 0;
-- 
2.43.5

