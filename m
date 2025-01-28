Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407695789D
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738045915; cv=fail; b=ak1k6Mona+7PvB48C/UaWVF36Wn63w8Gh9OGxdBWz/0I9nSnt8MtP8xwKrG1PiCb8f3OeiShwKetJU0qabD4A8uF6iwfiFnEny5uww2iVt6uJg/K/l8WxCSiiUaD9fQ5vr0SkERuOsxGIhu4SNXVCBnd9l4rHNDZhS3e990jFDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738045915; c=relaxed/simple;
	bh=cbjBVfJrinJU3IUZhhtnAW9W155zCgSMX8cubdxRToc=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=Bw2nnqjhYVVZQTuJ6ry0ryik+wI2KvNmSEe0kYn4MSS0O9yCcRLDiIrpkfR9l+qaWWeLOzS94uBf3OrFLWXtfdntuHUzxdfWHZZ+7kf2fvVV/JEiQ546qkc3mG7GV/qkZm+JgkmfBgMWKzebzymBgGE5ym6ndR0opCUe7Dl0dYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=egPGo8cI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=kecg+DVk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="egPGo8cI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="kecg+DVk"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S6GmfX029175
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=WHi/E4iI/hbMoMRh5uiSALK1joKAq3z6CrTjsvoRW54=; b=
	egPGo8cIgQ0g9VmULQR4itc8/lCprJJu+roGktIja4VwwTKAEeLT0qkXv7LSwWzd
	tsXpRogYBxAJ/C32J9rbGTb2TRlp7sbIE49xgH5picbcBf0X+p8KRGy436lMTbdf
	mv8wxvYQC6vdeubn6CONHOYHPS2XjQ0GIZ8NNk0iSFONithQR76VZ5wTLNK7pIcz
	pCu+5DxL27mwLVdYsLYsBhk9eJSiQVzk4QWh6iuWxSY2MaNOQ3L46rwPLfesTP/j
	bWF+hA1s4qdzWYM0IH4Vp1jzUXqWUmtUZDZD645rzM1HnEtKoNINPOy7elB1pbiJ
	IlharRXNT9ZmcESA6IYPGA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44esu000cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50S6TMT4035827
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:51 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpde09ye-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 28 Jan 2025 06:31:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MayTxnzVWn4c/2SHZXSRdpwUg0hzHUMge1+naSkzUOR0GVGRiad83Jb7RRVdrcV62n5u417sMvBURa0fqAtDGLLb4WOY0jTBwp9lVJx1Syy3V5WL31BSHSZNT1GtOUjhjnLHKhVOwVLlQjmDxa5BHreoaCOFo/qB3rKFBu/lsEVjSDNPutJubLks3qgW3PsneKMbmaUugRQjNdwYfe3FDnPVwKyDP38mQTV8d51ZEsqq0uB7n0qvZ/fZ/sgjpGlKDc3yKDs3xKQW734ds8Sk8A08FaYprG9V8sjdqDEFfWMEuEz80CCV2JbXKPPCdQ0ijw8+lkwnuWq4ETvUN03Vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHi/E4iI/hbMoMRh5uiSALK1joKAq3z6CrTjsvoRW54=;
 b=R+8aFPnLSw5GLoU/T9xCcNcVB91VKewePPHKYIiw6u1dwEFMQxC1Oz35PhX8hmbTF64vCTQJMiI1VavuR1lAnFF/GarQTZDKQE7kiXiLAYgDjwQjOHtjgj2d/sg6oQhOcX6zXqYdH5OORlzNyeB7YEHc9pXsN+akSNw2whhEQe+WdaY2hReRju+i/VkpdkfMsXOSqXwG9ml4WN/EiSIIjJP/BklC9lgGUFjr5X8dSmGT4+H/TmxWGNV3S/DhVuXYBIUKC3CDxDTkOkcN0SXpeSzkQIjDq021tnAM3UQhPT2rWRRoPtRk60pRNmDYvkhKFj59XD60SZtYlT38YSNkVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHi/E4iI/hbMoMRh5uiSALK1joKAq3z6CrTjsvoRW54=;
 b=kecg+DVkUunpmlZVmn6kOYhCZfo+cEy/zA5OC/IRyY0PzAQBBLTHOXC2kuK8lh0Ju7zezzDHMjugWYJLmlILxmMeZ5itqGDaiiCpkQ95wzUMoYG3StH1Oyi7TSsYU6cvGnwxJSA5k5c0f7IwfEVmGb1FA88sD//TOQP33GsCWTA=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by SA1PR10MB5886.namprd10.prod.outlook.com (2603:10b6:806:232::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 06:31:49 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8377.009; Tue, 28 Jan 2025
 06:31:49 +0000
