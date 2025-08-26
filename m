Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C6224501C
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 22:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756247000; cv=fail; b=gqSJDFgqHn/WlNBEmNMbtnEfn/lfBp4QLPQhCqMIBAXwA1AIdJKFXZi2uVByZUdRKs2o/E9OQ1lsjKxlSbTDU5I1frWYKBKs21kzwR2OpuoeeQY3HIxl7+0JS93sA3wv18egd1gR5PmoeC0wsd0xTq43DEv0ceLa+QHR+W9hrgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756247000; c=relaxed/simple;
	bh=9oqjrl9VBoPXwneX0OCGO6AkygRn0E6i5hETApu2ybY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pwWwNKUigdieBavfWbBBKal/TDQHX3imXNqu6ePaarkBwJtQA4wiFQ212WdSOp03IjIEa1TRS2skhA+aYvWpRC2XwkG1CMH2Ev+D1GGeywj1RAZec3hRecqqj+Ysw+etI6idz7f1jr5THBlxZhs6iFZSMiPUOCsp33gpXLvI9Pw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hg2pWLZK; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=t+g8lRrf; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hg2pWLZK";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="t+g8lRrf"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QLLOFV006976
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 22:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=qZ2eT9ycRUND9bsS+ypXH59FdYNyzLIignNCAhKgFEI=; b=
	hg2pWLZKGlCpxCXnl6SAfzC5ZMIPF+k+9e7lo/E/inbKBhuuT6+46RvIBpeOcT4W
	V9GL6DTmqqzF6yxj0Tz5v2Pp1u/kdh74ZWEamsBOgM4EnoA1EJVgOzm0KOBPT0xy
	RUsXhgKucl+m/f5L/nx5oEC9GKpbWjvURaxjH9xp5he0RucIe6CKOmoJ9vFhyvpE
	XID14tOaHWdFbZ+Gu+ri7avLfPkrLpgCm432SXYwSU9wYwxXNPhhcs5hh32qsxOf
	8ptxe+7h7HqvTzPYvyqvkHNsRWMVJb++e4SYetP871cbUXIfGJnw8BRgo1nAauLM
	8Dca4s9u3bl1jD9L9jCLkQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48q4janf9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 22:23:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57QKhFG8005138
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 22:23:13 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2043.outbound.protection.outlook.com [40.107.101.43])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48qj8ab9qx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 26 Aug 2025 22:23:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeB2a8TqMG1BBcagkT31fPdEDnGZiZNd7GPE4NNNjaUAFabzRwiZRjBqMcysUKf6sDxazZtNnb+CIcbuxkP3wKECodO7COI+LfW2Caf+dzz67wp/JqqRvDcGOaxdiX1O2sKaMel1qs4RU00d5W84EZnqlU51oFpWDsi2rV0mCAn2i2SRKjMLPlIA6BTDTbIhR2PlKRa0TXm/EfWLq8eM75KDa/9MQnaKuzCx+MI3wAtH3rrzTtVSZGtxbPUTTdSsuY53e0W8/8Sr3l6e/kZVtdrWAaQ8ONuJtVUwwajDxW4nWlbLeAnV4DZL1W9081zBF3zX18PqYrIt1MSXGH81mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qZ2eT9ycRUND9bsS+ypXH59FdYNyzLIignNCAhKgFEI=;
 b=lBkCg/YIL+yY5w28cw6e6C6hzh1LaWDmKzr9cmKQWe0w+MUo1/yLfN1S9P88CJuRtOlCa4izq5pR81NTncsno8yLvW4LyPpOnBV9zI3OHjK2jrvihJDl4TmzkjlOIgXf1tbICZ1EnKtaEAS+fEYpOHcxfzCnNQmF42wNi3A+Cx3dv1RDU6Bmj0n5IzfOIsXQ94WwnUQDnG6b30AcxPoOLo5NyXl2TgW2F5C4Ct4RWAfHj4U8cGhu/tBt4qVkTsznys7XyOG9HqDV3Ritkz9T07djFmKMJ+Mvq9hO81v+hoV5HRyaCft46cNVaslB8PPPpt2UAu7UlZCDy1+6a9dvAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qZ2eT9ycRUND9bsS+ypXH59FdYNyzLIignNCAhKgFEI=;
 b=t+g8lRrfq7/2f6kmWK3A7s5q6OopMSuArIe+E0cPqyELNvoEt+CFEUZqRyj7WUlJG46EPCXk80iRCN/5tJ08G7nsUETuimdqPKUFh0SXxXTLjDMVvqa8+xqQIdw9WO8Ng+1+MebN1/DnYh/JbFRoQEcqkgZrgh5BfVDlEOtNkxY=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by MN6PR10MB8047.namprd10.prod.outlook.com (2603:10b6:208:4f2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 22:23:08 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%6]) with mapi id 15.20.9073.010; Tue, 26 Aug 2025
 22:23:08 +0000
Message-ID: <99dad3aa-85e6-bd8f-cf58-0e787d8a1d57@oracle.com>
Date: Tue, 26 Aug 2025 18:23:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] tcp provider: support tcp:::accept-established in absence
 of skb
