Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E11423F41A
	for <dtrace@lists.linux.dev>; Sat,  7 Jun 2025 06:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749276909; cv=fail; b=DFYdn1V6oiDiOsJ6CMMGitU2HYPIpw5s7Xoj0qqumMaH3r8YaBYgwHzPG9VDcQCN2QI7x+292DAh7DIna6v6oo/V4S2eTR9Lks6JCse4FrrR4gu1R13m1717mDRIz2kF4Z/2Ofre5DXinXoAxWvzlvwWoz7IvH5shhx+3akHh2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749276909; c=relaxed/simple;
	bh=TAeT9aXbirEyiqPvbASmbbkMiAJ7LXT5e3gVa1LdCUg=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=TLN2k3uUG70aQqIQptF2vSO6mqrx28K6vOu+rQxgSUlo2vgK+oCstGgdPto/VeMntWrJruUFVgzgezvlZJV6UFxUlvcZ8qMkTVW5E3L+bjUKNba8g2FkZfGCkDr9C0CfKUT8CycYWJYk5V7OtA3nwkGSBxMENWb8OA5ojeVjENU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bTWzEFEv; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=IujxvMAK; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bTWzEFEv";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="IujxvMAK"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5575A2dW001628
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=l9zzolvMFINj6OP5fCc6NDHE2h8BnbIAA2lkxMYgMfY=; b=
	bTWzEFEvS8nXYw7i/K/ENzY90iOIdmXw/p0NUWWnFgFpnANflKx38p13qc/ykARM
	1BNY7Ti6H3Wf1ynPuYyp+EhpPd/uz5qFpAoXMDG+n7wCx0p61g+ANGQJy+DSQaEa
	tc1H1Olfwy6gRux4iq7E6IggvD7a66JDLFMj7H3JBWFBpl2zoMdJq03Hr4Y7nyl/
	gjrL5ywAxVNX7f2m91tNNCAEw6qEKW+Pz7EgvP40gfUYrP5n8efuReQ1bCtKCNGe
	6nA8D6Iy0YNRRsGZgEW8ynPlzj8HDpMwJE9n6mR2CuNWvOgnWzX/0Vtnlz+vj8+e
	ca+Ugr+40lXAqDPconBtNw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbe831c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:06 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55765vNM003191
	for <dtrace@lists.linux.dev>; Sat, 7 Jun 2025 06:15:05 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010015.outbound.protection.outlook.com [52.101.56.15])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bv5uyqr-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Sat, 07 Jun 2025 06:15:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBW7noh4mDVOLoYxR49rXUOCtMe4avlPoqgOXlGf1XTZ18pmoz3vYSdJGguRzIOpyiYiHJvvkcD6wSL+eEt8wQZFErGuNLhgUImEt35VaSkEWZq23zUXpPE+Tj8EeVElXNBvNDiUGhktgORaZpsFB1YCRLuFesq7ewc9NHSfR+KP+w1Y1YXaGBNpL1guet8NigUARdG5qTWCDER5CB6ef/jib6nUXd9thwImIdmr1WXS4ktfWnHPK6FPhB05nIW3KrsVFRxiz90RZZF+Xm12TGiZrUjq1IvhMOZlxeWIaIIRAf5Be2aSxCP5KSt+f7RmqkxK9CIjciegI5zTqtDVfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9zzolvMFINj6OP5fCc6NDHE2h8BnbIAA2lkxMYgMfY=;
 b=NYOBCltS0+fJSxpd7NXU1gZR0oihYM/3sftMp029yCYrSn6U3A1IrmH2GGlHGyq5m0wcbVld4EwInyJFDqd90NVDQfMvZYkPP9hUV7sR4PQurfayeDqOZk3Rr0UzOFrPX190i8rNy+nklrrzSz1KA0t/AO9rhFiigTsR1k713aQdSydrvijk9hWyGreMA7RcT3+y92AFGUimqT2tkGMnWkEmwV8ltRTGt/uBzwWCb48/yn2paX4vFEYJRsSsrsRPFGJFNBCNWEETaayzB7CFo+R/tyGUUTrVxbTaoYAGZ+nxDWY8IPuP6OjVX2gmB+KMue8W4zvWtXn+luSDBiZaFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9zzolvMFINj6OP5fCc6NDHE2h8BnbIAA2lkxMYgMfY=;
 b=IujxvMAKIgMFQGG/15m+4fKa/pssfIWPrpvjfQ25RMTwfq53fcmPmwgC9aqf/WXugnNZ83SQJmuGjcAzWQ39gAjwYADxCN5EY3nbB0ks3a/XkH8KhEogRw2xQv63JoEtkMgIIxiB9h8EzrVDZJ/FCZUM8xEHb3hmOHYWUpmrSlg=