Date: Tue, 28 Jan 2025 01:31:48 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 6/6] procfs: populate pr_argc, pr_argv, and pr_envp with
 default values
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Message-ID:
 <PH8PR10MB633769A4429BE0BA293C8FE0C2EF2@PH8PR10MB6337.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|SA1PR10MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: 037f2df1-5b79-46c2-0610-08dd3f65721c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pZTbEC7pk9rZ0eZHm+jIpcBJxSx4v4VTJGlpHjwTqo8dk4e6NqPGKZuv+M4p?=
 =?us-ascii?Q?Nh/OsEvnD2Bi4EOddKjvtSf6fS2SDNsEhp8kxhkaoS6wOya49sTO/7lPugih?=
 =?us-ascii?Q?AJKUcQwdKdqQxM1Dbw8DzG3zzRZRH+X/AMrCDCXIfrM0q10VGz7ZsqV/+vJy?=
 =?us-ascii?Q?Iui9P5wqU/wlaa4QoHJvvJmWFVi8C2x2y5GCLfSBnCCdKaqz7ykIAnbAH51a?=
 =?us-ascii?Q?0MDzlnBH9FRbdBifGpcdMspEkSaohd9IkDrTN0MmkEfFD6rHuG6CqfivuvJE?=
 =?us-ascii?Q?TLOkKGF1FO2yhe6BbQNUOFkX/1OMPGbXqi9lED5qo3kz8MYYJ5cpLSlu1Q8+?=
 =?us-ascii?Q?2DjhXFgvE31CBJqex1fYWxl+oyl+zAJKdYe71qtqcu8J7I0jk9FTI+IaCfoG?=
 =?us-ascii?Q?plscb/moAvhmEjCoZ4K65ccx6QmxJOrZZjrh7Je1SlgvGSr8O2OFFJjK9d9a?=
 =?us-ascii?Q?HtjnSEfFBFJhQv6ntNDGydWEwtI3c81yIEWSqGOCZrEWoHKeIqv5iWScN3PD?=
 =?us-ascii?Q?bFWtKZ+h9yYXF32riObQ0uN2qz7A2yjp3xV1HCLZRWBL9AvYj6kkJSv3JzzJ?=
 =?us-ascii?Q?ybfI7v2u4ccZDTkQGsJ7BFKjvf5+3LXPZcsIvzFhmOQ+iKo8GbfdGhpT85PH?=
 =?us-ascii?Q?vkZnDf4EXSMDAJ7lH8MT5UTHj3SgTqwxT6IMw5rt6asHhdKw+W1ti3WmYObn?=
 =?us-ascii?Q?94hG/yD9VdgPjN+uvJjUhMzHgo+AVePh9gFkZQdJor3bzRT6LfHtyei8Dvu/?=
 =?us-ascii?Q?nPng9IyLB2CmzRaiYS9k8TEkCK+s8w/I+M+SSBELynHZP02lj+wVnZONROW0?=
 =?us-ascii?Q?fxBZUT/XqL7+mZ34aX3ZNhKNrMOWyBj6WExAVSd9lsqY9fuuJ++kNmqJNbVc?=
 =?us-ascii?Q?76d1t+iFQCBsqO9aJUbvjcvZKKfkRSkRgtz37+T9uXXoj7NEPOCp2ybhgzFL?=
 =?us-ascii?Q?tNCpP/VL0WHIbJAgyTvLnFy1C4jochE+dTTldkP5PVkRLpvV8Awf2+osmQCD?=
 =?us-ascii?Q?HvnUgKewGc1roNH+gYYAwlS+eoi2x6ZEB6ooFBM0MVNK2zBOJ6GA8/+TeubO?=
 =?us-ascii?Q?wmjN0gxn/3nTbBSeODfbVgv3MWPEPT+K3GaF1w7il5sUK4qMVaNDEctG+oNp?=
 =?us-ascii?Q?r1+oOD01z5wrOJoNwXbdZYuxQm3CBnnI6m5vqphGql7qBDcpXIIFLBt/zm5v?=
 =?us-ascii?Q?7eMESPouoT6iU9Oha8YWa3nSxVb9YWvCUPtR217IWb0aPFp/rPfQU9SW89u/?=
 =?us-ascii?Q?vzHx6qHIwoXUo7wAOF23+VXXOsjl1O0fANNNTNLUibs5IElOItryk9zgzjo+?=
 =?us-ascii?Q?txVW+IDOceCc2Nrwv6y8T38Ilge/oioomBFZPNUx3jqgzw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CPrRM+qgi80IxnCNx3FUyCwOXO2cIHEFaGIQPrMUJIreBFVzxnBjArFZkHMa?=
 =?us-ascii?Q?3/oOttvw96ItoXecomIXxVeeGIHadEuMesaWEvVQX8gTb48rs4SRaDw93mcz?=
 =?us-ascii?Q?MFVxPPBpkp8FEXDYB/bEQVDbBhRIbqhHwXMgw1kWecjMdLnyQN2HsPi5kFnB?=
 =?us-ascii?Q?6pFTDgo7e0ySVMY/cPfRMRY3mtRLW1ls/wK71YBLHmaltNoupPTpujrizM6q?=
 =?us-ascii?Q?wZYolEh+vnhOopgWNilL0wzGACtcAoTSr5yiqT57h7bdxxVsCf5xjvqrGPb1?=
 =?us-ascii?Q?Xa/E+xgEKvmc4NToweJJ8boSFvVqOEwra88lRM3PPsiS/jYbOkN7KoqF7H1z?=
 =?us-ascii?Q?J+FwLA8xaY9Qjd9qx6s8+uIPZWdu6W49hbXJkTxNGAGMxCQULwp2vPKqic0w?=
 =?us-ascii?Q?Iu1GzoWwwNq8TMSiGYLUVottpDaHTktfTtGU8ta4yS2h/mehpQtRIofuNn9o?=
 =?us-ascii?Q?gYyT1rSNb0vel/pk2+RadXqdu6tsib7mDOfEDOAkWbK+i/24g6GUklKKNCAj?=
 =?us-ascii?Q?m+vDeUaGGMIDJ/4ObmAohmIhQ0XOw389kicbc1Yxu09Fm3lNFzFMuBFGCLSt?=
 =?us-ascii?Q?61VHlAKZzHQ0WZ2wQ4cW9G8eXh0iXNNV3yvGLbwNYpVWwh6nZAjZPj9xqE2g?=
 =?us-ascii?Q?GHwYU5monrcpFQAOSao8gBJu3O0ovrProZ2ViFtZWetK9kEf8eYFz3iI0oCA?=
 =?us-ascii?Q?UMiASooz46JjI1RhAWM4mEOYSKzQNnVeNKuNjXEidPfasF2yR6rFqPoJC03K?=
 =?us-ascii?Q?dRZ+yrRa8vlpnOJs6UxDfhfmZMg6w5ONkv+D2hwXq5GoY8n7u/2m/QYAKr2t?=
 =?us-ascii?Q?/3XDBdIPFHrhuo3kh1duInTBP1Il3f7JJ3wcC+WXF24ZNYt4TBW2ITtPOQ0J?=
 =?us-ascii?Q?pCtqetOHsBXzd7DN7vDoZThcCa+he1ZJ7MqeKTVPB+FB+vjfNDHhQekNqIRw?=
 =?us-ascii?Q?eHkmRQg2ggozxWTnlZo+FFNIi6YkZk/KmSxq24iZ9zaY2A+cy1ZBc7zapVgO?=
 =?us-ascii?Q?nptC6h1zwhtG4SAkPp9JnewBsmfexFxdd/0h9om9ESULK8KJWCUjYTwqKsOZ?=
 =?us-ascii?Q?pilU2qZrxkJwJO9I9m0BIkPYAjWmHdUYiwyWDMQ7Do5JwERBKwGlz9FKgMY/?=
 =?us-ascii?Q?Ehw2MawDtqUzHiqW1ljvSojYam/cxsVTxwKrN2odrfp9b9gcPMsseEZ4Xwh+?=
 =?us-ascii?Q?NrtS76DMwSfa8wJ/qD0MIVHF7lsxkAl0cmlas2Swvsk1gvCIb7p7U+F48SX0?=
 =?us-ascii?Q?rQuJY573xWNKlHYCtjsdeiAjRqaCnhED5no6JzPEfrAw9mPiZmcD6FuP/tHQ?=
 =?us-ascii?Q?CHH825lUfnRUDc66uPrGWD7DmeZsIBFfgXQrPfR64a0HjUOFPjkeS+eeBrEN?=
 =?us-ascii?Q?/X8KraB0VSKtvqyEi/XKge407gHddgXicXtPX+awidUkHRVYjZbJnH2lNmj2?=
 =?us-ascii?Q?TaDTo3cT1Dhk07lh7Lqb1yJhsA8vnQx4H5hi8tlVphR3Ul0aX9IrlhsoR1x3?=
 =?us-ascii?Q?QhdRHGKXIogNQHE/4vTMf1r3AI99aqppAJaboZUUA/rp0i+Dzv8LZBLoVu6y?=
 =?us-ascii?Q?mAH3gOy6bdO5VDNYLiAvqu+nC8fZ4WGUdaAMKRFbyogM4PCIRHeI5TjOjDo1?=
 =?us-ascii?Q?dg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RM6OStGoTLRM/4ICihIrGjYvsa4G+jTet/xK/mRHbmidkg9WThjmSTgV/j9y7gckHoK/Dr6ApQl3YUqfDAg6zpqNbOhmoeiRNPiYJv10+5jSU1Vk59qeXdBKjhwPn8w6X4uKf15cYbdA9KHpKVXy2kQwxSAANl+QwHgr7dwMMyXiOpJ3k5cd5jXBdeBJg6kxswxdxSSDCmRhmXCTs+zBb8S0YUv+eaXIrXIywPfIhLlzmBV+5yhWMbaAAuHIIdAPIZpw3jSlT7nNTLwJojXVYWCbnp+9FRTXaZ9LeLTsuIvCYFsX36d5BwSy63OAC9xl/k94Ea9qkKKw6dEDxgwgz0r22hwHVj6Lig+pQGBR9xrhkHFPSv9CpB6cgIqdh1vnBnwUFAkL5ivqe7fV7sXm6ZDvmDTBmCK6asuQ7HP0DP6PrrDbeUUsNpPF5I7OdmfFwKhLwGItofqIk+/WzN4vnIuPU9BuvyAuZcAlxOBOrKH63VeiJFPMH8IikrB3UdaaFQbGvkFp6beN2UanUKSODRIbM2gvnx/f+xeArDM+7tA0TlP9aOKyl4wBl0GfdHJlt6r34TkgcqgbfvU/h5NkixMsFBmpaWXTqMyAjulG63g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037f2df1-5b79-46c2-0610-08dd3f65721c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 06:31:49.6181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCpmhwrJ6CGKz+B/3xPKlkhpGR7gNZMdrvn3Zkj9ggaKTRkSi3l1dKdS3hJJXPM/uXFXvaE/Rfolcq0alhB8nWqOiZQ+XMy28ppBQH+Cvcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5886
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_02,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 bulkscore=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501280048
X-Proofpoint-GUID: An1CWN_ROdIu0zvmHW2DpIYHmvR-KQbh
X-Proofpoint-ORIG-GUID: An1CWN_ROdIu0zvmHW2DpIYHmvR-KQbh

