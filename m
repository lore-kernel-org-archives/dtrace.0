Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CB578C9D
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 21:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719611743; cv=fail; b=hnkKn5iWqdrWaZdA39cWCklMof86BEeKKzDPVETZouvZsOhCkv4bZWfeC217vBbS/PZ4DS11B6peI0CyuQu2hvwDtQD0gLcuEj/yctfuQJHY1+4xE6sSwl94UIXEOJ8wAItgczcM3SS4Ghrph9bzPq5QnyWUErnw7wz4E3f0YVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719611743; c=relaxed/simple;
	bh=CvLm/rrdRbGR6nTJWtgz0Zk9fvd7mfWZmpZZcpWpaVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nRvibFwSQZ1To7j0hZ9LLophzjHUBfUJAVuTyl/5bepnJ9KrLtkB9HHlmwPbXISnyoKiSIVXqMM8TE5jkbEe+6+9+r/bhIaE7Ya2ntoaUE0OAOAmUwbip8HQ9daBDkOOqO6ZD85pmJn2FmUzgQUycAiKvZE9If3Qis76kflIYKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Xd0K3qgQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SZLHfqhb; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Xd0K3qgQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SZLHfqhb"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SLMYFB013173
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 21:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=HvIKZYNWLw5gd4X
	l5jAeVzCq6X7L9ww0hwUzzGRq0bQ=; b=Xd0K3qgQIsyRQYCdoCTUSDybn9q1ANA
	5UuzlkSmxHByaqGWHzWBULr7xV8dDiWX/fq8aft4pXBjVudqrsfzCTy07zbh7viv
	Jx88knUui0v4opRZQMnf4dG0xW7IXq61/DvsSwN0NimmcSMVwqyH9N4JQEjTj21H
	gzTNCopInBr1lDgUF3VP0LC9fX93fIteKS5QhFE3y/PYIfwF95Kg/+pKI/bBAJIh
	aG5mVrEDABUpGXzJWkT/9whSQCSdipA4rA6x/mDNJ2+P94VeTWAHHU4KgZUFjpi5
	4EuE2DlGgocAIi2hWwDXiH/hYM+O9Avp2NhK3jMpWSb8ANJ7l3pWNiA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ywn1d8v0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 21:55:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 45SKVqog001489
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 21:55:38 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ywn2cyuf7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 28 Jun 2024 21:55:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XR9gfyKDk888VgO/IAWIzBNn85FMHriBnbhlxtVRkMfx01uMZtFl0d05VgyFvuP9/sJb6gL3BsyFweiq8JuHK9SaefKXHaYJ4cFXdkruxkJuaMXikCMzIcrvLkCiV1fGdzu60qEW4D/gRviHRHVYvu/ZNruQZjcnOlrRR/J9DaeaorNJOQFWytXDvE9VWq/JBIlxtoJuQg6OBGslGGSmLT3gQ5+70/HH7ZkhQpD5qd2J09VyLGFPibGh8RPnhmoUzLeJ8wvZiH1ubswdJiAnLg7KMMJf08V4FXhiN1fGwd9MSqpJLNNRKauKpnEgpLnAwSf5++KchgH2YO1yrJdzAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvIKZYNWLw5gd4Xl5jAeVzCq6X7L9ww0hwUzzGRq0bQ=;
 b=acqEzfBIbDg8AHcJsLQImnQcxUoE7Zed+L15+P4Xw2v7lk2z+4XmQjWTSyc/QjeJbByIqLYPtWyrKp3Yg66iWZH5cxC60J1JXkiZbjAWu67rL0paFDZUvlnX2jTaqjKKtBMjZAoSexbUZzvpB3lCXwz4ZQQBDFo8w+3w+2M1Cs+ygPJI+8vo/pjDNKOdMN/GFaaqoFb4r3M8fl9pPBT613A60fozbb4HVgX282nPlCSPhKB3IzlisXJVAi46r1qdCQfwKowVaLzVhP5f8Cf7KegiAJs+TugQA/MOmD6lzjhObw+XatupupaGvBXCthuGmgMa1AvN19BUpDxYldhDjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvIKZYNWLw5gd4Xl5jAeVzCq6X7L9ww0hwUzzGRq0bQ=;
 b=SZLHfqhb3tzwRE1i5alFnKTFYX/NcQeJfgjafyhrXXDRdFItqiUCNHkDUJZDAY3Jmi1CVbmb0sJhfED0JPFnUCApi4JhnTseXyVoiA7DJ2UOfPfGIzwOav1PDfdtqGkdJNH3KyshJ3YDCYJZxUJZRIudh85nb+3yoUuqzZkA7PM=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DS0PR10MB6800.namprd10.prod.outlook.com (2603:10b6:8:13b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 21:55:36 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 21:55:35 +0000
Date: Fri, 28 Jun 2024 17:55:33 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v3 1/2] print() action: identify ctf object used for print
Message-ID: <Zn8xVd+r8SzmLGH9@oracle.com>
References: <20240426133327.578092-1-alan.maguire@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426133327.578092-1-alan.maguire@oracle.com>
X-ClientProxiedBy: BL1P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::25) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DS0PR10MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: e09a6c16-3af2-4630-4443-08dc97bd0a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?queSd/g5fjEs3pWl/12Q4GCZ4Um8OXGao4y7SRQJDtb/nyPS9AM44+WnNId4?=
 =?us-ascii?Q?Sd6i0pbeXpalhEUAkodQlWgD2oSDIZhZSd94Dq4qzU6DJpmz7MsaiZJqOHgK?=
 =?us-ascii?Q?OS7/8O2ZM+dNx1Gjfe2bFWvrNXGx637oLYzcBsojSdj70vK7X6pLKS76RBba?=
 =?us-ascii?Q?QcDloZwfZFObK6C19vURwuhReqcwjO5Mb38iXmjqBQ/muUSojX5JYmves4hM?=
 =?us-ascii?Q?9eSDoCuN6YHsZq6R9U7Brb3y8TVEfu9/s7eFQ0ks7/XJrV14YNktZNN8kSTB?=
 =?us-ascii?Q?brZSEqammfuEcBYgor0uLNA++KQc84+/CUbonse7doUGYeo27xbEdyuHtAin?=
 =?us-ascii?Q?hoEcqzaBNHK8Y/Z6MHprnGF+/Hqh5BF0xAQUBKREkxYIoMyhtT5MTSRgUQeI?=
 =?us-ascii?Q?mv0eTL7K1txQM4eYw8h1pFeqxuQHHpqsLqAuMyIlfdDgmW20Zxzh8Xc3yE1R?=
 =?us-ascii?Q?rPCva8tJdFvlvtIkrR0YWGFlxMCAuWNcPzNdFU3JVQAktffz/G6Nxd4CgqPH?=
 =?us-ascii?Q?zz8hH+7dRRY0bBwlKjwKgUFGBcVdlxPgl05YgaR+dO5xtmbIRpIV4cH2RqD9?=
 =?us-ascii?Q?Gx9JMEi1fP/Xr2AgxFB33V5gtzaoNs9NVWAZYzFc2HIXHKHsUSbp/fnOFjKp?=
 =?us-ascii?Q?ykE5HX6jbfyfUCG2d6a5rckJbvHW8y+Usahps1jIu3D7SYr3a0kZ6qbvCOTq?=
 =?us-ascii?Q?47quWghsdivnhukXHDufD1GL9ZSUFiP2+/hsEpRe0lUfXlRNucawChuY5pWn?=
 =?us-ascii?Q?bZ7JTNbpmhQwSA8pgzLqmr2/JDUZ+zh61ucrfBGHfomDgHKrTtpcZbi6t7k+?=
 =?us-ascii?Q?7lFk1bbcXnLNQAZzl5ddmAM9dCl0LrUk5OjnkcHKf2zXr+sgXKoVKxvxKqCM?=
 =?us-ascii?Q?x0wS/OkDwLPeFyPj81GE6pmdc8ZhL1kIPg1EqEc+8+55KI+6hK6MgtmPPbQO?=
 =?us-ascii?Q?qq4khYb/qlC9JN8hR5U0H548ttFzs0+XknqLft1jdfFBKWZfbzy5PM8dAuDj?=
 =?us-ascii?Q?Ap3OrhboG7uZNQyNgXCQdHg/tBB1W6K3R9lwGMyfLKMh0Hmqwz5eBAWuwo+P?=
 =?us-ascii?Q?pjTFqA8R1AhZyTl4OnRMHCBkwl3Z5gPeqL6NI907CDlUpSoBGJ90qKci9Go0?=
 =?us-ascii?Q?RZZxb6WrnGkjEepRtVs/4p3DnIz0FXYF0ZBr6StepKatz+kQ4Iss9v0jw9oW?=
 =?us-ascii?Q?MhU3YFdzW3aOXn+4gu3DQiL0TwoO3HfyTryFBh94tINPBSjjQvCGu+92rzp6?=
 =?us-ascii?Q?8WIgW0cXwhM1n0SN3uDS57tGs9g60BDmscRtXNEXGbSLnxzUBtlC610bczxt?=
 =?us-ascii?Q?hzJ1tmMk42l6jI9USjxAHvpJWxUHr1H0MbRUiKHK3Tsr8g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bvOu7BxpF9SwQ+aoFmOQudSgpPxHODM/HGY6NIn35urXJCUJIEfcikz8+dWn?=
 =?us-ascii?Q?ukDc5tewkQ29jBnVVjMjq4hLbFBUxfuoEkuf6RhIddGrdfXeVlRH1/TkdVxG?=
 =?us-ascii?Q?7OUmOt4F5l/wzNhzTNWAGEOBHl3E4Diayh8jH0k0q08tEnmB/BPgEAEF/1w3?=
 =?us-ascii?Q?ZtRlZnG69V0UqWQci+tOcmLFMc2bUB3e7+eNl/S0jhy5oDfbo/64cpI35kOD?=
 =?us-ascii?Q?twCqClKStXmpxofRYfyXOUK+jWOYqtDqF9EVr4d7K1JkwakmWowPmFre/g/i?=
 =?us-ascii?Q?kEzA3oPMSvNIX+PKj38bicOwCcoo6Z0vivq0SPQkoh+mFhA2qDPnyBosfxp/?=
 =?us-ascii?Q?GQqBlngpauKhrtZnFUw9JVAK5k0Hy+iWSg4blcy9nP36d18u3e95Pgt7ykOE?=
 =?us-ascii?Q?QXhbcV1I/lcW5Mq9pGHP+Az2E7v5SPqq+qMgcoOI4uUlDU+rtKNjpxk8IaOA?=
 =?us-ascii?Q?MoyAySymOUS9CgTExtYYuOAf6ngDlRatxIXlO68fdY8qNNJs1w5bcKL9in/X?=
 =?us-ascii?Q?k5hPAq/6Cp/E9jgvNlUQTdkordRHM2E7IbtzfGiS0lCXWx5spzlHwzP3Kfxc?=
 =?us-ascii?Q?mX92WHjyO1FDu9GOSHwEJjZ6i4jLYj04eX2dZd3BKm+kUS8aVr881drA6soV?=
 =?us-ascii?Q?ODZATtVB/lbmK/kMSE47ty1aYQVKYD6YYTmSOqELGb52MPTI+e/zf+t7VIvm?=
 =?us-ascii?Q?zT2W4ch0XnTyM+Yy5+G+qn5TWVFWqp08evO3dR4oPdKZ4nnrCeVCXdQJkCre?=
 =?us-ascii?Q?RK+iE1DdLUZjUtNrMS7KaOEgwzW5SGNR9XOndH4c6xzaLxEmoF6FKbQ3rx/P?=
 =?us-ascii?Q?pdXOqh2G1oFC8qBvP4X9m6p0WCXalYFkmDKa38mJgOF5shCBiXzdQU/pZ6ce?=
 =?us-ascii?Q?Q1AoDibL9aOowbIjyvg20T3rXnZFU6ecemlRdT3dMTFwymSrjDSr3qmmYDCc?=
 =?us-ascii?Q?2ZkTIygLi209m3FW2D6sxV8/KLS2JmWgme+uwUdO4sFxVPhucDhRH1MlrAau?=
 =?us-ascii?Q?nsj997mGkcry3o7bzvSCRslK/gn4Z+jsFu4qTX6PH4mg+gTso/CKxWTZB1R0?=
 =?us-ascii?Q?hXkUiUKcxcW8nZfbDVDQURhZYQGWgXMCVxXuMVzBKqEJ7E8sKKVUfDH5sVvs?=
 =?us-ascii?Q?vHuAwfar8QO/dsVAr5kf/c/TeLR543Nwe3gkKFZhmOQA6SBACRLCMD/qUedS?=
 =?us-ascii?Q?/YZA3i+NmdPLPtpcnZ1fspibdVkY7H4Cy+CZYer5eS/m5sHmDxMTwcduYlMD?=
 =?us-ascii?Q?oO2JqLJMMm6fbyVD5c5fA+CBiwyFGUu8jOdsvJK+zB0xo6SKU0FA+bLEFKFV?=
 =?us-ascii?Q?xkH419BkoWuMfAnwMfuf3b5tk+bEsNudoCvAWDNiahfTpBSeYga1dVTVtYag?=
 =?us-ascii?Q?u8gmVEVVH2JmIgh9hep9nTmZnO87IS52PkJsuJ4pk7zxSZSgcX/sk41/4X3C?=
 =?us-ascii?Q?DIDImHETUHXrqt9Hai5NlXOUj/6ylM6/UaHuRkMfogKCTtOLx+aVdcnZhuKW?=
 =?us-ascii?Q?WUVLmBM27laR5RR8IU/ZIV1jk+D6nagqOzg8bSTD4Iy5BLLH87GEcb6L9wWb?=
 =?us-ascii?Q?PH/cbDLz7Y2WoSritRzb8vowAHE7tq0bBG02NEj9WgR5lJepR9f1ABxQziAo?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	3OWH8Myve9N/reVcE2AQ13Mnk0yQNyroO48bltXutRNBX1IiSCGwtvLoPzaxjQ9vRriyrSL/vWx6REcJsLOdeztkzp1xiytYoiT2AIPm4kq6MCc5aoc2e6P5atWfzW6vuPK6NHR0OcaLLotsQLNUFP4V6CFh+ILdO8Fb5VvJxk1sjyewLCUUBtIbHK5CdySTQMPlzItC1avL2Nt0VOqKSgIZci55m4iwrgblGpDibZGyNa2CCUPPdgsFdBqaBcm85V/ErFz3BOK2YifFv66LY3fjb1UqLdrPSMiuZmyjOUK2aKEYXbM5qFtLJI3OnBriT9DeaJfObmw5yDtAwV7/RD0aVyRF4c03KhLuIM8XdO0goJoDRjyaA00YjPe/6nkcKStPhQBFH/p+7o+UzAPPJNvMKrJc+/MSGk2Vc3BdHHX1Ir2MaAskKSFmipCdFa6sOdYbtDXCnvK2W3DvF8hJsJ9KHMh75D6TP5yHBVdOwT9GOstUheySQ3IDZItiOvcdTJ8qeBzTgiIRsKos8wjeSloysxeeRbTxV7IdSfDEKG8OPIfr+v6M8lg1ilQb3LNRJYd6iFXX0PlOVTjYB35B5zM8dn5MGXc9jcJ6jPIP+N8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09a6c16-3af2-4630-4443-08dc97bd0a55
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 21:55:35.8944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYC6Ra4hknBTiEg3WPpNW212hIsPz9VW2Itxy5cgji9ZXnZs8CSjbRkIBwopEk2mPTWzihET1SomzgsA1VK4mBAdkCLGg4Iq85y4SaDCYJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6800
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_16,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406280165
X-Proofpoint-GUID: zj6AHvH1ytjJtzaThS80G0gY7XiFuvpG
X-Proofpoint-ORIG-GUID: zj6AHvH1ytjJtzaThS80G0gY7XiFuvpG

