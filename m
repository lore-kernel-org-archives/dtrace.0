Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF94221CA00
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760648210; cv=fail; b=KOdJWiA0ww381IitnBZjnOhoDFKkOTqceKVKNq+g7UDhvzymLXXnMla/uNNnouN1/KvGyYCB+ix4MVReaKM6PiiK7lFtvpmzXdGq/ZDRTmE6BJJXmol2/eJvUCXGXFsUi4CZ4CgwLthymis3/5rC4GABqLvE1m5rT4kJdiZdO7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760648210; c=relaxed/simple;
	bh=91EBnh9FDCYYwgC0qJ1FaYj/+kXqVQw3WFOge6JAzwY=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UDHmjrt3WiBvxOy27RjMSK2PihLp77EF8Ds3cO1ZLsHGDqBPZdlZ9KTTmGTKdbkOva4qRDSHBj8//BiqkjFPQpMlYmDsMwQWR1G9nXUlyqQzP+hU5cm401l+kxALT4rfkLBOSudXNpwxZDo3dqjb8AP52uxH/wRM+OxP+mGt24M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MXgD+hQ1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eoqHTaqT; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MXgD+hQ1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eoqHTaqT"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GH6cHY022426
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 20:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=R5HhyAJO6bwvYvvX/EvHK5adlguFYpyKioZERS3316U=; b=
	MXgD+hQ1DkC6ufBX/BDh+fTgxWnjoJdSrpKHcLhMXh1kYy2/qcNb39wkNbLQsX70
	Rt4ej8sknSEjbTDZN/HqChbVSbFp+NU7JjDE+GDSbjvpqQmVlqf5L2RjsHrakv0g
	mYH0MB/M3hSFNDTWNeziJEPXzTMD4J/I610mkoGRmnxd5TcfrbhTbz3tjXXnddrG
	OqfocE2l4anRQCWlGIufE8hTaQqFd7l/7W8VeU9/2BNKC0gfQFkiJRD8z0jPOmey
	FQr2Sox+PkwfYVJBxx51dZZdXIJ3jRiv4gdL3M5xR6hi/p2jgv8+Vv6H1wOIjKht
	SrAUbpYknDgCkbtWB1QgJQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qf9c1v92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 20:56:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59GJI47X002383
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 20:56:46 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013065.outbound.protection.outlook.com [40.93.196.65])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpj73n7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 16 Oct 2025 20:56:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L6oGa30/ZlqUboCJHftU0Ciqmlpmar9rNavFY+PnUHXzITr5sU/awuyyEjOGzYm1jjZT9B4xvlzOXB8d8Ra+bys2C3WpMPYv10ZV0Ld0fcoXNa0zkNFDL+ADv1zW6U+SClWI0kAvHqB/HGZBGyAi4ya6HH7t0v/NDGA//0IYZHEv/XarRwvJBLu0FH6xWCGTU5PsUSf3xFtRge9/wQq5YVHUV9qwho3KZP2xG2CZuPeV9kK18GizN89Y0AaXjHnvr5AcptJVXS1Oxx90PiVfw6n4l5Ydv8xNMRWQJdAep5aaxH/Ax8nrNCfxko9beXNT7E6prvcPNlgO/XqALUnPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5HhyAJO6bwvYvvX/EvHK5adlguFYpyKioZERS3316U=;
 b=UnccU1MEvTIKFbnCgnVFnCFNDCslB7Lv4ByaFEJoEGfL8dXl2PrfF0E2s29MXeiODO7atlHUNm31sUA9SB9sE/umfLjaEi/a+C+l+/v7wowMre2UCxw8e5i/ufvGPkUvVsSZWlP2FLXTcXwkjh9kswY59KHh+F90KzQuj1VCXvurvVFi1fUBGBBbaT4NyrwG/wLwWjCPVavzg8arZ1tAP3ZtZGRkRAWfbryR/o+SYBbq9ss4NOQfKy+Os/ypw65dVdHFmAjHrp0WLVLg17HxVnqr0Qrc/CLz2wJV5QjNXn12zIHvE2ptcL6/zNPx2Ah15IJU/muqNYG5ygbvoPfYrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5HhyAJO6bwvYvvX/EvHK5adlguFYpyKioZERS3316U=;
 b=eoqHTaqTjkGbI5U+w6e4OhTulzkIoP469sDbPwYXpZ5z+UwVbvoYc80XoKIuWMa3Cad4ctIhKd9vJSW7PRzhce4gjuB5nlddFfZXa54jWbFlFNvpRwBR/hkYG+nnHIkJ3ZN2j+uncVLwgmz5OlZovwTAauMXp4ZwgbHTCGu8ltE=
