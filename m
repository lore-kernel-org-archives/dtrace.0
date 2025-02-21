Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6894A1FBCB9
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 20:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740168577; cv=fail; b=pKj3yRbCYrl+ZRxKebnhbxRjAtVl/R6D42+DsiinUFkL8rc9+Q0p0lCDfAlX3LVh+iMrjpRot3quM3NkhIidNrURItvyzDWQtCLGfLu7B/bsNv8OBKk7kPhY9FPpAqyxLkF5SbwhkKXZ9+IrwbJHA+BVtwH9orOlxPpSST9Cu3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740168577; c=relaxed/simple;
	bh=/FH9mb2dVxa8EV6+RahyMThgxIr+U1L5qm+jWnlS4uQ=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Q/KwypeZXAeTAqMIRSv2NE1D4SYam30Y835y7fV83MINzMe0KmokQiuo73spqyJKKDdjlYCGMr0xGgEGolNdmvo2bRtRCXDlMLubqp2gv+sDAQpY3nOcIxPt5Cde17dt9SYnY0YD5hB3p/12wPQOdMSGpiUk7ZizzGtp+K6VlZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NONWRm6Q; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=GlGxhvnd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NONWRm6Q";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GlGxhvnd"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LJfhqb024481
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 20:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=qK1tIQFMu7zqPr+1dwesk3IYYm9+Qsv/p/ut74SzFOg=; b=
	NONWRm6QMEOjdnvt2VJdAE6KG4Dc3GrARCiiNYL5DwzyycjEsCrsYOrg0FZyzFvk
	dnJVzL6dT+n4O6weZHxltuI0JcKyvQTO8nMZnfhHDx5PSR34yBm+CIf3x/AqcVTe
	KyxuII75putBRmOlNuVPNIq22eZKjtHaxcrv/keHXJJWMyPE5ouyC7UMVPMTisPd
	xVtdHU9Y2T2QgZkw+bADnrvNeWBpgrvCYsBdCJ1lxqE6SrhnwhL/YHKueGzIi6p5
	OQzXt/K7tmw7kmQCtc6Twp8TfUqgnsVsd9l/rvNg6BTzis6cwtp0UUjsnA28eafw
	skAfUlD5Zm08BQ2cuhqLoA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44w00n6yv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 20:09:33 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 51LJj4tk010457
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 20:09:33 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44w07h6wy9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 21 Feb 2025 20:09:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9m58c4XA9jecPZr/B1ne5lrnuTM5lUFpumsj5SPTh0KPyc+n43RimUUcOMqgrCZGleoPje3XkPVbjhWwS+oBGj1oYkXnvYj5ygzYscmi0IR4UPNIla5kIQh5/VfHZ85ezSsLZp10LkWjHg9Nvbk2t6nD/u/WtNoiHpXWJjnMR684s0AaNJjQ2D8bVAw7IGn5IVA95SSSbwfouoAGG5xpjv+YBPE7U4ZpLn3lioA4YZi2YrGifu3nKsZXZavYIrd4IKDt4SO4sqNn7JgF2m95Zh60MgFKIj2ov7xZYzEOpAwI3QKmFDz18EszzCH1q/xl8vlFFb2xvyoN9ihVVYjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qK1tIQFMu7zqPr+1dwesk3IYYm9+Qsv/p/ut74SzFOg=;
 b=goZyH+ewWhK9fIQH5VLnO9Kp2dLad0r8fv5ne9qGXP/J5R6w7PB6EA5SBRfUk5qAJ8TgwHDQOjUAlEr8coT10uuBoIeYs+uj1dcMvBiBgDqV9uQ54t6NDvloenZwX6Xu/9eNOY9ZkkHZCys+YsGgkcwVtPu9JIHlbVMPAOZnbrX55jq/4r41zHyk0lmqCbA880evYuCM2ZievNqfKOqneSErcRKRTfKYfJGwU5+elYsvRd2Iw9Mu6B7OliI5VQDiNsCdEZ1SVEZMlsXPNLPkD6kFEfMIiL9vfb+XidT/9kIbMrygQVVE2TT/M8+RenFbSXDnXC65tfv63zHVixGvig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qK1tIQFMu7zqPr+1dwesk3IYYm9+Qsv/p/ut74SzFOg=;
 b=GlGxhvnd9z9BJ6uJT64PqV9lpAOfsprpNIhGzeK+wtYfIZouIWauJW8r7LWpH0adBmcy8xTN1zx4SSgB3cZoQqjCJbthA0tVGs6oeGqHAe2gKyubdGZnViZfwsfyMPCky3jxWUSVPzUfiyIjElRIOrrzs9epnOvrvbv1Zw3+cK8=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by CY8PR10MB6490.namprd10.prod.outlook.com (2603:10b6:930:5e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 20:09:27 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::8b24:5536:3259:5a69%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 20:09:27 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] Use DT_TRAMP_SP_SLOT() for BPF stack scratch space in trampoline