Received: from IA4PR10MB8374.namprd10.prod.outlook.com (2603:10b6:208:55c::22)
 by IA4PR10MB8636.namprd10.prod.outlook.com (2603:10b6:208:568::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Sat, 7 Jun
 2025 06:15:03 +0000
Received: from IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab]) by IA4PR10MB8374.namprd10.prod.outlook.com
 ([fe80::fcf0:d1a9:788b:73ab%5]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 06:15:03 +0000
Date: Sat, 07 Jun 2025 02:15:02 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 10/17] htab: move str2hval() to dt_htab
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:36e::13) To IA4PR10MB8374.namprd10.prod.outlook.com
 (2603:10b6:208:55c::22)
Message-ID:
 <IA4PR10MB83745AFCEFB5AFD674CC1C9EC269A@IA4PR10MB8374.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR10MB8374:EE_|IA4PR10MB8636:EE_
X-MS-Office365-Filtering-Correlation-Id: 17f061fd-ee25-4b1d-7669-08dda58aa403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wNe581CykIVb5RwpPBTBKHf//xM4rX748NG4GHQt3hLGCIyr4BZOxBFDpOu1?=
 =?us-ascii?Q?3aaLA6jmX1s+HCz4PKjzWCVJ+FoThXy44xcgqbIG0P3OpCrbOOd3QJQ4eqq2?=
 =?us-ascii?Q?mxcAM1wRCAyvmaaubvynWGTn12Vbc3DNp+8nXHIJsdcsam0EiCaDW0bX8/Ji?=
 =?us-ascii?Q?LWaqmxTUZAramikoVLmoPvE+4WXOy8yBnEEbdUTN+fDnFDtZN4Pqf95Hhd+2?=
 =?us-ascii?Q?WMb3c75MYDODj7TW/e8ERb5CcAV/YPSHRuUAh/XVK2JS+mCt6H9agg2GZKAz?=
 =?us-ascii?Q?zStQsLE/RBs78YDfGk0nMw8gHCB+G5C8FJhDlM90GmPc42p/TpvNssq/L+ni?=
 =?us-ascii?Q?fHY9d3jxLhf19EriOkN5jlXYLo95qWGtF8DHEkv0mQ+QKkBTFhf37Of5idQC?=
 =?us-ascii?Q?LP0HIfOyV76GuyAzuoiYqrnavwHePiGZdcDvoEMHkH/xPNRLo0vge/OQuTma?=
 =?us-ascii?Q?HmLfEWiDoZ1cY1A46aJcurwFLuOFkwi+13DV3ub+f3xdEGvtmjVvWCH16Ldm?=
 =?us-ascii?Q?C5vujTDldkpsqJCIABYB5DS2hoL+5yO3/PdAAoz2EkVuPkRk4OSWvP0ydxSX?=
 =?us-ascii?Q?uOvjN+FiaIwLOYfacGQO1o19QWa1twhsj6+cFurApV/+e9WSYOzR0Kd+vBEn?=
 =?us-ascii?Q?vmNm6fOTON/ZJo9vcFcGzRk4Kk0ISm8eTET7zqcBofm9A7xBZmXHK4KARnqb?=
 =?us-ascii?Q?vRDfEzQmq1Z59Le2u8Ywzd6e7Sp1hZtEL+POIVMrLOwVtb/djf4tfg4E8zMi?=
 =?us-ascii?Q?EfD6zoC9wglLRKySpBukYeNr4ws8WRMqmbDiW7BbBzmWZbw/J8Joa7hM+Qkt?=
 =?us-ascii?Q?vJjI+e42lFeQRARLpf7YRSgbsh+AIEULHXeWhrNa+68eqDKfn00sG7aeBFCI?=
 =?us-ascii?Q?ZsQQTOYGEKpt70EkdJ+e61HQcHKOvnwET8hu0PPK+E7llRg1BVpukREbzbaa?=
 =?us-ascii?Q?udLyXurLeRRT+ix6FGm696nEuA4RlMiMIVR5/NXJ7w8WUk/bmpM5rzDlukzL?=
 =?us-ascii?Q?tqH4md2JB1cVfLYh/17nGS+N8yxtagV4kNE7iGF1zIaHl7SnBqNugSxwlLbi?=
 =?us-ascii?Q?KjKmQBeSAqvBfyZykn0N/U1PiCRsmx3QHdlB7GSrhwHjHHDbx+mPdUHDo/u8?=
 =?us-ascii?Q?ywksC39Vo/w4v9fQdgmMdtuCpD0eJp4EXBay8kAnjzdtSKAIyxbEk+X7vJO7?=
 =?us-ascii?Q?GIkumzDxCI07nXspWWVVr2SQR8OiF5x/r9IKsGkhUW0jTv83ohxx5jlENnqA?=
 =?us-ascii?Q?Hu+3QJ9iK8Rix88jfq2oxylcdck9pCkudS/neczkK4j/vWgIX0swtBltkXaw?=
 =?us-ascii?Q?LFmpiDk7yZFA+87DaqmbEY8PkOLZJo4I4/3uyh+DJJR5iJ0TxoxcONw2Evg0?=
 =?us-ascii?Q?+Ok6glQy7OwSqv6zBzVc0GQdXKrlOav+5R++2CXsJ6AT7FGcnyjDpsjnHjIp?=
 =?us-ascii?Q?IL/6vuk81Ik=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR10MB8374.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hcu/+9dGSLJDtz2ttuAf1gsMb/GRPUGHhLsKUMpdI2W5pRWnoVVONggeEW4j?=
 =?us-ascii?Q?BE7oJLcj9NH1RLWiz8EzbIccI+mOK9kKCHuqbsJ3qxUi85HRbNXtDRZ4EbeY?=
 =?us-ascii?Q?5Mes8k+fD/26Xq6I9mc7jEjDlFshbyMACoAF90xOqOuXU8sYyzLmglXReHVh?=
 =?us-ascii?Q?jnOq4VxmpJIFrcxDs5PBxCNnALl6GBnUoFhYIOZShQgdQN+TkE/BPTWsEqmJ?=
 =?us-ascii?Q?wLCJYH287gD8FkwTN0BACO3iCuXVVPiU/YSQONNPhSP/AUBLicKfnzPW9Jjs?=
 =?us-ascii?Q?kC/hVm276TCVYgrl3bl7yOpnDoN7x7QY86emWfnCRIfnzQyTqgO7Lhby/3pJ?=
 =?us-ascii?Q?69eX0yXCu1irCrPkwNDCB8vaKFrVNnxEK1zRcgohSTJiju5F2Bd7eoDk1ePD?=
 =?us-ascii?Q?qRgHx2K8wAckmqfCecvQRrKcB08EfGOUUHcBEVUeubOFymzLRe/pZrrNqwCZ?=
 =?us-ascii?Q?Ly35P7f+9Fw1vgdEqPLfpkosq3dolkqaCWZrBtdTUxkZSoktMivyN4umBcVL?=
 =?us-ascii?Q?QhjNJCN2Ph2bfDMc0eVHO+w0dSe2H0tzA36hLsFBIrIZtEH8aLD2S4YbwB+F?=
 =?us-ascii?Q?nzf0NPfi89Y40/ST8ugzuHLeRu8v37wsE/RGLyCl9MMsLwqpPJAh8cwdyd2/?=
 =?us-ascii?Q?PwJvAzk0uZ+Iw3bNTVK6fe2vlX2uq9iC7scXIbXM1mMwOa0u+9UFTC8ikiRH?=
 =?us-ascii?Q?7sh14yoQwBWoIoMnpXVjOosB5+mrfoZOTw2DL85mP+vQ51IfwaR3pkAvEcOO?=
 =?us-ascii?Q?bpj5qjwhXvJxI91iu9lKEZven+5ik1HyAqSwl2h7IrbPL9r2XdNSLYvIKEx8?=
 =?us-ascii?Q?PMvpUI1gaOE559WAs+rz1lQb+OqtJ7ZYEKZ/3tvveppesdGbscYbSgSAFZMI?=
 =?us-ascii?Q?vl90/q3HLdGRzbmAnxjx0X0oGfByA5RiqHWPit/I+y6zPQ1Os0Ykri1mfJs0?=
 =?us-ascii?Q?iJlvME5IxtuamLSHo1FNk4oIEbwyI6dGav30mrO/ms59TjfxaVBuuSK1fdNw?=
 =?us-ascii?Q?fJtL9/JxnviZCrIG8/ePmufPTmPRhLM6T19wQUX2w4OlcBkJp5XakcCmMTpV?=
 =?us-ascii?Q?ZEGWpV0AVbV8eWWUsuqVOC7ao7yY78Howh76Yg7BTt6M6TLtXVU0xavT+5Ap?=
 =?us-ascii?Q?229QQlZ3YLB+jFsG2gWtCzt5pOzh6VCfENlNZ0hvKvChq58yqgw7J3JUxgV0?=
 =?us-ascii?Q?Gd73vPMdcw6+g8yf6piNL4eE/QD8Se3HzY3SyuLFQzIYTtVAv6mjIEL4Rb7l?=
 =?us-ascii?Q?bQVX5bSzNYLlAMKAIUwNmAR224dgyEDJYcVorHu2Xa6m3/i0YRrhCdPVSuxV?=
 =?us-ascii?Q?3mXOFkjVuKvVeGrVAjc7f9Nrr0k+tcRvX2K56LEF00ck7nIpM2xmIh/1vRig?=
 =?us-ascii?Q?6QJD9bO+XLRGZ9AsNOJ08QBPFU2JZcPJd+EkVoo1aeK9ACzX9YqAVrWbUBIH?=
 =?us-ascii?Q?qfpivfROhOyCTsh7t1fn3vxzcomwlw3twUGpK5kbCn47qL5QM6gtavlVsOdO?=
 =?us-ascii?Q?0P5Kr4CT3hp91ywqpjU1qhaG6OBOre306oevJOYYdkRusDfURcirHIUFtZfk?=
 =?us-ascii?Q?06LPuDTAhs+qfcuvaODS2w8qvcwa4X1GiFyRV0G+vcckVKNWUUZS+ZmrJTv1?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	egyKWMVJ1LIbcbyRyfQqyjrSxtAay5zwHfHrHMR4qt+ZTH5Cvjo+r4Z5pIHb1pS7jhC8XxX4cORWASc3bbcGZ8PwsN0kmn8m/BQ8M7dN/IS0o7X+Jz9TeV0WmviG94h9n7Ux5jPmcsvR9GXtdSM+RyXwrHzcMc1yAUOrFxBz/04cueOdgg1uUu8mbC4wAXdrFIYf9sQdCI18+MjJqImI/rYQ38KMJ7PF8UUiQq+ksCv7TX5wrfcvoULr7Y/8AgfomZrAx5zGA3/R0XYve62V4vdHwO/1lcVl138RBIU6JNbzmGf7ohnXq8Xr6R/VGNpOpGGP6J+3WGD4JRZeFadRs0U1GHN8XojnQAE6TbkF59CKIyoE1VfqD3C7QqO0i83Kfl5Axg6p/uWwA+HXn8E8c8gH9wadk6dGQ3YkNYFOA5ajfEdCU7DvrALe47muIr9z9aaxx9ttvJmSHGnOIjV+lcyrnwOWe6xzYkIdT+jUc/2yiXGY4r4izYxlRqS/kokP2pcqi7cS+QS9BK383SiGBi2OJIX0gFU4+h0t47S9ACnLzk6pU0UZt3rgkpPXtxFohMpTot9Xn32dP5pYOeIEYXAHo+ygdvsM20Zv49Dwo+Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17f061fd-ee25-4b1d-7669-08dda58aa403