Received: from CO6PR10MB5636.namprd10.prod.outlook.com (2603:10b6:303:14b::20)
 by DS0PR10MB7091.namprd10.prod.outlook.com (2603:10b6:8:14d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 20:56:43 +0000
Received: from CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b]) by CO6PR10MB5636.namprd10.prod.outlook.com
 ([fe80::c47b:6cdc:87b1:aa6b%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 20:56:43 +0000
From: eugene.loh@oracle.com
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] test: Clean up stack_fbt test
Date: Thu, 16 Oct 2025 16:56:41 -0400
Message-Id: <20251016205641.15446-1-eugene.loh@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0246.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::11) To CO6PR10MB5636.namprd10.prod.outlook.com
 (2603:10b6:303:14b::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5636:EE_|DS0PR10MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b210254-9c37-4197-1c53-08de0cf68314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TYYrWlLEQe3djfelCy7ayFTdcdvpHM434mkwa7qmI8WjW5eWLdDPUout2T+j?=
 =?us-ascii?Q?9hs139T/+4gavlkNtaTBOtrtxw08DkesaqaAHelEKsXCyxcuvHGtUEqUXWKx?=
 =?us-ascii?Q?pZ1t9V86VDyl04jc+XYQZZO6GHx4cdiWPc/F4ywsxzM8TEQ5d2P2pAArHJnN?=
 =?us-ascii?Q?H2bRblVDTzAj+P6UPL1FtgcLPBPp10c1HtR++g6vyvl8fnrBFWkdnsYsbrQ+?=
 =?us-ascii?Q?+4EDl2qhsv1mKS2UH5imqke6bSaT4JjQUi6D6QuD+dBqe9SKBcN602ASauwk?=
 =?us-ascii?Q?mQ4Mw+PST8r8hIkRQDrNR7jDl4m1UIcmQ6BrGPZGBbC1TgiVRG9e8n8oJSi+?=
 =?us-ascii?Q?G4L/8Yl0ajU0i2LX2sLbTVbMCf+4Z/XgSOO6CxO+nUbBK9XIVKsWRnbVbGTA?=
 =?us-ascii?Q?OZPwocyv2qliUiRmjaA8FH7NkHocr6huO3cS/xWyw7QPHiTZx8gbVRfekS72?=
 =?us-ascii?Q?yN3VcXKqBh/rYBUUAZTucETXDBqQ++/oJt0QlURDV6YUfsfMpqNfzaLC7Rgk?=
 =?us-ascii?Q?jxHc1yLKxIq8MWv8piDApRXX4Nu6vPIWgJBGfQJj//3xr4I5f/ZFwMObxdfM?=
 =?us-ascii?Q?X2TkbNVx4aSBF7EwbW93MrzGI/Q2zkPdw8LfkbRWRR6i8aa/dzG0x+9L0Z4j?=
 =?us-ascii?Q?WH3QSe6fZE8y1ctJ84YYr91AG09njcTWuOXrMBI2WPYm5eHO/j7fVdmcHcJe?=
 =?us-ascii?Q?6lvrz4TkYbl/jOD3YDA0FKTvhbefzdwC5yH2rZwAt5Eu4TD5G5UCkJTK/V+7?=
 =?us-ascii?Q?RxS9CPwXD06HVwphE7rm4so8xlCAC6aC9yLhEW+Uwtu5O2e3WtlQTs9RQFbj?=
 =?us-ascii?Q?rlcUQ24UlmdxntAEChK7jngsEFccKmqwSsp/S6aNctR2GtnYc/W4tD0dxkZU?=
 =?us-ascii?Q?n2M0o3KcZekSDeEtntftlU0YWjUNp7CQMhZ+qT3278X2raKe9wM0cZ2DNX6i?=
 =?us-ascii?Q?vDKY3B/Awa11E0FK0zbJah4qpWJGCXxbhJz3fXt1NdyljApUEVOEnPyC0AJE?=
 =?us-ascii?Q?IORwkGaHrI1UAck8q0GaNYqy2e836VJXWnp75H9UdEFzsO8+wXFkgDYWXCvr?=
 =?us-ascii?Q?Jl42ua9hNR0Ytz4Bd71stqmnDbitHGeBp0bg/EEoSZkTTssiqPBSn0k66O7v?=
 =?us-ascii?Q?oAfCqdNM0ucNPaLMb6kILKncycXZ+1BxSINPPqKfXVs0viK382lmy76iQ6Cw?=
 =?us-ascii?Q?KrVcKjfRznJZNzVOcaWdtm2D+ydqLaGgEIoFg1A9qs7PNpnFIqEgQTDj9ija?=
 =?us-ascii?Q?FdnKAPmTSzif+Pev/1SY0cSFVlPXopFLGvw1JY9iJ2sSCuX2qq5sWXnTSFrM?=
 =?us-ascii?Q?nEWRz5mEG70aZ5hj6bpdthKlkiefy5INLIE5hUOryZiT7gSkOXZ5Sdh+IGYP?=
 =?us-ascii?Q?iZOBbEPcw+f99Iyz9EfwFlnbKZx/rWOut1LlKbhP8LNwQWMUskgxH5xhoLr8?=
 =?us-ascii?Q?YUIpXXH57jfLDI6YPqBRpW98GyHq7k20lk/kZwWL7DhfcuMT2mMeiQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5636.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zzc/luVAi1piRDFR9RvHTm4XZEkUoeiVV3u+9Sjhsy8QtuMHZmylLYMsIRE5?=
 =?us-ascii?Q?tm7sIhnGA1TpWqG5x5CATnmkMI+nuubAU3R6u0oEBFKllaTJPXQEb4w6F5sc?=
 =?us-ascii?Q?M0TO4M14aRIyYEQ5eg0ikR4NLbnXWqCMvwO80eN7kFpQ4Bi0T747yngtD3d+?=
 =?us-ascii?Q?EzZW6pu5M7a+iKvuC4no3g/jQjxNhQvHDy66i1HHIhGzxBznDzeBZ7Ooa9un?=
 =?us-ascii?Q?hYaUZzFU6mhO7Z7Ud7fxI0FIakovP2HcwH3bG+1C6AkttRWzUe+YVk/N2pKC?=
 =?us-ascii?Q?TtZ3A3jspHj8gVAx5UTz9RzgAg71f9hkqmdVHHqMJjvJImFBwWkTrdB0RQuH?=
 =?us-ascii?Q?CPBG6T4g56ni+YpFVYHc9KCe4CSyQ8a3F8zaqetJZizbdMHfT5qTvXafuGrw?=
 =?us-ascii?Q?h1d612iOVnjKpP8x35+vRIrZatPOL1ihQILhymdtGfVuQo3CqUkmtwTOerfe?=
 =?us-ascii?Q?kXqP4eQj9l8RLpEqVSrFxVUcbQzLOZmjk62PV/GQmIMeHCV9TtyswdbQUxEm?=
 =?us-ascii?Q?WcbLjubnycuuUMbCAFYI1jYyYghq5uKWSkczREMNEt430DYdyFa0/F7EdGB3?=
 =?us-ascii?Q?5kcKYPPSVCtmoiwmhkAiQuvShZOMszHXN+8Aey469zm3HgEy0nqc/xT8T9+1?=
 =?us-ascii?Q?5R3WAwHWGSQoCn1CrQqo+xC+5sgBimEybmLQsKjG9uLQjntAG3/lb5sV19uB?=
 =?us-ascii?Q?7RdZwNO26rlN7ZMEUY49ZOGH8tcoM0GqFs4W8CbuPiVSsJa+3aMacPewhDIo?=
 =?us-ascii?Q?ro8U3Wv7CNaxK1hiLXWayzHaNkZlSplGQNv1mDPklJYlKR4t36ay5NTGzKE4?=
 =?us-ascii?Q?ascWGKpi3eLZ/Vt0HTMitMDbXoqcRsr2oOomozl3R+FfznY8wLGMcSTy7sWF?=
 =?us-ascii?Q?nmwndQ7IjVM2+Pqm+ekoScSPDdHiUduQ5kQi0RRc1AtODRqp90iXUnRgPw9f?=
 =?us-ascii?Q?Nq28WaLAXpJH6g8DbcVXD8WQPyZa5guZGJSiYbznOp80mFclpZdy3AdRnO+1?=
 =?us-ascii?Q?h8KRJdFXb/0QH8Dy2K1Fa9MF167B9CrZzBHtUSFgtvmtNtCW0MDdWl5DJPCa?=
 =?us-ascii?Q?JlD++FMNxFT19DyDHsAJsDtlN7Xi9yMt7YFLSwFH4J8qPUajnbyYXZi6SYRT?=
 =?us-ascii?Q?Er6gj39aeMUKrzzUyGAXOj4TRYnSQEovIRSl8xkY+9+lIsbvjB7fJnPcGgN9?=
 =?us-ascii?Q?Sr+hdCk407keFb87iSqLiSlTB2qOLfmJHrNgYOBEOINIdDKo/h+AaAj+IW3W?=
 =?us-ascii?Q?RiMGgLdIPi2yPqqMQIBZq3G2Z3k+LU0V4rmFh9ljdFA+ZHw+3mLVFgGg/8sS?=
 =?us-ascii?Q?s2oneUXt/z/qN79UnLGbEdlkSyLgoYIju8Pk52K+L7qerq8wcaI+FRqgVYo2?=
 =?us-ascii?Q?bvHeT1HyF67++rhDkesgkCz1jtPI25RvMn8q8vJI6VSf3k5aVdGE6XzepexV?=
 =?us-ascii?Q?3NG7IU2z8S8fFoJM/oeHKW9Z1uyL2gtzVhu94piVq8agrlPpPgM3M0YlUk1Y?=
 =?us-ascii?Q?cqPUlTaIu/MuEUCL2O90eHk24ph/tML3xwYxNCMpvWXEZC9qsLhQe0KK9Wli?=
 =?us-ascii?Q?yW2SRwD5nlVxgiGycdJrYnofqlm9BdM1mxa3AMgS?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	d9f9ypiedNpFJOaNejfvcc+qBhhFhlDyVOIdx6BaD0f+DEMRPO7s/xijjVKKgbL5O8/b1kZCbb+ELGR1m9nun21Z5nQv2hjFTsRTp3vX3zS3V8xKFRb3rB31aEteQod3WHvsi0dLjszwnCL3ehYpffrwXDtI1YiolHdHInJOxqpfBSfhoozE6IakTKLJr4UO/55qrBvG8bZVgiWtrgNWq2+VrObPsFvQW00I0fT1hRGNXP6qKqmFEbHNRXmWgLCHmXM2Rn6eW+AjcZmFBkSjNktrfvekDxchrTTbH24T4IaADqPFgp85DHiSow+LZn/m35KUaL6GIfBn2qTWSlguL1DHCWUiOEqblf9ICJiemmb9pHxyrqNem3INL2RZ6j22yU7u7YRmuQeHfmoxW3EcC+GZES/PICjd77PuxwjbOFmffVOQUMs2vjQPAplEBeFDDmAmMxBH+qfJmo7HF1E3CCbXz/VBWve9shEaw2s299ijaE7uAVzD/RDGtrwEXU2q/4QooRsuvWcmhqoqRzla0U00FeuxuhphRKKqQkzn3oWXLt5frAmsfagrDQfi781WqZvqSU1NLpt1dYTIiE9vPgS7YE/Sa9SmWkTf+pv5nOQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b210254-9c37-4197-1c53-08de0cf68314
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5636.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 20:56:43.5804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhYjeKXNg14GRheRksXQ4qtgTy/nL3Ysh8AFuBleMwVaoich/wVt0ZCAH8XGavblQ38PjvIOqHYsg9JRlw8bGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7091
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510160155
X-Proofpoint-GUID: pPScMEOTrQy9OVyw2u4MsxZtSvAfZ--j
X-Proofpoint-ORIG-GUID: pPScMEOTrQy9OVyw2u4MsxZtSvAfZ--j
X-Authority-Analysis: v=2.4 cv=QfNrf8bv c=1 sm=1 tr=0 ts=68f15c0f b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=dN9T9bWM2NsE9ECMWdEA:9 cc=ntf awl=host:12092
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfX6XsjnTl0xTbx
 NUZa3pD9x0ThdYDpXssMPAc9Ovh9+PBbOVviP5OYrOJtiA6zZJM6gR8GzvybOrNFL3PU+FjHOO1
 HZemq9sjENahfCiC76rn9CCMzu21Phz7eOgRvj4jspXnTQrTv3P1+0GST2B/hz8OO59IX13BzHX
 NrkqkqhTsUUZFP+hEnvAorTdVjK04Q9dkPof7VLI8jUzTIjISkMVge1jYtYjcRuc3VHa+4KDgZT
 TttULN9XsdL4i6BuGL8qtawXpbcq4HGOaozXOw3G5hsCLiHQPgpUUkTQrv3nl44iLKW/yC1/VnQ
 8JZyN+BT/QjgjosrHjAr9lx1qLYFRcOtJnzW3SMg+AFPOzgu3Dt1r5nhMYB0OdPMn73M4MCiUMI
 eYcSpuy4iHr78XeK6DHqd101vuGJ3kzXRLr6R5omL9IQx0bk3D8=

From: Eugene Loh <eugene.loh@oracle.com>

The idea behind the test is to check the stack() output for some fbt
probe for specific expected frames.  An attempt was made to specify the
exact stack that was expected, but there are too many variations among
kernel versions and so maintaining the test was difficult.  Loosen the
test to check for only a few expected frames.

The test was also checking that stack()'s first 3 frames matched
stack(3), but such a test is already provided by, for example,
    test/unittest/printf/tst.stack.d
    test/unittest/stack/tst.stack.d
So, drop the stack(3) stuff.

Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
---
 test/unittest/stack/tst.stack_fbt.r  |  1 +
 test/unittest/stack/tst.stack_fbt.sh | 89 +++++++---------------------
 2 files changed, 23 insertions(+), 67 deletions(-)
 create mode 100644 test/unittest/stack/tst.stack_fbt.r

diff --git a/test/unittest/stack/tst.stack_fbt.r b/test/unittest/stack/tst.stack_fbt.r
new file mode 100644
index 000000000..2e9ba477f
--- /dev/null
+++ b/test/unittest/stack/tst.stack_fbt.r
@@ -0,0 +1 @@
+success
diff --git a/test/unittest/stack/tst.stack_fbt.sh b/test/unittest/stack/tst.stack_fbt.sh
index 15b85be13..f3d321e7f 100755
--- a/test/unittest/stack/tst.stack_fbt.sh
+++ b/test/unittest/stack/tst.stack_fbt.sh
@@ -5,7 +5,7 @@
 # Licensed under the Universal Permissive License v 1.0 as shown at
 # http://oss.oracle.com/licenses/upl.
 #
-# Test the stack action with default stack depth and depth 3.
+# Check the stack action for expected frames.
 
 dtrace=$1
 
@@ -26,8 +26,6 @@ BEGIN
 fbt::vfs_write:entry
 {
 	stack();
-	printf("first 3 frames\n");
-	stack(3);
 	exit(0);
 }' >& dtrace.out
 
@@ -37,17 +35,16 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
-# Strip out
-# - blank lines
-# - "constprop"
-# - "isra"
+# Ignore blank lines and strip out
+# - ".constprop.[0-9]"
 # - "_after_hwframe"    (x86 starting with UEK8)
-# - pointer values
+# - "+0x[0-9a-f]*$"
+# - leading spaces
 
 awk 'NF != 0 { sub("\\.constprop\\.[0-9]", "");
-               sub("\\.isra\\.[0-9]", "");
                sub("_after_hwframe\\+", "+");
-               sub(/+0x[0-9a-f]*$/, "+{ptr}");
+               sub(/+0x[0-9a-f]*$/, "");
+               sub(/^ */, "");
                print }' dtrace.out > dtrace.post
 if [ $? -ne 0 ]; then
 	echo ERROR: awk failed