Content-Language: en-US
To: Alan Maguire <alan.maguire@oracle.com>, dtrace@lists.linux.dev
Cc: dtrace-devel@oss.oracle.com
References: <20250826131202.632027-1-alan.maguire@oracle.com>
From: Eugene Loh <eugene.loh@oracle.com>
In-Reply-To: <20250826131202.632027-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0196.namprd05.prod.outlook.com
 (2603:10b6:a03:330::21) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|MN6PR10MB8047:EE_
X-MS-Office365-Filtering-Correlation-Id: 034bb401-7e4e-48d5-af2f-08dde4ef228a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZEl2anNPVGludHc2TVIxMTNnYlF4R0VibGRRTW0xZXJVcHQraElsSm03SUNX?=
 =?utf-8?B?bk84Njl4L3FZeGYxaW1yUWRrelBqa0pwL0NLREVCTndTZnZBSmdQN3hpL3Vt?=
 =?utf-8?B?SlZ3eFR5a2NKNVNUL3QyQS9CcjgyTWpPa0thYTFNZWptSk1ZVmlVbTJiaHls?=
 =?utf-8?B?bGJ1cnltTDBySGRtV25aZ3V0VitrQnZPWjlBbE5VSEV4cUFpNlJJNkhhQkJQ?=
 =?utf-8?B?NmpjK0hZS3p0azVFclQzWi9ZMjZoczFQcE1IekJheXM1WUliaWVjeGYzcHU2?=
 =?utf-8?B?ZEJXOVdMK1ZJUUNvbDhZTThNMVVzSVdsVU9xN3VXeGRzYmN5N3hyaEVVN0VH?=
 =?utf-8?B?bDBsM0FPVUMyb2crWjZRdlVpYnlYNVBiVk9rTitySVA1emhQMmZIcWx5ZUo2?=
 =?utf-8?B?eE1uc29xN3F6NXdNeWJVN0VQRzF4Y281RG13Ui9tbFRDejVzcElQaWFiaG8w?=
 =?utf-8?B?UUsrQUhGTXRWQ0J3c0VzdXd6NkFmSzEvQmc0QVFGZnJrTlVtamoyeiswa0RZ?=
 =?utf-8?B?bmFhNENGTkJsa0QzN2NoRFlsTlAwekJkTmJpNHNhVE12aEpnemhkaFN6TUdp?=
 =?utf-8?B?SzRVdXk1SGwwNmsvY0N0SnRGbCtpMU83Vkl6QmRCYVNhNWJrbVUyQVU4cXNP?=
 =?utf-8?B?OFZETEJzKzZXZDl2L3ZRT1BoaGRGWC9xVkEwZDJ2a2FWK2hIMFlXUkpSejBJ?=
 =?utf-8?B?VG1mTThzSVRPa0Z6aCtSTXlhNzF3TkRGOUgrdHRnVk1tOHp4aXVncVY5TUNl?=
 =?utf-8?B?eGxHM3dPcGs5MDRXcStMcTBhNWx5MDBPemRud1lmanhrQld6MnVQbFEzYmVo?=
 =?utf-8?B?dW1JSE8vNE02dS9kRnVNQTdmUU1TQ1R0eWprV0hBNnkzejhOL2kxZ05ocDI4?=
 =?utf-8?B?dEN4OHZoTlAxazZydll0UWh1Rmt0Y3VmenlFN1U5ODVoWndGcTVROUxJMkRy?=
 =?utf-8?B?c0Nxem1pKzFrQ1JwR25hdmRwZmhDc3BsTWtwVW5nVnBzSXNDMVJzeGI3b21S?=
 =?utf-8?B?Rk41bitiaWlEV1FseFdFL0pBK3FxcEhyazNCc2ZLRlNpVWtON2k1VUhNNGlo?=
 =?utf-8?B?cng5b0V0U3lNMmkxRDllcXgzZGYvb1VpY1M2L1FEamZIZFZDSWxBTno4by9N?=
 =?utf-8?B?Z1dLOXdVT0kvRjZJeUVrNDJXY2VmWWQ5Zis0OU12cEVZT1FiTWdMazA3aWNO?=
 =?utf-8?B?bkpBb2JoQVFtVHVzUkw2ZEtqWGxlbDFJYXpwWlBTTGVuUExHVWFjYVRHOWpV?=
 =?utf-8?B?bFhUUDhyUXl5WHlCNVRQRytHcmpRelowV3ZPUkFzU1RWb2kzVjFiOWVjUThF?=
 =?utf-8?B?aG55NElwM0xiS0lLbG16Qi9lTXB4b3RSQTRJMk1HaW5EZ3dnTFl0QnRMS21S?=
 =?utf-8?B?ZUtTb1E2RjFqL0N5amEzMFRHeWtNbEI3TWRFQnliUDNsVGRuTGp0ci82eWJy?=
 =?utf-8?B?OXJFaHUxN2xIRERwTTFoLzdrYWxKcHFpM0xBMFVEVWtnY2FJZWlINEJVbGQ2?=
 =?utf-8?B?dkZ6a1R2TkJYNWtsNWgrdCtSVktNYkdQSGdiY3BpSEhpTXp4dHljUmJSaWRL?=
 =?utf-8?B?OHhnaUpxbUROcmRMczdRdXV4cm1qZ0pVQVJBVWUrVWpwMW1aUHZ0TGRsWjF6?=
 =?utf-8?B?SG1ybDlmV1oxd3ZUSU1sQi9GTXgzSkZ5bDkwS1JtbURFWUZxMThlTjBocDJD?=
 =?utf-8?B?b21RR2hBQkppVGpDS3ZacCs2K2k4ZFhZaXArWUJ4VzhSbHo1dHdlWE82N2Zv?=
 =?utf-8?B?NEtjNGRGZ3NCZXVyU1EwUEhtVGJtcDZuZ2RFK2pqZFBHQm5qMGJhREIwMFVa?=
 =?utf-8?B?c2t2dDlPRnpKYUhrcURYb0lsM1ZYTG5mU2FxSmxmNmFoWXVTamo3cGUyZVBy?=
 =?utf-8?B?ZVAyVURqTExZSkwwckd4aGJXcFFVaE1kbEVlWnJ3VkMvNUdXbU5IcitjL0F4?=
 =?utf-8?Q?lVjJ6Tu1zE4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NS9TQUtEOTB6V29BaUlMYUdSSXBuaGREcmROalQvTFQzdmd2Z0xjcVNtRnE3?=
 =?utf-8?B?ejFYdDFIdHBiQ3Q5WVN1VGlCNlFJVk9LaUY2ekhGTVlBVnMwYUhyNUR5MWh2?=
 =?utf-8?B?WWNnL0E1ODNucFY0bVBBd2d4MjJIWnVSMjBlZnc5Sm1LbjZtN1djOVJaV3lq?=
 =?utf-8?B?d3JQTkpzY3ZJMFB2WU8yOTVrNVlRVStDS0lsQjJvL0dUc2tFNWpHdjRkSnF2?=
 =?utf-8?B?QlZjSVF3dmNIMEpWSzdsbjh6Y29nV3RTZEVPaDFUT1RkUitPYlVGbVdmNktF?=
 =?utf-8?B?azBibDZFUFh1c0ZxQ2RCK2J1S3F5aWk3TVFWc0xMdkVmRXkvbUVTT0dlQ21o?=
 =?utf-8?B?M2MxMUdrZGNqcWFkTzU3RGRYQnlZckhEdStDRGt6NlZ0dUdHWXR4V3BDbUJN?=
 =?utf-8?B?N1ZLOG1IdEZEbDJyZis0Q2NKZThhcUdXNWVOQ0huRURmdVRWWVhOZFVVZFZx?=
 =?utf-8?B?T0lzK0FwbUpQcjNCTDAxb0lBUzRTUkwrcFV0NW9xcGVZbEJQbmFDMVdDMEJI?=
 =?utf-8?B?V3VUSzJIU2ZsYkc2WVVpemI0ZVI0Tzdud25McTROek85cDUzU3RsbGxpV0wx?=
 =?utf-8?B?R2dZdEwxempkcmg3QUd6OTh3Rmk3R1JzZE80QUEvWmxhMy96dWozT3FZblBO?=
 =?utf-8?B?MXFLWEN1anFCRjRDSGpKYndKSTl6WTQyYmxNZmY4TWRIOVh4TWxCbVFRK3NS?=
 =?utf-8?B?anhYc2tycnBaWHptYXg1cnVOZ2NZQjdvdlhFVVhxalFNV0x1QUN0ODNXM0RO?=
 =?utf-8?B?OGRCVU8xd2ViOXNXRFkyRHlvVXBmVjlYdVluNGNRbjlNd2tkazRFL2QvaTNp?=
 =?utf-8?B?WG1aL1dnclJhZGxnL3MzQjliVzAxRVE1N3RSZ0pGU0VaWkZpNlRtRTVlSWpR?=
 =?utf-8?B?Mlg2WWhaYkxvc25hNkY4eHg4MjRUNE1ZNi9uK1JMaGxKZ294b0FCN1M3NnYv?=
 =?utf-8?B?M2pubDZhOTQ3VDVyRXRiVnNJYVZGeU1pc1JSekVLRDFHdVpGMUJoNXBvckNw?=
 =?utf-8?B?QVV2cENDdnBwdVpLclI3bGM0L3ROYy92QnB5S2l6WnZyMjVYVTBYeUZoWkpS?=
 =?utf-8?B?RWJsU3AvRXpETEx6SkZZT0hYeVdDMmJhNzNRNFNRcG90by9kVWFxZUMzdDU2?=
 =?utf-8?B?RWVsakViT3htWGxCR081bC8yWTdzS00rVlRwV0xNQzB0enhZeUxXVDRkOWIx?=
 =?utf-8?B?Z3VWVWFkSEd1eUZ1U0daL0Z6dCtYcFc3M2dIdlh2a1dGNFlGUWcxamJaQXlP?=
 =?utf-8?B?NFJGelFpcU1LRWRBYjhxNlhsNC9uVGhJVllQNGZwVzh4MWlSZlhrTjFLL2xp?=
 =?utf-8?B?QU9RbkhjZHpGZE5oNmI5bDR0YW1EaVBmcmdEMTFiaVlnQmZXbHpjWCtvRHNC?=
 =?utf-8?B?OEdGTXE2Q3d0NEg3UUk5NkgrVTVnTERodUNnV2hwVjNnRzJqbXJrRmJ3NWJo?=
 =?utf-8?B?RTZPOHZvcUZydjdNdkZWYkp0VWdEcHpzczdLblExb3BDb016R05KMkVhbkVM?=
 =?utf-8?B?VkMrQWhQUFRLSkdKV00xNDdyTzBSSHdHL2xTbWloQURuejlEQkQ2TWdNNEcr?=
 =?utf-8?B?SC9DWWMxRUkzajNiWmJnNUhrL1A5cWxKNXRrYWRDdThhR1BjNU1qa3VOUUFp?=
 =?utf-8?B?S0xVRUZJRFVoMUxvOHRlYVNFL083M2ZGcEdmVk1KeVVUNmVPeVlxKzRFdTd6?=
 =?utf-8?B?NndOaVl3K0tpZU03Nk5ZcFRlSWJydlA1YjF3UENIZ21NenBVeFFSS2Eza090?=
 =?utf-8?B?TExReFdzV3pqbGdaN3lqQzdEaTNiaVF2VFZCWi9LaHZVOElBSE1IQXBDSmtx?=
 =?utf-8?B?V2N2UkxSVTFyM25sRHVPNDE4b3FDNVVzNEgwN2ZxL29wNFBhSWRKaUs1VVc1?=
 =?utf-8?B?L1k1cmZ1cFBIcWJqVUNFa1JFNzNLbDY2NnBHOUM0L1NHYTM3TDdVSEIxMnli?=
 =?utf-8?B?WGFnWkNMSy9TeVRmT0hXM0VQQzl5ZklRclpnMlRsSVl5QUZGeVF2cjhRdUxP?=
 =?utf-8?B?Yk1RS2xWa3lnNUY3dzlYMzR1R0MxWlUwQmFKajI4LzlFMzJHWW96a202d01F?=
 =?utf-8?B?UFVlUUtCUTdZd3Q0czJQZ0x0eEVCdVFTMU9jdlo0U21JRTkvZU9pa3dMaStH?=
 =?utf-8?Q?/pnRtefvP1YCRBCX7iyeV1IAb?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rR/Njiv5xV1OeTKnxcdtFKXLJgiOLFXfryCtYgtsrqsBK2+USbI3utjHI1Y2N/kzPTuUdqvjOE59YEX3FuIwEPrEdt1s2PQ06sdlzCZOQs+JMsm5VCNt/1zOZMIKxXPk8/SwNDX+gBBPUMYe3lEd/4LYDAcogaHXMUygndj4WqubWZNS68oKpN6CEk9tU3mTpI3TkNKCVjGIRkLrfQQrVPp7S4N8jylYk0SDeSnydyKFHlEed1SoDLGorIUsgQvRpZmW5TIr4FkoQKn6G2nThRi4EjvoMP7n9uG4b22l/7EW0Nj+AV/aePWFYx89bf8tLZeffDW1485u9JWDInph2RKW7uIfNMGwNsHOmcx1yNXrivECBkOEk/nqdkwHlF1d1f5cZs6NbFPLxSryAfAYzGSLELYt6nlhsG9FxtcphLmjiaaJHlTbj8jL3Pye/E5sxzknkOOGoq6IPBTgnyWfNQP66TBCHMhkOGBtNTSdhzZTwOy9JyKJSYkfsnWZg2FbqFh2+6vNRxVB4QD8FdZNamOwhjkzosBS/r4Mp390loViKeDpvHHttGoYWaf+saFygePSUlOuNJ+AAz3yxp2WDP4hOjJPNLBWYPpPYNEhx5Q=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 034bb401-7e4e-48d5-af2f-08dde4ef228a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 22:23:08.6258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lUxfm6cnSueGPK2uQUR6gAemF4eikGCd56PpcrIO2murV98TSbXLCFWPWnV0GN5MLas5aO3YRp4eM5kxEYnO2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8047
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2508260196
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAxOCBTYWx0ZWRfX2/hlUzVhOx/m
 CYFBTxfKIDYYVTeqa2jZp9Z4tqK7qU+ijyqgvQb1CPhv1UCNQ2oCDICw+ovO61Vq4czKD4n4UKc
 O37WUCqEouhKVsOshbTa13r3o31xtf4BEhafYzj6DCW4jL/myJUsaS1FqNtMWWuVWSnwH2nCISC
 K2LOMvvwCB7vL66QOCr1ZkHk616S4+nWewEtiMKRxyQo617MKrgxGCBkGy3jEVrgCMwlrc2siQ5
 Y9LYXE8P68/TZro6L1yDrFpHzZ8eJBYnC/WJv+hXJ7OLbRnbCkYWbKyYxj6KPr5uUOSTkzdSBkU
 Dwsbk3mtBTEXkcxkqaD2t3W/i8vS9/zRWzyrUMY1i7zUkLW/0FLIgkJV2P8ky8QKqFShqI9HZgs
 P1OBSaQRHg3ssz459CejW42zXir9/Q==