X-MS-Exchange-CrossTenant-AuthSource: IA4PR10MB8374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2025 06:15:03.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3TSQnyLQj3IPbEJ/Ae1mIRXX/oeIjgTZ+wpKoaYXD9+vgWLQvZ6/4E5QmOZb7E3gvW6MJAlkNQapFhWMRkCEeRlEYKaFBXR5R5fbzK3Zo7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8636
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506070044
X-Proofpoint-GUID: nbQmA450h-0Ak3Y4E43EropZoKu4HmVW
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=6843d8ea b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=2TC6w6JcWuTA4Z_pkLcA:9 cc=ntf awl=host:14714
X-Proofpoint-ORIG-GUID: nbQmA450h-0Ak3Y4E43EropZoKu4HmVW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NCBTYWx0ZWRfX6z3Czb8nOjVf hEpMlRaTqCSmDO4KFInlpUO4C4DDGPaNKyeWg8NQIpoVA/6rm7TW9xMqOwe7tVd8HFXqLr2wTcB g8vB1iCyuYKzLFk8jbhdHOteIFpf5ywBsk8DJjh7ga21ER0oq/VMcs7iVy0phL/uckIBhkh4eK9
 PVNtLr6tHtdSc/H5fV4uMUx3oUFhRBZVnJnxetI4LIpwYzHWGd+0meBDsV7iEvnDo9KbHjdb1OY R6DLXSUDx/NFEfeBnAyp7MTp75iBX+8UV/hv7zy1A55SAI3OiMGpmgehChzy8D8+cMQxv5qqBFM L5GQwDGfnkHzUurQTY6w+8BsJJ8XfobsAFfUDR9vDNkytzsT1EZuO29uLmhLlEOX6KP+HflXV/n
 CKPfhsJYMktOis2iCbc6Th7JxjqatPruq+/Wi5H+pSFV1ucNqKtjxXNIRRO9x41sOljZg6K+

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
---
 libcommon/dt_htab.c   | 28 ++++++++++++++++++++++++++++
 libcommon/dt_htab.h   |  2 ++
 libdtrace/dt_string.c | 30 +-----------------------------
 libdtrace/dt_string.h |  3 +--
 4 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/libcommon/dt_htab.c b/libcommon/dt_htab.c
