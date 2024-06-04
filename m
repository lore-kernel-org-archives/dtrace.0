Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75129149006
	for <dtrace@lists.linux.dev>; Tue,  4 Jun 2024 18:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717524713; cv=fail; b=rx3eH+wvfEV87OLjuCE4Ut6yS+Qz/zLsQ9pY0lVuT/6LgUNJ3iAJgSqb79rFGmP2ZwccrJU5XMruYibuYCHEa/YoXFETve7N3BdOuJnbm6GygEoKL9GPXkNAXMQeCaY/kVXrb5hfAZvRl2dWEJDOUFYMvSCIz8mKb//mNjYC034=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717524713; c=relaxed/simple;
	bh=eWkT6lWpgoyMgxIrOvunhTqWbJ+31aJiIjDUMPmbKSk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IkJo70+j7gjZZ6niVt+U/uJ1O31z+MPxW6ijnuPK/KUFtkp+5SQhJGVxHS2BqZ0qVHCIvlMS1+Kv0cJgNKlqNu2l9M1Z6Dhdu+/7v5uJ+wGNBpf5GIcJu0NwIsBgpXkOMN6/JTDjej7u2txejnlw56LrAkp2pzIy1FWI6S2h5Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 454BnQk2026488
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:52 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-type:date:from:in-reply-to:message-id:mime-version:r?=
 =?UTF-8?Q?eferences:subject:to;_s=3Dcorp-2023-11-20;_bh=3Dx6Re2mSWi7uCahh?=
 =?UTF-8?Q?4VKtg355bbw4BZqLIInq7OForIOw=3D;_b=3DkSakQCNMaF3yowZyZWqaBFqq42?=
 =?UTF-8?Q?ZIz5tGOsu0CLguf1cAm1Dkt1fGL6Tn/c+bHwbmgdWN_SyY1a9sE3iV1LgtRNK7h?=
 =?UTF-8?Q?3psbX0ewn69Nc7Qyfi24zlyKYBb/fmCofZVSNeiVGgbGsdr/_I5B79ke4x+TiXf?=
 =?UTF-8?Q?EPclDnCpUcpMKa6ks8yPu8WlNRFlb8FH5tPpHFetnlbCW7lwcx2Cvc_1m6DuRsq?=
 =?UTF-8?Q?aIa4VpNZhuy5CJp5WL6ZctiFhpLv80x6dfB5hMHjBVKnfBtto5ugbFBFPXub_xS?=
 =?UTF-8?Q?FF3X/tYmhKo/9FHzko+chEo51LtX/Old8QvIew8Qu7DOHs9Rzzx8vEZkohkAOtY?=
 =?UTF-8?Q?BR4_iQ=3D=3D_?=
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yfv07wmud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:51 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 454H1GRi016136
	for <dtrace@lists.linux.dev>; Tue, 4 Jun 2024 18:11:50 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3ygrsag3hx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 04 Jun 2024 18:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqGjkrDOgX4swbOfIQFdylM1yVhyAQc4zT6w5kwkp172ub5jG6qbDBGGS6+oDBFZHFZpRWXAHvRX2w5y+Cf3u6Sve3nEEwkit565WwebbKNL7fT+yu0taxZQG/Kw9G1mVLRauYZPHkwxDZCjvosgVG95eOmHilTvlxYoDna4fuPgsr1gpZ5SrtKSQA4uPjYm+bgmRBor73BKS4AGCX0WfWH0Nv6IC/INVa6H65Cau/LK2M1gB8AfN9hz2D1yE34wFkIJVvQlIMKwdXQjcf+RtHriCw8FuTBMLgxMD6OvJqSuXjsusi2DwDDFqx7fGeatHUhudozyHzX1FCCCyVBt9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6Re2mSWi7uCahh4VKtg355bbw4BZqLIInq7OForIOw=;
 b=DFBWVAWifbQ7ZXxbG6QRCd1X3c0pfEVteK9tTl32ILoZSyKiReevuOsOxsGfwD1PYPjgdHXekxpyXhidaCNZZrbJcaVmkPiwi1cUkcDbodMPYMKTOgh/GKWNQK8L62YR6oWSYTryschkbWads6jFhX8OhrpPj5fBOYzo05980KPNrva/kCtxGD6lsqVKSc2QzzuazmMbptPirwbOCBnkNj/EBUrWWWOq9Ey4TOjQSukgfr7ZZQbvRky6VGdOrqk1OyQQuGkt+71ojZ5oTCdZzjhD0nyG2Y0isqmVldfjTLKxRbQEWSvuot+Dzl9oT5Hc0xct7IrkNwih+KInUYZiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6Re2mSWi7uCahh4VKtg355bbw4BZqLIInq7OForIOw=;
 b=qLm0VMNqzNRpR75lkep6Sy7tWakgGg5xYiijy03un7X8FSmMgJwmYJqnt6uRTUuzIyFRjfnZgiIE2W8kB853TXTJXi92laU5H6XSdIPvn20HylzdSMvvXfIToDIRD4BKTHxZ1eoEToNxvt45buP6lnJFrUdPKo1249M8da01AQs=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 4 Jun
 2024 18:11:48 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:11:48 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 06/14] Add clauses to per-uprobe list