@@ -55,77 +52,35 @@ if [ $? -ne 0 ]; then
 	exit 1
 fi
 
-# Figure out what stack to expect.
+# Identify, in order, a few frames we expect to see.
 
-read MAJOR MINOR <<< `uname -r | grep -Eo '^[0-9]+\.[0-9]+' | tr '.' ' '`
-
-if [ $MAJOR -eq 5 -a $MINOR -lt 8 ]; then
-	# up to 5.8
-	KERVER="A"
-else
-	# starting at 5.8
-	KERVER="B"
-fi
-
-if [ $(uname -m) == "x86_64" -a $KERVER == "A" ]; then
-cat << EOF > dtrace.cmp
-              vmlinux\`vfs_write+{ptr}
-              vmlinux\`__x64_sys_write+{ptr}
-              vmlinux\`x64_sys_call+{ptr}
-              vmlinux\`do_syscall_64+{ptr}
-              vmlinux\`entry_SYSCALL_64+{ptr}
-EOF
-elif [ $(uname -m) == "aarch64" -a $KERVER == "A" ]; then
-cat << EOF > dtrace.cmp
-              vmlinux\`vfs_write
-              vmlinux\`__arm64_sys_write+{ptr}
-              vmlinux\`el0_svc_common+{ptr}
-              vmlinux\`el0_svc_handler+{ptr}
-              vmlinux\`el0_svc+{ptr}
-EOF
-elif [ $(uname -m) == "x86_64" -a $KERVER == "B" ]; then
-cat << EOF > dtrace.cmp
-              vmlinux\`vfs_write+{ptr}
-              vmlinux\`ksys_write+{ptr}
-              vmlinux\`do_syscall_64+{ptr}
-              vmlinux\`entry_SYSCALL_64+{ptr}
-EOF
-elif [ $(uname -m) == "aarch64" -a $KERVER == "B" ]; then
-cat << EOF > dtrace.cmp
-              vmlinux\`vfs_write
-              vmlinux\`__arm64_sys_write+{ptr}
-              vmlinux\`invoke_syscall+{ptr}
-              vmlinux\`el0_svc_common+{ptr}
-              vmlinux\`do_el0_svc+{ptr}
-              vmlinux\`el0_svc+{ptr}
-              vmlinux\`el0t_64_sync_handler+{ptr}
-              vmlinux\`el0t_64_sync+{ptr}
-EOF
+if [ $(uname -m) == "x86_64" ]; then
+	frames="vfs_write do_syscall_64 entry_SYSCALL_64"
+elif [ $(uname -m) == "aarch64" ]; then
+	frames="vfs_write __arm64_sys_write el0_svc_common el0_svc"
 else
 	echo ERROR: unrecognized platform
 	uname -r
 	uname -m
 	exit 1
 fi
-
-# Add the first 3 frames a second time.
-
-head -3 dtrace.cmp > dtrace.tmp
-echo first 3 frames >> dtrace.cmp
-cat dtrace.tmp >> dtrace.cmp
+for frame in $frames; do
+	echo 'vmlinux`'$frame >> dtrace.cmp
+done
 
 # Compare results.
 
-if ! diff -q dtrace.cmp dtrace.post; then
-	echo ERROR: results do not match
-	diff dtrace.cmp dtrace.post
-	echo "==== expect"
+diff dtrace.cmp dtrace.post | grep '^<' > missing.frames
+if [ `cat missing.frames | wc -l` -ne 0 ]; then
+	echo ERROR: missing some expected frames
+	echo === expected frames include:
 	cat dtrace.cmp
-	echo "==== actual"
+	echo === actual frames are:
 	cat dtrace.out
+	echo === missing expected frames:
+	cat missing.frames
 	exit 1
 fi
 
 echo success
-
 exit 0
-- 
2.47.3