The pr_argc, pr_argv, and pr_envp fields in psinfo are not implemented
yet, so it makes sense to set them to 0 rather than not providing any
translator for them.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 dlibs/aarch64/5.11/procfs.d                       | 8 +++-----
 dlibs/aarch64/5.12/procfs.d                       | 8 +++-----
 dlibs/aarch64/5.14/procfs.d                       | 8 +++-----
 dlibs/aarch64/5.16/procfs.d                       | 8 +++-----
 dlibs/aarch64/5.2/procfs.d                        | 8 +++-----
 dlibs/aarch64/5.6/procfs.d                        | 8 +++-----
 dlibs/aarch64/6.1/procfs.d                        | 8 +++-----
 dlibs/aarch64/6.10/procfs.d                       | 8 +++-----
 dlibs/x86_64/5.11/procfs.d                        | 8 +++-----
 dlibs/x86_64/5.12/procfs.d                        | 8 +++-----
 dlibs/x86_64/5.14/procfs.d                        | 8 +++-----
 dlibs/x86_64/5.16/procfs.d                        | 8 +++-----
 dlibs/x86_64/5.2/procfs.d                         | 8 +++-----
 dlibs/x86_64/5.6/procfs.d                         | 8 +++-----
 dlibs/x86_64/6.1/procfs.d                         | 8 +++-----
 dlibs/x86_64/6.10/procfs.d                        | 8 +++-----
 libdtrace/procfs.d.in                             | 8 +++-----
 test/unittest/builtinvar/tst.psinfo-bug21974606.d | 1 -
 test/unittest/builtinvar/tst.psinfo-bug22561297.d | 4 +---
 test/unittest/builtinvar/tst.psinfo1.d            | 1 -
 20 files changed, 52 insertions(+), 90 deletions(-)