Date: Tue,  4 Jun 2024 14:11:05 -0400
Message-Id: <20240604181113.11505-7-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20240604181113.11505-1-eugene.loh@oracle.com>
References: <20240604181113.11505-1-eugene.loh@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24)
 To CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS7PR10MB5197:EE_
X-MS-Office365-Filtering-Correlation-Id: 59bfd8b1-0b0c-4d48-4e9c-08dc84c1ccb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jfFAgNRXatvzu5+IeG/P0xj48plM6zejfEkPa1ZXFT1SQxxU6+SuUY+go+l8?=
 =?us-ascii?Q?vlY4uP9FQROyWBntFxNe/okL+qizeMwepJir3Chu3p3KtEeceEGK4N/MfhP2?=
 =?us-ascii?Q?xMwS7nZqiIA5rst4tk40JH6poQ1CVhp+uWz5tI7dlYdZ4Se+3uJoh9dImmAL?=
 =?us-ascii?Q?7eWTCKyXH74DlT9lYd+ob9zVgWiFNOugMtGvZDrZl4BRR8gtNiH/CT9/Zvq2?=
 =?us-ascii?Q?BRTfWveQI/DxR8pAzXsld4bBcHoT45TTcra1Y4JoCM3GuZp+XAGwBuRFXO2m?=
 =?us-ascii?Q?fecC/EUe25M0LOSV7IPgjkHTfnk54K06DG4xQwZPmRStskuKbj/GEbh+yR3q?=
 =?us-ascii?Q?N/Xt2W9CtrYHQ4InIlO8k+UyCRMwQB3MuNrYSpD8/iJfXEIIj7UcwgUN0ACw?=
 =?us-ascii?Q?Jf0X2EVHIymz9iqMwHlK3y2z+mBG7+DcJ3K6jHr/0rlY0Zed+2irDMsDc7iE?=
 =?us-ascii?Q?iCLxUK3F3YvOxS7HUT9CD6ng5CCWdsbQxD9N4se/CDiF4jwdunXvaZTv4JBW?=
 =?us-ascii?Q?rS6DT6B4ff23/ETF/YztmHu8cgIR6R4X6T3ybEYy9ctB0Lg8dtPbOyftmevd?=
 =?us-ascii?Q?YMOZDSdKaYRidjSwdEv3hShgCjGf+2q0qzPP8eXWzdswvysc5DrQ3NMWF59B?=
 =?us-ascii?Q?q4zaN9bNE03H453On0C0uDHGmVGkb/v7u8yCNqPzAeFOgw1vS1ZbwYJJLbX7?=
 =?us-ascii?Q?esfRGqI2tojnoGvTF35IfX6rkYd0UkbQM/b/7kdg00kx1sAgrIJqTNpB1+fY?=
 =?us-ascii?Q?SWUEMjG5fJ1jubFTyvoKfZcgXI9d6czhfMLXcRZj0J2hFHgzm24m1ARHpTRy?=
 =?us-ascii?Q?8VFXFRnj20JBR+4EKn7hmXLl7JmSZzZvxLIDMBscVW/vZejqEz7bPlEBmK4i?=
 =?us-ascii?Q?UgsEzEvh9FTmMQfVlPnOcTpZofoqbTTSfLOwXUYpCHmVfmW5306m5ldXh80X?=
 =?us-ascii?Q?VYmaULKQetskCghpLCNpvsujTrVr3Dxi6gTrtFa6cMwe5ocG1gpZs/ZZvu+9?=
 =?us-ascii?Q?FWpvRN8DhI+TVIA03OJ6DXDokcZ4dKb2xzDr+t+xcE3FVKksu5zLqQKHwhhu?=
 =?us-ascii?Q?HNh8eluKMloTRBXSl3LoEaYngFio1MHrOIMyfWStEkFXmhgkpYmqCQtSBSeH?=
 =?us-ascii?Q?6qLPGjQigJ46AVBbkYzG6MuHMJe71IfsWzpcjb3uDjrydlhaYDLCmCTfgR/a?=
 =?us-ascii?Q?YaV13G9cVXFB9kYrki2oGFMGrAVDwrI2/+Xa/tPVYp35lgy1xJPtHIJimbro?=
 =?us-ascii?Q?I66H4e+aRazJDsDrjM0YfHG4PqXqa9a9DMKV0s/YCA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WeijMoNBTnZuT/DtJVAnx9YZ9+y1ByZ9aygFJ+ZIENJKc98MVd46KE8OmSX7?=
 =?us-ascii?Q?aKFExNhE7eySAKa5Pqe1Ex043dtwSBGaYJDoFFu0BNjJLXHow0/wAunysQnv?=
 =?us-ascii?Q?nRKZdiW7rFgYmjTb5rXsy8Z49ZenhnLmPzkMCVCrRpytJsRdSLybGy2/FILI?=
 =?us-ascii?Q?572ru17CwCjyCgzBu4zgZKqnUNCHpqR3leNY8fE3V0rZazlJJ5p5q7RqsMx4?=
 =?us-ascii?Q?r85uYh/Wge7gw+QRWHgN5VKluh0aRsOXGRWFU5rDCm/4yHJIZ2PQRKLvmbp6?=
 =?us-ascii?Q?KcLd5cp/zUXBDV/8xyakW9+L+Kz5OuPIlJR9b0kV0d+jIW/VDlZ7fYqjlVwz?=
 =?us-ascii?Q?Ku2RF0cfylY0d2dkTzUZGUrWGd9aFE5tRwfWEbL+ves/IITDkXTe/IJO75Q2?=
 =?us-ascii?Q?Zeb5PHWbwXLATV3zIwA9zCyqBE2aeL6WSNbrpVtb3vnPYW7Kt1JLFnBBl2fk?=
 =?us-ascii?Q?XypnkarMlEXGYQnRBaGYhqmCowDIYaRhyhVBlx+y/OfsEFDK33q2pvx9/3B+?=
 =?us-ascii?Q?UrAzg0rXMf/RGM/n42A6LmUkmyS6SHTabe5nGEhBMkk+PqXTlCexradkJlPT?=
 =?us-ascii?Q?57SxCjeSU+uaw3ac57fa6hTraCJmWPfGlGdpuKr9DWhXMxt3FJn/LUBW+/jP?=
 =?us-ascii?Q?e3D1z/01fQifOGpx+DkpGcSFztKBtBu6T0kZz/9Hhzc9McDRJrcV8HUhBiI0?=
 =?us-ascii?Q?6raDgSXrA8HvhuEykuiMVvrTjg67BDCmTQPKIUuJzScRm15JWpC/9xcbmaTx?=
 =?us-ascii?Q?6bmJix1LdIaSj9aC87wnYIC12GDBlkaXV6UfIHS+kPa+sjX1VYGXdPuCCn70?=
 =?us-ascii?Q?PtY1+yAIu0FpTX+/Q6OFJo22837nAFFowcSSDlqFXeVk5ZGeUalJETzpZTBg?=
 =?us-ascii?Q?fzipZt7pxpSDKiN4P+O+tzn3wcTjdXvdfNxcihpegnQyis1WoFkqYw5Dumqj?=
 =?us-ascii?Q?WIbJtqtEbRoy7ZLXN0n/BX3coWAGee30/OCp8gT5dWkQNTbx9vnJLoiGbZnm?=
 =?us-ascii?Q?GKGyIUR70Vhoa9bknrpSm+Q7mCAkJQDWjciEIon3T+EwRf4qpCPaqEc7m3as?=
 =?us-ascii?Q?VJxU5laWl5ithdykshOx0JxBlOUE+S5elJLK/VvgyKKErUjuWr+XHwQ326iA?=
 =?us-ascii?Q?WxhLD9BL4KY5u0nf6hyBHP4WSYJP9Xck3j7WscElGQ0eWKBvK4PqQNZJLAte?=
 =?us-ascii?Q?hD+VnaN9axfNL9Q9ya7G0+KlsiJvv2xq2BP/hTuekt/8MnK9XScl30xD4/4K?=
 =?us-ascii?Q?C6VyWHsl8sjc6jqVqP4udksv88k8P8PuuxPWh1lYTkqu3VVXYRe6wzhtmobv?=
 =?us-ascii?Q?/8W4FjN3N4G4oW1rEQUUJJ7nElBo19OHtH9/vt/TtL9w/aE85oMwFq1ptY2w?=
 =?us-ascii?Q?70Uq7Mi4xofZ1BZDcSwtH4IZxeWR+hCrQBtkYFGTbQ2K849bluJfnJBE2Dfk?=
 =?us-ascii?Q?XkBjQ+SgIsj0BQ6Aw9Jjp+yItWJbr0vYaYTUYOFwjvnHcXjNj71EQuRtmq73?=
 =?us-ascii?Q?fNs2n8Uk1WUfItQuPkZvCYTG2BD9dSaYldcC1N2Wl99yOC43dhiB/cnoBcac?=
 =?us-ascii?Q?+Wnzi+qjif/5DNYoPC6z2jcG7LLCfNs7GhpPGXJz?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	nTo4e0EPa2HPv4/6i/FDXPNGliMyM8VWMQ/8Hg725nSzMOEYNCmTdU2bcojJ1+mopnnE4/SzuB8EETmWiJyihu0C6yR0Ccz3Xd1svDqJ9oUGpigNGM4z4SJp3yIJlIQOa3k7gm3IuT7QwhnIvXqvkYTtESZWrPsvPSxOWkczCcasgjYHQdvgv+32X4s9sBgFJ39d2heLif5ycZC4ng3kc6yvINS+oqu9eWGi/acFbqSyCn0S0wbBGFyTUIgTeLHLcssb5+93QXx/s4NQK2XLQ6EPoAFsJ1+9bNN5/Ziq+FIEnGxC2uaazRwWGpR+0s5UURiQYg0Y45YulCR76JYT2AHPIReN1gXBBk8ZInMWTS7FoPj/AKMbqFXoKppnokBh+Rom94qE88+GlCeg8jDZ6Y8juCouEMoXNxpC2mb0ZuCU0EK9QWDsixK8VJWgAW+y54elKLob/wZEojD+T/aPS9NhJlSPu3SdIGALfC02bCZE8x0ocBjaj052oqj/bOmjYRjjYZi/3zWfuPiuB+nWzVHsqpImSOLdr9F8Fb0ySgebDVT/60515h7+8s16WXCjPvyLCxF80fj/lOP/5ITdByeHGVVTSLowo4FSvydBgsI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bfd8b1-0b0c-4d48-4e9c-08dc84c1ccb6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:11:47.8906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQ7VK5i/b6Mthz1kMYIWrJUOiOUcmFe/o50aB8qJWRfZt32y0PF3cevL3PCMy951KKVcqbvS3rj+NqSKOhVkkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5197
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_09,2024-06-04_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2406040146
X-Proofpoint-GUID: TVFwPDVq8YGh4q8LJ-FVEqyS-5cSpJim
X-Proofpoint-ORIG-GUID: TVFwPDVq8YGh4q8LJ-FVEqyS-5cSpJim