X-Proofpoint-GUID: nXtMpDB4zusG_MzAjccSa7hTcOvr6VzR
X-Authority-Analysis: v=2.4 cv=IZWHWXqa c=1 sm=1 tr=0 ts=68ae33d2 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=x-0rdUzh0wh4jNUV0QgA:9
 a=x6-yGuKwGvF0zPjG:21 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12068
X-Proofpoint-ORIG-GUID: nXtMpDB4zusG_MzAjccSa7hTcOvr6VzR

I might be doing something wrong, but the tests in question still fail 
for me -- largely unchanged -- even with the patch.
5.4.17-2136.346.6.el8uek.x86_64
5.4.17-2136.346.6.el8uek.aarch64

On 8/26/25 09:12, Alan Maguire wrote:
> On a 5.4 kernel, the function we instrument for tcp:::accept-established
> (tcp_init_transfer()) does not have a struct sk_buff * as argument;
> that does not appear until 5.10.  As a result we need to fake up
> the IP and TCP headers from the TCP socket.  We can reuse existing
> code (ensuring to mark accept-established correctly as an _INBOUND
> probe) once we fix up references in ip.d to be arg6 and not arg7 (this
> parameter is used to mark a probe point as inbound, outbound or as a
> state change).  We need to ensure that args[2] is translated from
> a __dtrace_tcp_void_ip_t * to get this to work for the IP header.
>
> For the TCP header we need a similar solution; add a
> __dtrace_tcp_void_tcp_t type and translate from either the tcp header
> passed in (if non-null) or use arg3 (the socket) to fill out the TCP
> header info.  We can get the ports, seq/ack and because we know that
> only accept-established is used we know the flags will just be an
> ACK.
>
> With this in place (along with previous fixes for the TCP provider)
> the TCP state-related tests finally pass on a 5.4 kernel.
>
> Reported-by: Eugene Loh <eugene.loh@oracle.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>   dlibs/aarch64/5.11/ip.d  | 12 +++---
>   dlibs/aarch64/5.11/tcp.d | 34 +++++++++++++++-
>   dlibs/aarch64/5.12/ip.d  | 12 +++---
>   dlibs/aarch64/5.12/tcp.d | 34 +++++++++++++++-
>   dlibs/aarch64/5.14/ip.d  | 12 +++---
>   dlibs/aarch64/5.14/tcp.d | 34 +++++++++++++++-
>   dlibs/aarch64/5.16/ip.d  | 12 +++---
>   dlibs/aarch64/5.16/tcp.d | 34 +++++++++++++++-
>   dlibs/aarch64/5.2/ip.d   | 12 +++---
>   dlibs/aarch64/5.2/tcp.d  | 34 +++++++++++++++-
>   dlibs/aarch64/5.6/ip.d   | 12 +++---
>   dlibs/aarch64/5.6/tcp.d  | 34 +++++++++++++++-
>   dlibs/aarch64/6.1/ip.d   | 12 +++---
>   dlibs/aarch64/6.1/tcp.d  | 34 +++++++++++++++-
>   dlibs/aarch64/6.10/ip.d  | 12 +++---
>   dlibs/aarch64/6.10/tcp.d | 34 +++++++++++++++-
>   dlibs/x86_64/5.11/ip.d   | 12 +++---
>   dlibs/x86_64/5.11/tcp.d  | 34 +++++++++++++++-
>   dlibs/x86_64/5.12/ip.d   | 12 +++---
>   dlibs/x86_64/5.12/tcp.d  | 34 +++++++++++++++-
>   dlibs/x86_64/5.14/ip.d   | 12 +++---
>   dlibs/x86_64/5.14/tcp.d  | 34 +++++++++++++++-
>   dlibs/x86_64/5.16/ip.d   | 12 +++---
>   dlibs/x86_64/5.16/tcp.d  | 34 +++++++++++++++-
>   dlibs/x86_64/5.2/ip.d    | 12 +++---
>   dlibs/x86_64/5.2/tcp.d   | 34 +++++++++++++++-
>   dlibs/x86_64/5.6/ip.d    | 12 +++---
>   dlibs/x86_64/5.6/tcp.d   | 34 +++++++++++++++-
>   dlibs/x86_64/6.1/ip.d    | 12 +++---
>   dlibs/x86_64/6.1/tcp.d   | 34 +++++++++++++++-
>   dlibs/x86_64/6.10/ip.d   | 12 +++---
>   dlibs/x86_64/6.10/tcp.d  | 34 +++++++++++++++-
>   libdtrace/dt_prov_tcp.c  | 85 ++++++++++++++++++++++++----------------
>   libdtrace/ip.d           | 12 +++---
>   libdtrace/tcp.d          | 34 +++++++++++++++-
>   35 files changed, 698 insertions(+), 169 deletions(-)
>
> diff --git a/dlibs/aarch64/5.11/ip.d b/dlibs/aarch64/5.11/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/aarch64/5.11/ip.d
> +++ b/dlibs/aarch64/5.11/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/aarch64/5.11/tcp.d b/dlibs/aarch64/5.11/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/aarch64/5.11/tcp.d
> +++ b/dlibs/aarch64/5.11/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/aarch64/5.12/ip.d b/dlibs/aarch64/5.12/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/aarch64/5.12/ip.d
> +++ b/dlibs/aarch64/5.12/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/aarch64/5.12/tcp.d b/dlibs/aarch64/5.12/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/aarch64/5.12/tcp.d
> +++ b/dlibs/aarch64/5.12/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/aarch64/5.14/ip.d b/dlibs/aarch64/5.14/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/aarch64/5.14/ip.d
> +++ b/dlibs/aarch64/5.14/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/aarch64/5.14/tcp.d b/dlibs/aarch64/5.14/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/aarch64/5.14/tcp.d
> +++ b/dlibs/aarch64/5.14/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/aarch64/5.16/ip.d b/dlibs/aarch64/5.16/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/aarch64/5.16/ip.d
> +++ b/dlibs/aarch64/5.16/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/aarch64/5.16/tcp.d b/dlibs/aarch64/5.16/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/aarch64/5.16/tcp.d
> +++ b/dlibs/aarch64/5.16/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/aarch64/5.2/ip.d b/dlibs/aarch64/5.2/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/aarch64/5.2/ip.d
> +++ b/dlibs/aarch64/5.2/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/aarch64/5.2/tcp.d b/dlibs/aarch64/5.2/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/aarch64/5.2/tcp.d
> +++ b/dlibs/aarch64/5.2/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/aarch64/5.6/ip.d b/dlibs/aarch64/5.6/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/aarch64/5.6/ip.d
> +++ b/dlibs/aarch64/5.6/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/aarch64/5.6/tcp.d b/dlibs/aarch64/5.6/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/aarch64/5.6/tcp.d
> +++ b/dlibs/aarch64/5.6/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/aarch64/6.1/ip.d b/dlibs/aarch64/6.1/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/aarch64/6.1/ip.d
> +++ b/dlibs/aarch64/6.1/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/aarch64/6.1/tcp.d b/dlibs/aarch64/6.1/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/aarch64/6.1/tcp.d
> +++ b/dlibs/aarch64/6.1/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/aarch64/6.10/ip.d b/dlibs/aarch64/6.10/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/aarch64/6.10/ip.d
> +++ b/dlibs/aarch64/6.10/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/aarch64/6.10/tcp.d b/dlibs/aarch64/6.10/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/aarch64/6.10/tcp.d
> +++ b/dlibs/aarch64/6.10/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/x86_64/5.11/ip.d b/dlibs/x86_64/5.11/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/x86_64/5.11/ip.d
> +++ b/dlibs/x86_64/5.11/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/x86_64/5.11/tcp.d b/dlibs/x86_64/5.11/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/x86_64/5.11/tcp.d
> +++ b/dlibs/x86_64/5.11/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/x86_64/5.12/ip.d b/dlibs/x86_64/5.12/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/x86_64/5.12/ip.d
> +++ b/dlibs/x86_64/5.12/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/x86_64/5.12/tcp.d b/dlibs/x86_64/5.12/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/x86_64/5.12/tcp.d
> +++ b/dlibs/x86_64/5.12/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/x86_64/5.14/ip.d b/dlibs/x86_64/5.14/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/x86_64/5.14/ip.d
> +++ b/dlibs/x86_64/5.14/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/x86_64/5.14/tcp.d b/dlibs/x86_64/5.14/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/x86_64/5.14/tcp.d
> +++ b/dlibs/x86_64/5.14/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/x86_64/5.16/ip.d b/dlibs/x86_64/5.16/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/x86_64/5.16/ip.d
> +++ b/dlibs/x86_64/5.16/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/x86_64/5.16/tcp.d b/dlibs/x86_64/5.16/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/x86_64/5.16/tcp.d
> +++ b/dlibs/x86_64/5.16/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/x86_64/5.2/ip.d b/dlibs/x86_64/5.2/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/x86_64/5.2/ip.d
> +++ b/dlibs/x86_64/5.2/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/x86_64/5.2/tcp.d b/dlibs/x86_64/5.2/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/x86_64/5.2/tcp.d
> +++ b/dlibs/x86_64/5.2/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/x86_64/5.6/ip.d b/dlibs/x86_64/5.6/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/x86_64/5.6/ip.d
> +++ b/dlibs/x86_64/5.6/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/x86_64/5.6/tcp.d b/dlibs/x86_64/5.6/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/x86_64/5.6/tcp.d
> +++ b/dlibs/x86_64/5.6/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/x86_64/6.1/ip.d b/dlibs/x86_64/6.1/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/x86_64/6.1/ip.d
> +++ b/dlibs/x86_64/6.1/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/x86_64/6.1/tcp.d b/dlibs/x86_64/6.1/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/x86_64/6.1/tcp.d
> +++ b/dlibs/x86_64/6.1/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/dlibs/x86_64/6.10/ip.d b/dlibs/x86_64/6.10/ip.d
> index 493b75a0..95520b4a 100644
> --- a/dlibs/x86_64/6.10/ip.d
> +++ b/dlibs/x86_64/6.10/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/dlibs/x86_64/6.10/tcp.d b/dlibs/x86_64/6.10/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/dlibs/x86_64/6.10/tcp.d
> +++ b/dlibs/x86_64/6.10/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
> diff --git a/libdtrace/dt_prov_tcp.c b/libdtrace/dt_prov_tcp.c
> index a191efe1..44ed2bc9 100644
> --- a/libdtrace/dt_prov_tcp.c
> +++ b/libdtrace/dt_prov_tcp.c
> @@ -72,9 +72,9 @@ static probe_dep_t	probes[] = {
>   static probe_arg_t probe_args[] = {
>   	{ "accept-established", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
>   	{ "accept-established", 1, { 1, 0, "struct sock *", "csinfo_t *" } },
> -	{ "accept-established", 2, { 2, 0, "void_ip_t *", "ipinfo_t *" } },
> +	{ "accept-established", 2, { 2, 0, "__dtrace_tcp_void_ip_t *", "ipinfo_t *" } },
>   	{ "accept-established", 3, { 3, 0, "struct tcp_sock *", "tcpsinfo_t *" } },
> -	{ "accept-established", 4, { 4, 0, "struct tcphdr *", "tcpinfo_t *" } },
> +	{ "accept-established", 4, { 4, 0, "__dtrace_tcp_void_tcp_t *", "tcpinfo_t *" } },
>   	{ "accept-established", 5, { 5, 0, "void", "void" } },
>   
>   	{ "accept-refused", 0, { 0, 0, "struct sk_buff *", "pktinfo_t *" } },
> @@ -166,8 +166,11 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   	dt_probe_t	*uprp = pcb->pcb_parent_probe;
>   	int		direction, have_iphdr;
>   	int		skarg = 0, skbarg = 1, tcparg = 0;
> -	int		skarg_maybe_null;
> +	int		skarg_maybe_null, have_skb = 1;
>   	int		skstate = 0;
> +	dtrace_typeinfo_t sym;
> +	ctf_funcinfo_t	fi;
> +	int		rc;
>   
>   	/*
>   	 * We construct the tcp::: probe arguments as follows:
> @@ -258,11 +261,24 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   	}
>   
>   	if (strcmp(prp->desc->prb, "accept-established") == 0) {
> -		direction = NET_PROBE_OUTBOUND;
> +		direction = NET_PROBE_INBOUND;
>   		have_iphdr = 1;
> -		/* skb in arg2 not arg1 */
> -		skbarg = 2;
> -		skarg_maybe_null = 0;
> +		/* on older (5.4) kernels, tcp_init_transfer() only has 2
> +		 * args, i.e. no struct skb * third argument.
> + 		 */
> +		rc = dtrace_lookup_by_type(dtp, DTRACE_OBJ_EVERY,
> +					   uprp->desc->fun, &sym);
> +		if (rc == 0 &&
> +		    ctf_type_kind(sym.dtt_ctfp, sym.dtt_type) == CTF_K_FUNCTION &&
> +		    ctf_func_type_info(sym.dtt_ctfp, sym.dtt_type, &fi) == 0 &&
> +		    fi.ctc_argc > 2) {
> +			/* skb in arg2 not arg1 */
> +			skbarg = 2;
> +			skarg_maybe_null = 0;
> +		} else {
> +			have_skb = 0;
> +			have_iphdr = 0;
> +		}
>   		/* ensure arg1 is BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB */
>   		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(1)));
>   		emit(dlp, BPF_BRANCH_IMM(BPF_JNE, BPF_REG_6,
> @@ -289,10 +305,6 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   	} else {
>   		direction = NET_PROBE_OUTBOUND;
>   		if (strcmp(uprp->desc->fun, "ip_send_unicast_reply") == 0) {
> -			dtrace_typeinfo_t	sym;
> -			ctf_funcinfo_t		fi;
> -			int rc;
> -
>   			/* Newer kernels pass the original socket as second
>   			 * arg to ip_send_unicast_reply(); if that function
>   			 * has an extra (> 9) argument we know we have to
> @@ -344,10 +356,14 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
>   	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(3), BPF_REG_6));
>   
> -	/* then save skb to args[0] */
> -	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
> -	emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
> -	emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
> +	if (have_skb) {
> +		/* then save skb to args[0] */
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(skbarg)));
> +		emit(dlp, BPF_BRANCH_IMM(BPF_JEQ, BPF_REG_6, 0, exitlbl));
> +		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(0), BPF_REG_6));
> +	} else {
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(0), 0));
> +	}
>   
>   	/* next save sk to args[1] now that we have skb in args[0] */
>   	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(3)));
> @@ -358,34 +374,37 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
>   	 *	skb_network_header(skb)	=	(include/linux/ip.h)
>   	 *	skb->head + skb->network_header	(include/linux/skbuff.h)
>   	 */
> -	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
> -	dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
> -	if (have_iphdr)
> +	if (have_skb && have_iphdr) {
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(0)));
> +		dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
>   		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> -	else
> -		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
> -
> -	if (have_iphdr) {
>   		dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
> -				 "network_header");
> +				       "network_header");
>   		emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(2), BPF_REG_0));
> +	} else {
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(2), 0));
>   	}
> +
>   	/*
>   	 * tcp_hdr(skb) =
>   	 *	skb_transport_header(skb) =		(include/linux/ip.h)
>   	 *	skb->head + skb->transport_header	(include/linux/skbuff.h)
>   	 */
> -	emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(tcparg)));
> -	if (tcparg) {
> -		/* struct ip_reply_arg * has a kvec containing the tcp header */
> -		dt_cg_tramp_get_member(pcb, "struct kvec", BPF_REG_6, "iov_base");
> -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> +	if (have_skb) {
> +		emit(dlp, BPF_LOAD(BPF_DW, BPF_REG_6, BPF_REG_7, DMST_ARG(tcparg)));
> +		if (tcparg) {
> +			/* struct ip_reply_arg * has a kvec containing the tcp header */
> +			dt_cg_tramp_get_member(pcb, "struct kvec", BPF_REG_6, "iov_base");
> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> +		} else {
> +			dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
> +			emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> +			dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
> +					 "transport_header");
> +			emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> +		}
>   	} else {
> -		dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6, "head");
> -		emit(dlp, BPF_STORE(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> -		dt_cg_tramp_get_member(pcb, "struct sk_buff", BPF_REG_6,
> -				 "transport_header");
> -		emit(dlp, BPF_XADD_REG(BPF_DW, BPF_REG_7, DMST_ARG(4), BPF_REG_0));
> +		emit(dlp, BPF_STORE_IMM(BPF_DW, BPF_REG_7, DMST_ARG(4), 0));
>   	}
>   
>   	if (!skarg_maybe_null) {
> diff --git a/libdtrace/ip.d b/libdtrace/ip.d
> index 493b75a0..95520b4a 100644
> --- a/libdtrace/ip.d
> +++ b/libdtrace/ip.d
> @@ -170,8 +170,8 @@ translator ipinfo_t < void_ip_t *I > {
>    * In some cases where the ipinfo_t * is NULL we wish to construct IP info
>    * using the struct tcp_sock * (arg3).  In order to map local IP to source
>    * or destination IP address appropriately we need to check if the associated
> - * data is inbound (NET_PROBE_INBOUND in arg7) or outbound (NET_PROBE_OUTBOUND);
> - * the value is stored in arg7.  If inbound, we map the local IP address to
> + * data is inbound (NET_PROBE_INBOUND in arg6) or outbound (NET_PROBE_OUTBOUND);
> + * the value is stored in arg6.  If inbound, we map the local IP address to
>    * ip_daddr (destination), and if outbound it is mapped to ip_saddr.
>    */
>   #pragma D binding "1.5" translator
> @@ -214,12 +214,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family == AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr) :
>   	    "<unknown>";
> @@ -229,12 +229,12 @@ translator ipinfo_t < __dtrace_tcp_void_ip_t *I > {
>   	    inet_ntoa6(&((struct ipv6hdr *)I)->daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET ?
> -	    inet_ntoa(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_daddr) :
>   	    arg3 != NULL &&
>   	    ((struct sock *)arg3)->__sk_common.skc_family== AF_INET6 ?
> -	    inet_ntoa6(arg7 == NET_PROBE_INBOUND ?
> +	    inet_ntoa6(arg6 == NET_PROBE_INBOUND ?
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_rcv_saddr :
>   	    &((struct sock *)arg3)->__sk_common.skc_v6_daddr) :
>   	    "<unknown>";
> diff --git a/libdtrace/tcp.d b/libdtrace/tcp.d
> index 48d9adb4..8f87aa57 100644
> --- a/libdtrace/tcp.d
> +++ b/libdtrace/tcp.d
> @@ -172,14 +172,14 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   	    (T && ((struct inet_sock *)T)->inet_sport == 0) ?
>   	    ((struct sock *)T)->__sk_common.skc_num :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->dest :
>   		  ((struct tcphdr *)arg4)->source) :
>   	    0;
>   	tcps_rport = T && ((struct sock *)T)->__sk_common.skc_dport != 0 ?
>   	    ntohs(((struct sock *)T)->__sk_common.skc_dport) :
>   	    arg4 != NULL ?
> -	    ntohs(arg7 == NET_PROBE_INBOUND ?
> +	    ntohs(arg6 == NET_PROBE_INBOUND ?
>   		  ((struct tcphdr *)arg4)->source :
>   		  ((struct tcphdr *)arg4)->dest) :
>   	    0;
> @@ -242,3 +242,33 @@ translator tcpsinfo_t < struct tcp_sock *T > {
>   translator tcplsinfo_t < int I > {
>   	tcps_state = arg3 ? ((struct sock *)arg3)->__sk_common.skc_state : 0;
>   };
> +
> +/* Use struct tcp_sock * to fill out tcp header info where we do not have
> + * an sk_buff with struct tcphdr * available; currently only used for
> + * the tcp:::accept-established case where the struct sk_buff * is not
> + * available on < 5.10 kernels.
> + */
> +typedef void * __dtrace_tcp_void_tcp_t;
> +
> +#pragma D binding "1.6.3" translator
> +translator tcpinfo_t < __dtrace_tcp_void_tcp_t *T > {
> +	tcp_sport = T ? ntohs(((struct tcphdr *)T)->source) :
> +		    arg3 ? ((struct sock *)arg3)->__sk_common.skc_dport :
> +		    0;
> +	tcp_dport = T ? ntohs(((struct tcphdr *)T)->dest) :
> +		    arg3 ? ntohs(((struct inet_sock *)arg3)->inet_sport) :
> +		    0;
> +	tcp_seq = T ? ntohl(((struct tcphdr *)T)->seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->rcv_nxt :
> +		  0;
> +	tcp_ack = T ? ntohl(((struct tcphdr *)T)->ack_seq) :
> +		  arg3 ? ((struct tcp_sock *)arg3)->snd_nxt :
> +		  0;
> +	tcp_offset = T ? (*(uint8_t *)(T + 12) & 0xf0) >> 2 : 0;
> +	tcp_flags = T ? *((uint8_t *)T + 13) : TH_ACK;
> +	tcp_window = T ? ntohs(((struct tcphdr *)T)->window) :
> +		     arg3 ? ((struct tcp_sock *)arg3)->rcv_wnd :
> +		     0;
> +	tcp_checksum = T ? ntohs(((struct tcphdr *)T)->check) : 0;
> +	tcp_hdr = (uintptr_t)T;
> +};