diff --git a/dlibs/aarch64/5.11/procfs.d b/dlibs/aarch64/5.11/procfs.d
index 9c06fe1f..52b2bbe2 100644
--- a/dlibs/aarch64/5.11/procfs.d
+++ b/dlibs/aarch64/5.11/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/aarch64/5.12/procfs.d b/dlibs/aarch64/5.12/procfs.d
index 9c06fe1f..52b2bbe2 100644
--- a/dlibs/aarch64/5.12/procfs.d
+++ b/dlibs/aarch64/5.12/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/aarch64/5.14/procfs.d b/dlibs/aarch64/5.14/procfs.d
index 2824d137..8c05e299 100644
--- a/dlibs/aarch64/5.14/procfs.d
+++ b/dlibs/aarch64/5.14/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/aarch64/5.16/procfs.d b/dlibs/aarch64/5.16/procfs.d
index daf30745..e52ab29a 100644
--- a/dlibs/aarch64/5.16/procfs.d
+++ b/dlibs/aarch64/5.16/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/aarch64/5.2/procfs.d b/dlibs/aarch64/5.2/procfs.d
index 3594e5e9..4a95dfd1 100644
--- a/dlibs/aarch64/5.2/procfs.d
+++ b/dlibs/aarch64/5.2/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/aarch64/5.6/procfs.d b/dlibs/aarch64/5.6/procfs.d
index 9c06fe1f..52b2bbe2 100644
--- a/dlibs/aarch64/5.6/procfs.d
+++ b/dlibs/aarch64/5.6/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/aarch64/6.1/procfs.d b/dlibs/aarch64/6.1/procfs.d
index 2d52f079..4881aa5b 100644
--- a/dlibs/aarch64/6.1/procfs.d
+++ b/dlibs/aarch64/6.1/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/aarch64/6.10/procfs.d b/dlibs/aarch64/6.10/procfs.d
index 2d52f079..4881aa5b 100644
--- a/dlibs/aarch64/6.10/procfs.d
+++ b/dlibs/aarch64/6.10/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/x86_64/5.11/procfs.d b/dlibs/x86_64/5.11/procfs.d
index 7679db2e..96e55dc1 100644
--- a/dlibs/x86_64/5.11/procfs.d
+++ b/dlibs/x86_64/5.11/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/x86_64/5.12/procfs.d b/dlibs/x86_64/5.12/procfs.d
index 7679db2e..96e55dc1 100644
--- a/dlibs/x86_64/5.12/procfs.d
+++ b/dlibs/x86_64/5.12/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/x86_64/5.14/procfs.d b/dlibs/x86_64/5.14/procfs.d
index 3a348ebc..8dbf3c01 100644
--- a/dlibs/x86_64/5.14/procfs.d
+++ b/dlibs/x86_64/5.14/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/x86_64/5.16/procfs.d b/dlibs/x86_64/5.16/procfs.d
index daf30745..e52ab29a 100644
--- a/dlibs/x86_64/5.16/procfs.d
+++ b/dlibs/x86_64/5.16/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/x86_64/5.2/procfs.d b/dlibs/x86_64/5.2/procfs.d
index 6ad926ee..23e05c2c 100644
--- a/dlibs/x86_64/5.2/procfs.d
+++ b/dlibs/x86_64/5.2/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/x86_64/5.6/procfs.d b/dlibs/x86_64/5.6/procfs.d
index 7679db2e..96e55dc1 100644
--- a/dlibs/x86_64/5.6/procfs.d
+++ b/dlibs/x86_64/5.6/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/x86_64/6.1/procfs.d b/dlibs/x86_64/6.1/procfs.d
index 2d52f079..4881aa5b 100644
--- a/dlibs/x86_64/6.1/procfs.d
+++ b/dlibs/x86_64/6.1/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/dlibs/x86_64/6.10/procfs.d b/dlibs/x86_64/6.10/procfs.d
index 2d52f079..4881aa5b 100644
--- a/dlibs/x86_64/6.10/procfs.d
+++ b/dlibs/x86_64/6.10/procfs.d
@@ -143,11 +143,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* Not implemented yet. */
+	pr_argv = 0;			/* Not implemented yet. */
+	pr_envp = 0;			/* Not implemented yet. */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/libdtrace/procfs.d.in b/libdtrace/procfs.d.in
index 827d6b81..d4433be4 100644
--- a/libdtrace/procfs.d.in
+++ b/libdtrace/procfs.d.in
@@ -181,11 +181,9 @@ translator psinfo_t < struct task_struct *T > {
 	pr_fname = T->comm;
 	pr_psargs = d_execargs(T);
 	pr_wstat = 0;
-/*
-	pr_argc = get_psinfo(T)->__psinfo(argc);
-	pr_argv = (uintptr_t)get_psinfo(T)->__psinfo(argv);
-	pr_envp = (uintptr_t)get_psinfo(T)->__psinfo(envp);
- */
+	pr_argc = 0;			/* not implemented yet */
+	pr_argv = 0;			/* not implemented yet */
+	pr_envp = 0;			/* not implemented yet */
 
 	pr_dmodel = PR_MODEL_LP64;
 
diff --git a/test/unittest/builtinvar/tst.psinfo-bug21974606.d b/test/unittest/builtinvar/tst.psinfo-bug21974606.d
index 68d9503d..03857e83 100644
--- a/test/unittest/builtinvar/tst.psinfo-bug21974606.d
+++ b/test/unittest/builtinvar/tst.psinfo-bug21974606.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION:
diff --git a/test/unittest/builtinvar/tst.psinfo-bug22561297.d b/test/unittest/builtinvar/tst.psinfo-bug22561297.d
index b9efd0ec..ffccf469 100644
--- a/test/unittest/builtinvar/tst.psinfo-bug22561297.d
+++ b/test/unittest/builtinvar/tst.psinfo-bug22561297.d
@@ -4,11 +4,9 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
- * ASSERTION:
- * To print psinfo structure values from profile.
+ * ASSERTION: To print psinfo structure values from profile.
  *
  * SECTION: Variables/Built-in Variables
  */
diff --git a/test/unittest/builtinvar/tst.psinfo1.d b/test/unittest/builtinvar/tst.psinfo1.d
index 9e6d5053..7c451598 100644
--- a/test/unittest/builtinvar/tst.psinfo1.d
+++ b/test/unittest/builtinvar/tst.psinfo1.d
@@ -4,7 +4,6 @@
  * Licensed under the Universal Permissive License v 1.0 as shown at
  * http://oss.oracle.com/licenses/upl.
  */
-/* @@xfail: dtv2 */
 
 /*
  * ASSERTION:
-- 
2.45.2