Date: Fri, 21 Feb 2025 15:09:24 -0500
Message-Id: <20250221200924.4445-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0619.namprd03.prod.outlook.com
 (2603:10b6:408:106::24) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|CY8PR10MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b0d85f1-0aa5-4f44-c35e-08dd52b3a485
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RH++iehaX++Jbi3P6PriKd2aldEGazPL9DQyL64rXMiCInetvQK/GHrfZPSO?=
 =?us-ascii?Q?55b8N+14CiaQLbehCSQyRtjfS7uOCQ7id4Kx71SX/Y5aTlj4ZudrMHpmUlbz?=
 =?us-ascii?Q?cTCvnZx2BMLC/P3SxYbo6U1tWialR/DTKP6jNv+UClAjl1H/6F9UGdlkhtMQ?=
 =?us-ascii?Q?YtDofyQLImg4JI428JFr4LsOu48YnJ35Q1QM4QAz8ExtwG85EHeEYj9aBMpD?=
 =?us-ascii?Q?ANHlWXf26jnFHd5RHw5Bf1GZYO1eufP8E5o2okx+8iNoohUhSqICN0/hRqzr?=
 =?us-ascii?Q?9oATgW23XjkhssTT9k7bMggVlN/lTGrGpQCbbefz25qlLE3C73rq6DmzCpMF?=
 =?us-ascii?Q?nlglf0x5Y8icuPdi2Rh9dt/xxJXJJfIlLW9qlySWlVyJ/USwxJbJgjEGjEGe?=
 =?us-ascii?Q?xjuNlhzc4O6HtD5t1wS8tb13479MA0fNYyeNmqelw2Kyc34ZefHZj1arLt5T?=
 =?us-ascii?Q?dyKloe2AJwFIlfj00jZGIrkL3J7EAPSZUDTeX75e3iqlHTsoC4k3Y4c1WZxX?=
 =?us-ascii?Q?6zul/Tlf2JjQlOEDCjED0cJgl/pHkdxzW2RteKK8W1r/Gu0r1ARDWpnPk7qr?=
 =?us-ascii?Q?KSHx4LWp9yikh8H1Q85z0iMCr1trLvlHOjf7ZFm7p9EB+wtEswgFPakkYUDL?=
 =?us-ascii?Q?2+J0e1Q/2GlTihJgM4/OvQzTcC6AK6PfZTNH+hxv6KROHn+bMQ6WBDUeZjpR?=
 =?us-ascii?Q?MFkwKiv74ppFG8OShMNzbiY4QQWW6ZNajqDDVrATRJtopJ0DFF4FuXaL44M4?=
 =?us-ascii?Q?SxhyIRnH1wDNMd1IBmEaFWMU68Zt9bV1O/OiKn82g7fTZDy4J9SHBtLpgRid?=
 =?us-ascii?Q?H+34ZXbVRYofr2opEuKEsEVGs6Hgwf10kNfGKESSOqLxk4lXSE51/kWwK0ZH?=
 =?us-ascii?Q?Kyr+ivT/WqF8e1CgksulwI+9iHV3SC0GRKqBqKCwthfBixyxMjOFD4TMJHQq?=
 =?us-ascii?Q?s2G4Ae6iaHc9H4CjKBk87NMH/XaOZwK3gFXl6fkum/HZITGffaKRfv8M4ES9?=
 =?us-ascii?Q?fx8gDCg5rXvBuocNhS+13TGHnqEOR3aOd4oCtXlhGkQlBN3zuFSf/VIY9viN?=
 =?us-ascii?Q?W9eIbgOaL6tWBbaqy+x9JhBE1nZKvLD8B89wS50UxB6H8w8YlVeMRE5qZ3L+?=
 =?us-ascii?Q?TFpTC84rV+QqCJbm9ZWzsogXYvcZV/OCjjDg9uAsTCb5BXx8CX2IeWjoHA0g?=
 =?us-ascii?Q?tmvkXqDJ53m71HoFT1gZ0bDgIP20DEvMckzLu6vmecB8EWHhM1pdyCiPC5BD?=
 =?us-ascii?Q?KyX8DLZIZm0HaJqn3M4WreG9Y/LZHnuxfAcXoi3ZpYFMGM0a9NAUfv65Iwux?=
 =?us-ascii?Q?DRijyEB88hnHZh9SdrpsrtEVNKOdBukAGwXAfNEwVCbt74EBHtkTrj9TPYZP?=
 =?us-ascii?Q?DGqJGaM8rOMEdex0OLw67xPdMTsP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X3wMD36nI4oaCE/2Tfajt7mN5vpmugzy9yPeJUwEgugTTlTmrGK6Dw0B5Tln?=
 =?us-ascii?Q?0equD5KDkY/P/7T/A5jpXapiWQkDqxLejC+EWK/abl+TU63NwSnFCMJ4Y3Ml?=
 =?us-ascii?Q?b6Axoq3G3NERERub3/3VfLdkCKYDsAITBydqHScaQWnTWJAvMKjbyA+kgXiA?=
 =?us-ascii?Q?Kqs8Bo3Uf19GV5TazjuujsyKQwtQ3cr4JHVzw2krWQH7tyZNvnc6B/CrFZZu?=
 =?us-ascii?Q?rrZr2rq1yDvfE+VDY7pDJzHeOMjpeT7GLE06nB7J1ats1QdkTnn5dVnzlTdE?=
 =?us-ascii?Q?DVN0j7gef7fS72EvySs/eYPFGzDo8LWr1nALahvvzvquyulm151E86qL7BMq?=
 =?us-ascii?Q?vCs/C9nFnDgGA5eWdpDQFRuuyAU4VNWjBveQwZS3xYrfoZN6AvWTiKrUWwru?=
 =?us-ascii?Q?gzlsq8if+C8DWwcSEhIBcGPwirQU0L6hqYO589VW3Jb9IJzn7z4/46GMQ3V6?=
 =?us-ascii?Q?rCchPyhhgDhB+6popvZJyWLUKN/aXu0067ZdWGVdIRFr/HeAZaTgHtZEUuT+?=
 =?us-ascii?Q?2RfCRWXfkCYt7RH/St0rYfnOR27xRfKUICU/gtVhmtycSBjuE7PvTpcSV0vg?=
 =?us-ascii?Q?jporhlegDqlOs8VA/4iIP+lEtaG+HkAf2cvttRByhZS94ZAOXlBoth82Myq5?=
 =?us-ascii?Q?i0AyDMtULJICwxVqGXqYGa+yshhNtJ10/P0nQS+FJ07e1taPayS+sVFf26hC?=
 =?us-ascii?Q?Rdd6dU5X/XPCzgrLxb32a8cAG19x4y1TArjarJbcDik8w4qS6HvvcsUGzP38?=
 =?us-ascii?Q?foUz9zlTKG0QKi2OW0QWWKcq0Bj61ngy78CdAybl9YuGT8X67N73Ss0hUIet?=
 =?us-ascii?Q?vDP1F5kpQtBAgrDZ7us84IZ3DK06ipJITs5A187GV6XRI/tFU+CA3Af009x2?=
 =?us-ascii?Q?dExTt66DusexYHw+h/Yfa6k0P6cz5Z8XEBt8Cot3hB2HxqHOrTYgWlnf5Az4?=
 =?us-ascii?Q?BhBp+ACqsmlz9Fly6dOT6BmoMd6FVawVDy37/snGpTCfKQMGMZMutL6gp+2O?=
 =?us-ascii?Q?i20F4lgjEzWRx7bSzhIfx2EbjiN3VUCulbwLMxotNATzjMfBmtuNK+g6vUzi?=
 =?us-ascii?Q?wb+PaBPo0/NFRrEvyt2KPJQY6mgSUvvtpgn/QPZm0JUALWo8Vnm7xNro5pKx?=
 =?us-ascii?Q?kamK5ihWz3Oz/66BJtBz5/KkVQUx4RSHcQQ7/nLzwRMr2JuIPVv58escIaBe?=
 =?us-ascii?Q?pM0D3+CADRdkhTnxbWfyj98d/Md38ot1ULy+4sUntF6z0obQ8diYSpz2nW03?=
 =?us-ascii?Q?ETQmODFyUHgebyMk8/U7eAe8eOx6QWpiiWXPyDiZ7gerYE19kFUkZCLbpXOn?=
 =?us-ascii?Q?Q1M9tfrMS5NhTv5l6fzm4K9Vuahmj8Xd01CDVP92SYJmWO+6tIszfQWjHXfM?=
 =?us-ascii?Q?FDLW/41BEhu9MczS62po3t/q+9eIvHfTF/lgpBYfyVHgH425ArN5VUvtPUSt?=
 =?us-ascii?Q?LH3zH4tBlPK2QE4jL43a8kaf168QhnxBrutU4hSAYY3kfrc7bRPA9aN2egVK?=
 =?us-ascii?Q?SfWvQp0rxMadOfuCsXCP801egurISnXR9AJ327aFiKWpQVPVRTSOnVJw6eIe?=
 =?us-ascii?Q?quS1UIyhtP+ieNd/DfTJ1acR+ORH9WBpg1uw3S1e?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XST5PC7tYm+ckgmWYvx1cp26+sarGRx1/GJ2ljxkxyq9PsEa6rzVa8QeweEFRQzHNckeH+t5PlvFgxfoDjf4rUE03VakGCL9rWzS4TYpL4t8KZNb0nr9QK6OuGNrk4YgegrjEFAFD++PYyDHDs6HHjELdBNQSZLUaZiY1lVL1I9rWRdoVxBS/v7Q5hM1HyxOvmzpfSEhx5muvem6A3PsThlv5E9v8RfaeE+o7hmHgAIiGNvSOzYz1nH6FYE5J48RJfaqxm9CCOsoBrgRagdfy4rp2Sd3lEnlGNlUBNvLEKwwnQDTlzYctYhEp6+DLNbEB9wte7cH6hiwvaBP831kTC09xFGqmW+Iz3qSS4+VFiaIcu18a+sumfg6o4FBioCh748I/zYyK8HyjYK0bk5HT2sxG9wNgy0NBq7Q3v552EhCvhr9K0cCS8VSSXEVCjhbv+ms74XoGByJlfcO6EEHRpJw/mnSj0GV8WPUsB01Ykkckj3ni8tvtFIhBvmPpqkLM0uucM3ubiayca8M+mHoCc/MG4Gnz+bOkXzO6SP6ZMSJ1e3joSoLsWTsxZaG+4y3rx3EORCeIBDA7CPcUOcuT63vs+HmXBYl6aPHrvYXRkA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b0d85f1-0aa5-4f44-c35e-08dd52b3a485
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 20:09:27.0713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffgTyBJfGRvxZuIjUQptW6QzcMEBpv+RuA6y5Eyss7GbZUd9jpe/35khV1VLcHLob79YjcnuXx987b7uoxquAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6490
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_07,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502100000
 definitions=main-2502210138
