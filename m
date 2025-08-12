Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55443F9D2
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755022165; cv=fail; b=k3TwZov/xoo1ASgmAKyJh27eVQgjM2kXCNmbn14Uh8XKzMX2N3gFf4ETMK6RYeiAnGmddDO8YTU8D9RAuoA5194tEPIXX3lKTQ0Nx4RmWLf4GLt3LbQ8dzBAlZHi2XN6gAYqzo0tddDb3Yi7pyeetGppbtLsgyjRVkXTDpN1os4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755022165; c=relaxed/simple;
	bh=5UOSCSG2XhkGyucb+zL2l+TJnw96Z1UCIiM13fnEqkk=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=T4Wm5WAfpEzCeIOGKT+RyaN68k/uJ7iod5Vwdg5qY1MiMRGKm+iSpKx9s0B6UA4EYJxWzdkP/RyntrgCU/8+PCbNvO6aO+af42N4Hf499dSOA9fkb9zO7c7N4F40WBZJ19rhup//0/DbjrXuD07itYcSNNzYnqLIjAEBMizKOgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=CZsaUiaO; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=V4ZPuZrl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="CZsaUiaO";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="V4ZPuZrl"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CDC04Z007864
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=lvHdgPUETRjNKPggo+6ajkk3exi0TuO0B5En3x2NK+8=; b=
	CZsaUiaOrPQoFueCOjAkNIvGiQEs/9yCsBUT9GvQFAxWdmrdOAP2AThE9qU8vyTZ
	GKPeQ15sqdROF37yf5yP0KTykcaPrLSbBzBf6pWlkx3q3siAq0u4I6ycmvcE5GYv
	KVdZFqneLypsQ7SjXwRMsd9ERlySSmWTFC9giBHISbhzmvUwv/CtfY9mvQBzBM1l
	8JTxU6rU/F1cGRJdL6CmPVNth3VmuhAxx1H2e8U6vko7c4kFtK2+eBTHZ2FjHsqC
	wd0WO2G2kr7k37Cn+CHw0iMuuuUq2Mz/hp1VjybhwJ6fijNfwL884208FM/moW3w
	NC9/7ytbhcTuP7lpzdurog==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dxvww7y4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:09:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57CHsk99038531
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:09:21 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2086.outbound.protection.outlook.com [40.107.236.86])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsguvps-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 12 Aug 2025 18:09:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eTDjiQZjOTsSo58q0bCBmOpaI2MQtTc9DBNtDSkvIX4xJRyaIAEaa/zrOwdamaeBpVE4ero2jZDd7w6wd5WLPDUxfcxUsTGyw0cvIcNPh1T+ODSJgbYgcL1/PXgfdWHYVfqISUQrP7rTwIjhsf5DNU0iBPpsVkuwaCrCVV/sWbVekOI6Yaa7W92RRaUDFdmr+TMuMh+i8CfcGDmn795CbbIygICPF/KukSfr3rxmC3bhUV9PR/ktDnq8Oog4xILHq+5KB3R8L8K9dBcEIr7tUaoLQUVr7clfl+3g6FDNjLGVsYc4uufdAt8ylfj9TGjf+KgmXd8RRBFVuroY/FoXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvHdgPUETRjNKPggo+6ajkk3exi0TuO0B5En3x2NK+8=;
 b=jvxog1gj7XayVXMiiZ53eBy6JIu/Ol13Q/QGkD0xRtXVK+bNuJ0whOaZWWvnq+A49ITKVc7LHtKiOg4kJS24u6XWo7tTTdfnkkJsziEIQU7obl85FtF5W06HeFyTV19UmDZRgNCzyHnZEtin+Vye1puKwG2yuaRfxzPUgynvyPs8zTB+yxJgadKjtxPDbW9AUiV9YlfbiciISvrfHX19f4dGsr1R7QVuW1VYO4asO+2MlNQyK995XNKKkqMLxRLwUurxBgx3cE8opWD6XWfylpJGFY/Gw1YYeHxxazRiSE+Oodyhwvq7I+U/y2d4A3c5rGGMZxUWfUIuU7xHRAjobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvHdgPUETRjNKPggo+6ajkk3exi0TuO0B5En3x2NK+8=;
 b=V4ZPuZrl0FucAq5ItJMqpxzj4/ymtMgiUhtml/k+iy1PPbbxUBy6F7kVM/mSAv+D3ACOnf6mMFsr4ShRWlpfewewgCyJbK9Dv5hBsZp5KDUsO719fL6Ghr/KPfOQVS+3CNdU10RelRnssSLUldnrD9F6FVoR0ofuC/1MpVwsRtA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by CY5PR10MB6167.namprd10.prod.outlook.com (2603:10b6:930:31::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 18:09:19 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 18:09:18 +0000
Date: Tue, 12 Aug 2025 14:09:17 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH v2] test: adjust sdt.tst.args.d for task_rename tracepoint
 differences
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:208:36e::26) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Message-ID:
 <SJ0PR10MB5672FDB3619D9510E90ABBDFC22BA@SJ0PR10MB5672.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|CY5PR10MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7be497-91a1-44c4-4073-08ddd9cb5b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?poHHWkWAPsizip7fdC08OOdCsaW268YSpEQ6z7/bV5MKJiZcZhobiDYJ4utT?=
 =?us-ascii?Q?aA1Ngy5zsxFcbH0INKGSvperegm2SdRQYOOdUM2kuL38xGlesP5HyvRf1kLS?=
 =?us-ascii?Q?erj7l+eL3/VFW9m5Qydsuo4S4KFEEiJjzO+0Mn8+g/H8hpTxCHMQMSAvt41Y?=
 =?us-ascii?Q?fmd88sTper6DbA8SnoDMB/x8EDUoly7sSCm8OesqD9JPUXz2UrV7qbTfIj3e?=
 =?us-ascii?Q?bMt8i0fw6UMbImmrUZmpEIcU6gYx9qNxRB10rFST6JGMXKMMKuVNokZWb94X?=
 =?us-ascii?Q?s4pZ0TsnlqZQ7ZnRslbb2r8wIKVroStpB2/Lo4ejURZWpejnfHYspvIfiMzT?=
 =?us-ascii?Q?PFQ6Wen+S1JKHrw4prulS4czvgrs4ykAOV9ZyxSpjQ23nMypR6CipZ/R8DBm?=
 =?us-ascii?Q?27or//WGuPPTdKfwmW3ea3cpyXaRvfZ3lsy+3Lhx8Mca04VpBDGPL2ZEAXsP?=
 =?us-ascii?Q?2M/j2otJDKr/mNmqnanlzggHrMGZOATbkDst3XgneYlrFRTGnHqb7O+uxDpN?=
 =?us-ascii?Q?vDWhmvrkcOt8ZCc1SnrQd16Gtv7lHp8yzjzvwu0Pus40QSwEvwGaudPJs5m0?=
 =?us-ascii?Q?x0B3UCtd6E5h/h9lD+ahlKl25QnHcJD8JkEk8gvnhhMTTw0NJcjvAvUKAEM8?=
 =?us-ascii?Q?RRERiwLCCa8JOed33zSrS3cPz63Yd/oZJLdNoaSh+jTo1XanOej/IdvHaS2D?=
 =?us-ascii?Q?yzRgKuMbxU8Q1a/sYgaJxbBmoySFZYRPSVWkwEq6E2JZi9WhbG6u+uGj/ND4?=
 =?us-ascii?Q?CnYEY7oRX0TkzahlugA7FAXM9Q/4WqLGpF4H0pclqaWzXH2KhPoGNr8wmYg8?=
 =?us-ascii?Q?YamJG0NHD/2z+BQ54H7jzL/1DdZCIRJG37Ks6kSh0gmYSoBgpiZLIXpf6nra?=
 =?us-ascii?Q?EYzNVk8upU0F7oER9KnFXSclwa5bCTgnO0tnnGsh2vnH9//miVh0WJ30Dx/E?=
 =?us-ascii?Q?TTikSCvrbe3+skhfqn0zyc/yDo2vb3QqwZWcF+9M07fo1sn0o9Q86lKVXUmL?=
 =?us-ascii?Q?m95PsUwlXz4mv7gPdC/hNDRm2h57k1ALvyccIJhlDb7Y7uL3U0dOtA6whqw3?=
 =?us-ascii?Q?rs2L2Vw1BYmlWozab3ocHQhnlDN1DCBbNPVhXJDN8q3mMvL+fQi21Mf0hjLx?=
 =?us-ascii?Q?SO3amFn8c4l+NPxIYCGXC9eDKD6CgcKC9c5zu0S6sjRmth2sFz35R0GK+3q2?=
 =?us-ascii?Q?dl/thd57SU7W8AikU13ynjaC8ipG7WxjnX46fJLww7iMSO9l4Gxlqu4XORKA?=
 =?us-ascii?Q?3+H4BSheOqQFnwli77R538QsQ8JEIzJpSvkDcBPyPPVAPLO0awvTx3A+k3Ny?=
 =?us-ascii?Q?n8tRNKTMOMss4J72CRXPPJwVrL8v9ed51/sGZj9bvpAaTj1XMtW531iKSltr?=
 =?us-ascii?Q?Ovncf+UZWxUOQL8AX9K5rSev4SVLyVg1ditoO1CRlMW1mci+Seb3aSwQFnE1?=
 =?us-ascii?Q?K+gnJXMZzx0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uwpQOxzD8zO9NPPyD0Te2A834nOlZne3afavkHnkgH9kJtjJkUUv+S9wPYVn?=
 =?us-ascii?Q?GfhzubLolzS+n4WboPUa04ggGQeQreKzvMzwFag532cbZUdp4wQBTBKE6fXr?=
 =?us-ascii?Q?Wd5dv7NjPUcf+FO7m/hIujMPNGeW2aU2KkzjTjkwUu3boxXJ9vvEjUGZ9GRE?=
 =?us-ascii?Q?+j0FCPD6G1YNzQvA/s5yp6A38/KpA3hAJQHJrehar5cnHnM1LnThV9XI94nh?=
 =?us-ascii?Q?uPiius4nJuUshqd8+hkF1kHXr/W0odkcgxpLD4aC+SQtAuX5wf9wuAOyp9p3?=
 =?us-ascii?Q?kKm4fDa9eVl+krJh7z2eBFkobwK7d5WtBhy/G7HSnBvXnwxSSrSr6/v6NqZI?=
 =?us-ascii?Q?c0jZ+xf0qfIvHV6txK4gv53umuBNUWFsY1xdi1cPFQ15yBN6c4eKgfAjwf0c?=
 =?us-ascii?Q?ZX+VW6rgCls6oiMplnDyTbZ6GDt2XsPZ00jgIrOvQyYWJkzmmNiKeLjNzITN?=
 =?us-ascii?Q?JfELCxSM7Oc+fD1aimMsZGwuHkkUtCZ1gJcH1fYUWgeR0dZRYknv2G+CRzpO?=
 =?us-ascii?Q?R0LZic4LbDaCfZEi96K5FIG5WqvbNlqJ2sOyYzwcxdBUSwihE0U2e+88+IeL?=
 =?us-ascii?Q?fAIr+f4M1UiX5wp9siPPVVp/BgbnV/Y0V1igryu9dNJqZz5jXkSD0Q/U0DwI?=
 =?us-ascii?Q?sPVi2FzzOO33EpASOtgNUFIFxxtKHwWcNi1VSk1zk+qP9O6K+99uXS/wk2bv?=
 =?us-ascii?Q?2XPk1h8J9gfqQMuHEtcgZfN/GWa0/2CF9sbz6cnzBfBpsVujslrT6h5/qtx2?=
 =?us-ascii?Q?2ZJ42bn+np4xfgDnEeo2BbjGGyg/bXkR16r84Ey1iwT1ankgd91YELLt63aQ?=
 =?us-ascii?Q?Vh68XKMeORnD2uROlrRGtprqE8fYKrwenAlD5iJ0QnW8KZWmaashsmc7bZA4?=
 =?us-ascii?Q?MruHjbYtUi5CM+AFehIfeW4K+BDGj0wE9YxiaOS/OQeFMf7uQmPceq9/WfCN?=
 =?us-ascii?Q?LDBf8Hy1scVTEp9yUIA1jFIsbN6RabwwO35ZaqsQCIW8yrFjwOTLWu2SvSdS?=
 =?us-ascii?Q?ms/GUL758iyTfp4FI1VBWlp6QpJ292Kwp3JPf+oUdtUj+5JRZcACc6junXls?=
 =?us-ascii?Q?a9sQlRPGw4dMhDP2hUT4LpDKsoG4oi4yMGKJUaMi+Cez8BPQ1JcYSSuuGHVx?=
 =?us-ascii?Q?HejTulLtzjNKyczQn13T2+vEuMSEExhVZgdJdjskjn9BVPCsFjuHpEcbt5mb?=
 =?us-ascii?Q?1f4ZYL1q90JixxA/V1WqEXLWPH2Hech7GsmhpVeoSTZ/4iGgSxvXFqCu1ng9?=
 =?us-ascii?Q?3EDITAOgV/0DfrFWP8m6pyl8Xai9LhCKBkLMOA+ThZHnX6un01QjqwK+cyQ5?=
 =?us-ascii?Q?/8m3nSlkeCZa2W13Fn3rg2eXqEf4wp5fNZ7BQlFpUO8fRFc9hwus/llRgEDJ?=
 =?us-ascii?Q?H8L2dOIHs7wsvVrFVQv5HrizTpb2pL/Iz245UbzfyKsKmsnprNE/lc3KfFEy?=
 =?us-ascii?Q?+TOjSpMba904bh9ZbA/gGiLS+CkW7gBkgHYdVjiHWtjHyVfu/zPXXFfI62dX?=
 =?us-ascii?Q?2/V4ZlgjOPvl4bar98Gtkz9oV9khM1mROf+7rLSuBoMFOQCaSRZ/Lxd4CXK4?=
 =?us-ascii?Q?kC78vM17oO0k6RIILtrAgZDbUsiuGJzDyEOEuCXe1yJdS9aa1XSL78uaRB60?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HokJTY+ojbSXhjnRrI8tkk+NMatOiDiJ3Clcm5lvwEkJi/PXYYJgJoImFlSOnrk7mkRJ5N6kC3NvhMi47EbBLZJC1oU2BGiLzHNYB+Vo9J94T8wRXpgO0nGkrohHsXo/0LpC2/1hMJM3mGB8t/NFuYqEx5J25jLUga+i1cpR3nm5d0SVgcOjnUisNKR6A3du583e9TqxM2ujxJfwUVxw1I0RAO+B23iBdAc8npt15qBxBNWs0Wepl0FwS1JeGPD5KToU8lAAVBv4TfrHHfX9iFM2V8OT0d62dHkj5p8cpzOpWYKv8qYH3WZpbCc/tr7jlOGtU1m758yEj/yP10g/ByDtljH71Z8yUuGraHIvH1C7Qr460Xtw42azedqltpvUgxhZmH7d6XyAqU+lG75oHEqXTF0NRNu0wcMvFfEdRzzvIpRXAm0/1gPJer9alG26yLOjNZo0U/kCDAJz0ZMYfMi/u1GJLKl2XSwvpI9h2ZeKVYyp7aNRkAhA7v38F8+09ljuLUkKrJt8INjuJU9ro6IaJKxn9smAusVpScH/RGznQetWq8as8hjiipt5v4hQzKMwcBWp3ZU2dxysfvmWGVt+z//I5FOTvQDzDLdqGFI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7be497-91a1-44c4-4073-08ddd9cb5b35
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 18:09:18.9214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eUAxIHKzKD9MF7dWJ0moQcP15nNQzrwbrXeOhUipox1XM92+5X5o2hrIEdmcNGB2HHsdhldu8DQ1EMD6KF3n7ktOCYpJGNXIYRlXtQmQy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6167
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 phishscore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508120174
X-Proofpoint-GUID: XPA9Iqb3B3ukGsIqUq77YrSYQwsmGI18
X-Proofpoint-ORIG-GUID: XPA9Iqb3B3ukGsIqUq77YrSYQwsmGI18
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE3NCBTYWx0ZWRfX9TSmzfIOwCPR
 CRdpZgmJ7thEjM5qgjKxFyBw2mbyWdne7GAT2cBRfpFZRNAAlrHsSYsZ6fytC/vm+h/Ugo/p9iy
 Ma/XE+N4psQsWjrvU1NLFzM4D7L3PvS+dTCn/SJzSYinNhkhqW0FEkj0gUzpcVkfkhsHOr1gNCJ
 DFaUxqqoBMDOv6ZvAHqSR2MsF4Nuxz8g6S4qfzQyU4r8bSL2/+D5dSkaDh3Jf67Rhg9QBIh1NVi
 FT5s8uEW6I9Ia79uNfx4LQbO8kUUoOEwI4f9Br0YnVphhUdYmNA9LtQ61MTjO1RmSmKTO03U97f
 MbMe7Tssztn60XTjxvuu5xktYzRL4B2uKo+m8k0GnUhIXFQBrynNCbWX0MNPOPiydepiRuGOyJe
 T76vkkkr34AJsP7rB47mFml/WZqFX/Duve/radkiQvuLTMaLhMD4ohb3KnfXwQH1xatpzyDV