index 43782202..ee119031 100644
--- a/libcommon/dt_htab.c
+++ b/libcommon/dt_htab.c
@@ -62,6 +62,34 @@ struct dt_htab_next {
 	int		exhausted;
 };
 
+/*
+ * Calculate a hash value based on a given string and an initial value.  The
+ * initial value is used to calculate compound hash values, e.g.
+ *
+ *     uint32_t hval;
+ *
+ *     hval = str2hval(str1, 0);
+ *     hval = str2hval(str2, hval);
+ */
+uint32_t str2hval(const char *p, uint32_t hval)
+{
+	uint32_t g;
+
+	if (!p)
+		return hval;
+
+	while (*p) {
+		hval = (hval << 4) + *p++;
+		g = hval & 0xf0000000;
+		if (g != 0) {
+			hval ^= (g >> 24);
+			hval ^= g;
+		}
+	}
+
+	return hval;
+}
+
 /*
  * Create a new (empty) hashtable.
  */
diff --git a/libcommon/dt_htab.h b/libcommon/dt_htab.h
index 906c91fd..13de552a 100644
--- a/libcommon/dt_htab.h
+++ b/libcommon/dt_htab.h
@@ -91,6 +91,8 @@ typedef struct dt_hentry {
 typedef struct dt_htab		dt_htab_t;
 typedef struct dt_htab_next	dt_htab_next_t;
 
+extern uint32_t str2hval(const char *p, uint32_t hval);
+
 extern dt_htab_t *dt_htab_create(dt_htab_ops_t *ops);
 extern void dt_htab_destroy(dt_htab_t *htab);
 extern int dt_htab_insert(dt_htab_t *htab, void *entry);
diff --git a/libdtrace/dt_string.c b/libdtrace/dt_string.c
index c3096947..414f1bb8 100644
--- a/libdtrace/dt_string.c
+++ b/libdtrace/dt_string.c
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2005, 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2005, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -13,34 +13,6 @@
 
 #include <dt_string.h>
 
-/*
- * Calculate a hash value based on a given string and an initial value.  The
- * initial value is used to calculate compound hash values, e.g.
- *
- *     uint32_t hval;
- *
- *     hval = str2hval(str1, 0);
- *     hval = str2hval(str2, hval);
- */
-uint32_t str2hval(const char *p, uint32_t hval)
-{
-	uint32_t g;
-
-	if (!p)
-		return hval;
-
-	while (*p) {
-		hval = (hval << 4) + *p++;
-		g = hval & 0xf0000000;
-		if (g != 0) {
-			hval ^= (g >> 24);
-			hval ^= g;
-		}
-	}
-
-	return hval;
-}
-
 /*
  * Transform string s inline, converting each embedded C escape sequence string
  * to the corresponding character.  For example, the substring "\n" is replaced
diff --git a/libdtrace/dt_string.h b/libdtrace/dt_string.h
index e04e2ab5..854c0fb7 100644
--- a/libdtrace/dt_string.h
+++ b/libdtrace/dt_string.h
@@ -1,6 +1,6 @@
 /*
  * Oracle Linux DTrace.
- * Copyright (c) 2004, 2022, Oracle and/or its affiliates. All rights reserved.
+ * Copyright (c) 2004, 2025, Oracle and/or its affiliates. All rights reserved.
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
@@ -16,7 +16,6 @@
 extern "C" {
 #endif
 
-extern uint32_t str2hval(const char *, uint32_t);
 extern size_t stresc2chr(char *);
 extern char *strchr2esc(const char *, size_t);
 extern const char *strbasename(const char *);
-- 
2.45.2