X-Proofpoint-ORIG-GUID: Lhs7DOl7QwruNd62mIjZqYXZ-FK2sOMp
X-Proofpoint-GUID: Lhs7DOl7QwruNd62mIjZqYXZ-FK2sOMp

From: Eugene Loh <eugene.loh@oracle.com>

We might as well get this code right, even if this "fix" is
arguably irrelevant for two reasons:

*)  The offset just so happens to be -96 before and after the
    change anyhow, just by coincidence.

*)  The fix is on a code path that is not currently in use.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 libdtrace/dt_cg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
index 846f0fe2e..cc64a3a13 100644
--- a/libdtrace/dt_cg.c
+++ b/libdtrace/dt_cg.c
@@ -594,11 +594,11 @@ dt_cg_tramp_copy_pc_from_regs(dt_pcb_t *pcb)
 		/* test just a single byte */
 		emit(dlp,  BPF_MOV_IMM(BPF_REG_2, 1));
 
-		/* safe to write to FP+DT_STK_SP_BASE, which becomes the clause stack */
+		/* write to scratch space */
 		emit(dlp,  BPF_MOV_REG(BPF_REG_1, BPF_REG_FP));
-		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_STK_SP_BASE));
+		emit(dlp,  BPF_ALU64_IMM(BPF_ADD, BPF_REG_1, DT_TRAMP_SP_SLOT(0)));
 
-		/* bpf_probe_read_kernel(%fp + DT_STK_SP, 1, PC) */
+		/* bpf_probe_read_kernel(%fp + DT_TRAMP_SP_SLOT(0), 1, PC) */
 		dt_regset_xalloc(drp, BPF_REG_0);
 		emit(dlp,  BPF_CALL_HELPER(BPF_FUNC_probe_read_kernel));
 
-- 
2.43.5