Looking at this again, I am wondering why we don't just add type info to the
data record?  Since we know the type of the data items being added to trace
records (and type is expressed as ctfp and type id), we might as well store
that in the record.  And that would make this entire situation pretty much a
non-issue because the record would already comtain all that we need to know
to consume it and print it.  No need to pass a module id.

If the issue is that modules could get unloaded and thereby some pointers
might become invalid, then perhaps the solution would be to always copy the
type to the D dict (I think that is the right one - I always mix C and D).
And since that one is always around, there would be no need to associate an
id with the module and pass that.

Perhaps doing such a copy is the best action here?  And we may need to look
at other cases where typed data from modules might be stored, and if there are
any others, they may also be subject to possible issues when modules are
unloaded and in that case would require a similar type copying action?

On Fri, Apr 26, 2024 at 02:33:26PM +0100, Alan Maguire wrote:
> when generating code for print() action we need to identify source
> of CTF; is it shared CTF, cdefs or ddefs or another module?
> Introduce a module id scheme where the module id can be stored
> at cg time for later retrieval at print time; this allows us
> to later look up the module and its associated CTF without relying
> on possibly freed pointers.
> 
> Under the hood, the id scheme uses a monotonic counter coupled
> with the hash of the modules name; the latter allows us to quickly
> look up the right bucket via dt_htab_find_hval().
> 
> This fixes an issue encountered when using a shared kernel type
> with alloca()ed memory; DTrace assumed the type was in ddefs
> and it wasn't so it wasn't displayed.  This change fixes that and
> all tests continue to pass.  Also tested that it works with
> kernel module-defined types now:
> 
> dtrace: description 'fbt::ieee80211_rx_napi:entry ' matched 1 probe
> CPU     ID                    FUNCTION:NAME
>   7 123161          ieee80211_rx_napi:entry 0xffff9f8980fa08e0 = *
>                                             (struct ieee80211_hw) {
>                                              .conf = (struct ieee80211_conf) {
>                                               .listen_interval = (u16)10,
>                                               .long_frame_max_tx_count = (u8)4,
>                                               .short_frame_max_tx_count = (u8)7,
>                                              },
> 
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> ---
>  libdtrace/dt_cg.c      |  7 ++++++-
>  libdtrace/dt_consume.c |  7 +++++--
>  libdtrace/dt_htab.c    | 17 +++++++++++++++++
>  libdtrace/dt_htab.h    |  2 ++
>  libdtrace/dt_impl.h    |  1 +
>  libdtrace/dt_module.c  | 30 ++++++++++++++++++++++++++++++
>  libdtrace/dt_module.h  |  1 +
>  libdtrace/dt_printf.c  | 12 +++++++++---
>  libdtrace/dt_printf.h  |  2 +-
>  9 files changed, 72 insertions(+), 7 deletions(-)
> 
> diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> index 27246a40..30cccdaf 100644
> --- a/libdtrace/dt_cg.c
> +++ b/libdtrace/dt_cg.c
> @@ -20,6 +20,7 @@
>  #include <dt_dctx.h>
>  #include <dt_cg.h>
>  #include <dt_grammar.h>
> +#include <dt_module.h>
>  #include <dt_parser.h>
>  #include <dt_printf.h>
>  #include <dt_provider.h>
> @@ -2832,7 +2833,9 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>  	ctf_id_t	type = addr->dn_type;
>  	char		n[DT_TYPE_NAMELEN];
>  	size_t		size;
> +	dt_module_t	*dmp;
>  
> +	dmp = dt_module_lookup_by_ctf(dtp, fp);
>  	type = ctf_type_reference(fp, type);
>  	if (type == CTF_ERR)
>  		longjmp(yypcb->pcb_jmpbuf, EDT_CTF);
> @@ -2842,9 +2845,11 @@ dt_cg_act_print(dt_pcb_t *pcb, dt_node_t *dnp, dtrace_actkind_t kind)
>  			"print( ) argument #1 reference has type '%s' with size 0; cannot print( ) it.\n",
>  			ctf_type_name(fp, type, n, sizeof(n)));
>  
> -	/* reserve space for addr/type, data/size */
> +	/* reserve space for addr/type, module identification, data/size */
>  	addr_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>  			      sizeof(uint64_t), 8, NULL, type);
> +	dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
> +		   sizeof(uint64_t), 8, NULL, (uint64_t)dmp->dm_id);
>  	data_off = dt_rec_add(dtp, dt_cg_fill_gap, DTRACEACT_PRINT,
>  			      size, 8, NULL, size);
>  
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index dec2314b..432b4e12 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -1987,9 +1987,11 @@ static int
>  dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>  	       const caddr_t buf)
>  {
> -	dtrace_recdesc_t *data_rec = rec + 1;
> +	dtrace_recdesc_t *ctf_rec = rec + 1;
> +	dtrace_recdesc_t *data_rec = rec + 2;
>  	size_t max_size = dtp->dt_options[DTRACEOPT_PRINTSIZE];
>  	size_t size = (size_t)data_rec->dtrd_arg;
> +	unsigned long dm_id = (unsigned long)ctf_rec->dtrd_arg;
>  	uint64_t printaddr;
>  
>  	if (size > max_size)
> @@ -1998,7 +2000,8 @@ dt_print_print(dtrace_hdl_t *dtp, FILE *fp, dtrace_recdesc_t *rec,
>  	if (dt_read_scalar(buf, rec, &printaddr) < 0)
>  		return dt_set_errno(dtp, EDT_PRINT);
>  
> -	return dt_print_type(dtp, fp, printaddr, (ctf_id_t)rec->dtrd_arg,
> +	return dt_print_type(dtp, fp, printaddr, dm_id,
> +			     (ctf_id_t)rec->dtrd_arg,
>  			     (caddr_t)buf + data_rec->dtrd_offset, size);
>  }
>  
> diff --git a/libdtrace/dt_htab.c b/libdtrace/dt_htab.c
> index 478c728a..3c167cb5 100644
> --- a/libdtrace/dt_htab.c
> +++ b/libdtrace/dt_htab.c
> @@ -229,6 +229,23 @@ void *dt_htab_find(const dt_htab_t *htab, const void *entry,
>  	return ent;
>  }
>  
> +/* Find an entry in the hashtable, using the provided callback function as a
> + * secondary comparison function to differentiate between entries in a bucket.
> + * A pre-computed hash value is passed in.
> + */
> +void *dt_htab_find_hval(const dt_htab_t *htab, uint32_t hval,
> +			dt_htab_ecmp_fn *cmpf, void *arg)
> +{
> +	int		idx = hval & htab->mask;
> +	dt_hbucket_t	*bucket;
> +
> +	for (bucket = htab->tab[idx]; bucket; bucket = bucket->next) {
> +		if (cmpf(bucket->head, arg))
> +			return bucket->head;
> +	}
> +	return NULL;
> +}
> +
>  /*
>   * Remove an entry from the hashtable.  If we are deleting the last entry in a
>   * bucket, get rid of the bucket.
> diff --git a/libdtrace/dt_htab.h b/libdtrace/dt_htab.h
> index d39ae65e..1ce5a80d 100644
> --- a/libdtrace/dt_htab.h
> +++ b/libdtrace/dt_htab.h
> @@ -100,6 +100,8 @@ extern void *dt_htab_lookup(const dt_htab_t *htab, const void *entry);
>  typedef int dt_htab_ecmp_fn(const void *entry, void *arg);
>  extern void *dt_htab_find(const dt_htab_t *htab, const void *entry,
>  			  dt_htab_ecmp_fn *cmpf, void *arg);
> +extern void *dt_htab_find_hval(const dt_htab_t *htab, uint32_t hval,
> +			       dt_htab_ecmp_fn *cmpf, void *arg);
>  extern size_t dt_htab_entries(const dt_htab_t *htab);
>  extern int dt_htab_delete(dt_htab_t *htab, void *entry);
>  extern void *dt_htab_next(const dt_htab_t *htab, dt_htab_next_t **it);
> diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> index 2dfb64d6..2bd1dafe 100644
> --- a/libdtrace/dt_impl.h
> +++ b/libdtrace/dt_impl.h
> @@ -136,6 +136,7 @@ typedef struct dt_module {
>  	dt_list_t dm_list;	/* list forward/back pointers */
>  	char dm_name[DTRACE_MODNAMELEN]; /* string name of module */
>  	char dm_file[PATH_MAX]; /* file path of module */
> +	unsigned long dm_id;	/* id of module */
>  	uint_t dm_flags;	/* module flags (see below) */
>  	struct dt_hentry dm_he;	/* htab links */
>  	dtrace_hdl_t *dm_dtp;	/* backpointer to the dtrace instance */
> diff --git a/libdtrace/dt_module.c b/libdtrace/dt_module.c
> index 1e730426..7697f73b 100644
> --- a/libdtrace/dt_module.c
> +++ b/libdtrace/dt_module.c
> @@ -35,6 +35,8 @@
>  #define KSYM_NAME_MAX 128		    /* from kernel/scripts/kallsyms.c */
>  #define GZCHUNKSIZE (1024*512)		    /* gzip uncompression chunk size */
>  
> +unsigned int module_idx = 0;
> +
>  static void
>  dt_module_unload(dtrace_hdl_t *dtp, dt_module_t *dmp);
>  
> @@ -50,6 +52,12 @@ dt_module_hval(const dt_module_t *mod)
>  	return str2hval(mod->dm_name, 0);
>  }
>  
> +/* id is combination of hash and index */
> +static void dt_module_init_id(dt_module_t *dmp)
> +{
> +	dmp->dm_id = ((unsigned long)dt_module_hval(dmp)) << 32 | module_idx++;
> +}
> +
>  static int
>  dt_module_cmp(const dt_module_t *p, const dt_module_t *q)
>  {
> @@ -150,6 +158,7 @@ dt_module_create(dtrace_hdl_t *dtp, const char *name)
>  
>  	memset(dmp, 0, sizeof(dt_module_t));
>  	strlcpy(dmp->dm_name, name, sizeof(dmp->dm_name));
> +	dt_module_init_id(dmp);
>  	if (dt_htab_insert(dtp->dt_mods, dmp) < 0) {
>  		free(dmp);
>  		return NULL;
> @@ -193,6 +202,27 @@ dt_module_lookup_by_ctf(dtrace_hdl_t *dtp, ctf_file_t *ctfp)
>  	return ctfp ? ctf_getspecific(ctfp) : NULL;
>  }
>  
> +static int
> +dt_module_idmatch(const dt_module_t *m1, dt_module_t *m2)
> +{
> +	return m1->dm_id == m2->dm_id;
> +}
> +
> +/* High-order 32 bits of id are hash value, low order the module index.
> + * This allows us to limit cost of search based on bucket size.
> + */
> +dt_module_t *
> +dt_module_lookup_by_id(dtrace_hdl_t *dtp, unsigned long id)
> +{
> +	uint32_t hval = id >> 32;
> +	dt_module_t tmpl;
> +
> +	tmpl.dm_id = id;
> +
> +	return dt_htab_find_hval(dtp->dt_mods, hval, (dt_htab_ecmp_fn *)dt_module_idmatch,
> +				 &tmpl);
> +}
> +
>  static int
>  dt_module_init_elf(dtrace_hdl_t *dtp, dt_module_t *dmp)
>  {
> diff --git a/libdtrace/dt_module.h b/libdtrace/dt_module.h
> index 56df17a6..68dadfc6 100644
> --- a/libdtrace/dt_module.h
> +++ b/libdtrace/dt_module.h
> @@ -18,6 +18,7 @@ extern dt_module_t *dt_module_create(dtrace_hdl_t *, const char *);
>  
>  extern dt_module_t *dt_module_lookup_by_name(dtrace_hdl_t *, const char *);
>  extern dt_module_t *dt_module_lookup_by_ctf(dtrace_hdl_t *, ctf_file_t *);
> +extern dt_module_t *dt_module_lookup_by_id(dtrace_hdl_t *, unsigned long);
>  
>  extern ctf_file_t *dt_module_getctf(dtrace_hdl_t *, dt_module_t *);
>  extern dt_ident_t *dt_module_extern(dtrace_hdl_t *, dt_module_t *,
> diff --git a/libdtrace/dt_printf.c b/libdtrace/dt_printf.c
> index 50842216..108adc23 100644
> --- a/libdtrace/dt_printf.c
> +++ b/libdtrace/dt_printf.c
> @@ -14,6 +14,7 @@
>  #include <limits.h>
>  #include <port.h>
>  
> +#include <dt_module.h>
>  #include <dt_printf.h>
>  #include <dt_string.h>
>  #include <dt_impl.h>
> @@ -2236,13 +2237,18 @@ err:
>  
>  int
>  dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
> -	      ctf_id_t type, caddr_t data, size_t size)
> +	      unsigned long dm_id, ctf_id_t type, caddr_t data, size_t size)
>  {
>  	struct dt_visit_arg dva;
> +	dt_module_t *dmp = dt_module_lookup_by_id(dtp, dm_id);
>  
> +	if (!dmp) {
> +		dt_dprintf("error retrieving CTF for print() action\n");
> +		return dt_set_errno(dtp, EDT_CTF);
> +	}
> +	dva.dv_ctfp = dt_module_getctf(dtp, dmp);
>  	dva.dv_dtp = dtp;
>  	dva.dv_fp = fp;
> -	dva.dv_ctfp = dtp->dt_ddefs->dm_ctfp;
>  	dva.dv_data = data;
>  	dva.dv_size = size;
>  	dva.dv_last_depth = 0;
> @@ -2260,5 +2266,5 @@ dt_print_type(dtrace_hdl_t *dtp, FILE *fp, uint64_t printaddr,
>  	if (dt_print_close_parens(&dva, 0) < 0)
>  		return -1;
>  
> -	return 2;
> +	return 3;
>  }
> diff --git a/libdtrace/dt_printf.h b/libdtrace/dt_printf.h
> index 9771c4a8..8d55d82b 100644
> --- a/libdtrace/dt_printf.h
> +++ b/libdtrace/dt_printf.h
> @@ -108,7 +108,7 @@ extern int dt_print_ustack(dtrace_hdl_t *, FILE *,
>      const char *, caddr_t, uint64_t);
>  extern int dt_print_mod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
>  extern int dt_print_umod(dtrace_hdl_t *, FILE *, const char *, caddr_t);
> -extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, ctf_id_t,
> +extern int dt_print_type(dtrace_hdl_t *, FILE *, uint64_t, unsigned long, ctf_id_t,
>  			 caddr_t, size_t);
>  
>  #ifdef	__cplusplus
> -- 
> 2.39.3
> 