From: Eugene Loh <eugene.loh@oracle.com>

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_prov_uprobe.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/libdtrace/dt_prov_uprobe.c b/libdtrace/dt_prov_uprobe.c
index cace406d..34906aa0 100644
--- a/libdtrace/dt_prov_uprobe.c
+++ b/libdtrace/dt_prov_uprobe.c
@@ -62,6 +62,7 @@ typedef struct dt_uprobe {
 	int		flags;
 	tp_probe_t	*tp;
 	dt_list_t	probes;		/* pid/USDT probes triggered by it */
+	dt_list_t	clauses;	/* clauses possibly called by this uprobe */
 } dt_uprobe_t;
 
 typedef struct list_probe {
@@ -69,6 +70,11 @@ typedef struct list_probe {
 	dt_probe_t	*probe;
 } list_probe_t;
 
+typedef struct list_clause {
+	dt_list_t	list;
+	uint_t		clause;
+} list_clause_t;
+
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_ISA },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -243,6 +249,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	dt_uprobe_t		*upp;
 	dt_probe_t		*prp, *uprp;
 	list_probe_t		*pop, *pup;
+	list_clause_t		*cl;
 
 	snprintf(prv, sizeof(prv), "%s%d", psp->pps_prv, psp->pps_pid);
 
@@ -263,6 +270,7 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	/* Mark the provider as a PID-based provider. */
 	pvp->pv_flags |= DT_PROVIDER_PID;
 
+	/* Look up or create the underlying probe. */
 	uprp = create_underlying(dtp, psp);
 	if (uprp == NULL)
 		return -1;
@@ -270,6 +278,17 @@ static int provide_probe(dtrace_hdl_t *dtp, const pid_probespec_t *psp,
 	upp = uprp->prv_data;
 	upp->flags |= flags;
 
+	/* Add to this uprobe an index for the next clause to be assigned. */
+	cl = dt_list_prev(&upp->clauses);
+	if (cl == NULL || cl->clause != dtp->dt_clause_nextid) {
+		cl = dt_zalloc(dtp, sizeof(list_clause_t));
+		if (cl == NULL)
+			return -1;
+		cl->clause = dtp->dt_clause_nextid;
+		dt_list_append(&upp->clauses, cl);
+	}
+
+	/* Look up the overlying probe. */
 	prp = dt_probe_lookup(dtp, &pd);
 	if (prp != NULL) {
 		/*
-- 
2.18.4