X-Authority-Analysis: v=2.4 cv=dpnbC0g4 c=1 sm=1 tr=0 ts=689b8352 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tyH8V26bHf4hJXxgQTgA:9 cc=ntf
 awl=host:12070

As of kernel 6.14, the task_rename tracepoint provides only 3 arguments
rather than 4 (the pid got dropped).

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 test/unittest/sdt/tst.args-3.d                | 42 +++++++++++++++++++
 .../unittest/sdt/{tst.args.r => tst.args-3.r} |  0
 test/unittest/sdt/tst.args-3.x                | 14 +++++++
 .../unittest/sdt/{tst.args.d => tst.args-4.d} |  0
 test/unittest/sdt/tst.args-4.r                |  2 +
 test/unittest/sdt/tst.args-4.x                | 13 ++++++
 6 files changed, 71 insertions(+)
 create mode 100644 test/unittest/sdt/tst.args-3.d
 rename test/unittest/sdt/{tst.args.r => tst.args-3.r} (100%)
 create mode 100755 test/unittest/sdt/tst.args-3.x
 rename test/unittest/sdt/{tst.args.d => tst.args-4.d} (100%)
 create mode 100644 test/unittest/sdt/tst.args-4.r
 create mode 100755 test/unittest/sdt/tst.args-4.x

diff --git a/test/unittest/sdt/tst.args-3.d b/test/unittest/sdt/tst.args-3.d
new file mode 100644
index 000000000..ae070cb72
--- /dev/null
+++ b/test/unittest/sdt/tst.args-3.d
@@ -0,0 +1,42 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2021, 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+#pragma D option destructive
+#pragma D option quiet
+
+/*
+ * Ensure that arguments to SDT probes can be retrieved correctly.
+ */
+BEGIN
+{
+	/* Timeout after 5 seconds */
+	timeout = timestamp + 5000000000;
+	system("ls >/dev/null");
+}
+
+/*
+ * The 'task_rename' tracepoint passes the following arguments:
+ *
+ *	char	oldcomm[16]
+ *	char	newcomm[16]
+ *	short	oom_score_adj
+ */
+this char v;
+this bool done;
+
+sdt:task::task_rename
+{
+	printf("PID OK, oldcomm [%s], newcomm [%s], oom_score_adj %hd\n", stringof(args[0]), stringof(args[1]), args[2]);
+	exit(0);
+}
+
+profile:::tick-1
+/timestamp > timeout/
+{
+	trace("test timed out");
+	exit(1);
+}
diff --git a/test/unittest/sdt/tst.args.r b/test/unittest/sdt/tst.args-3.r
similarity index 100%
rename from test/unittest/sdt/tst.args.r
rename to test/unittest/sdt/tst.args-3.r
diff --git a/test/unittest/sdt/tst.args-3.x b/test/unittest/sdt/tst.args-3.x
new file mode 100755
index 000000000..80c135543
--- /dev/null
+++ b/test/unittest/sdt/tst.args-3.x
@@ -0,0 +1,14 @@
+#!/bin/bash
+
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+if [ $MAJOR -lt 6 ]; then
+	echo "tst.args-3.d disabled on kernels < 6.14"
+	exit 2
+fi
+if [ $MAJOR -eq 6 -a $MINOR -lt 14 ]; then
+	echo "tst.args-3.d disabled on kernels < 6.14"
+	exit 2
+fi
+
+exit 0
diff --git a/test/unittest/sdt/tst.args.d b/test/unittest/sdt/tst.args-4.d
similarity index 100%
rename from test/unittest/sdt/tst.args.d
rename to test/unittest/sdt/tst.args-4.d
diff --git a/test/unittest/sdt/tst.args-4.r b/test/unittest/sdt/tst.args-4.r
new file mode 100644
index 000000000..52854c0b3
--- /dev/null
+++ b/test/unittest/sdt/tst.args-4.r
@@ -0,0 +1,2 @@
+PID OK, oldcomm [dtrace], newcomm [sh], oom_score_adj 0
+
diff --git a/test/unittest/sdt/tst.args-4.x b/test/unittest/sdt/tst.args-4.x
new file mode 100755
index 000000000..74a0234bf
--- /dev/null
+++ b/test/unittest/sdt/tst.args-4.x
@@ -0,0 +1,13 @@
+#!/bin/bash
+
+read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
+
+if [ $MAJOR -lt 6 ]; then
+	exit 0
+fi
+if [ $MAJOR -eq 6 -a $MINOR -lt 14 ]; then
+	exit 0
+fi
+
+echo "tst.args-4.d disabled on kernels >= 6.14"
+exit 2
-- 
2.45.2

