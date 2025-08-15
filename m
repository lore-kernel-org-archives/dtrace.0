Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF683009EE
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755272125; cv=fail; b=ZV+Jd8PXBKEREMGTxaP5zq+SioVdy9fS/yNYtbR8M2Xh2HB1LbpRzmESuk4380cc54pjlpinoYHS1Gr/u63jGcdtp+mn7H0HgKIzAMdhsd0Q6TMdNtZBjbdNq2QQpWY+6p67LcRs4NELrKqbhmy/wOoY56jWXNGVAa/Q6dcrFzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755272125; c=relaxed/simple;
	bh=RRgXiIerXKFzDabKi4A1YkKH7AxBEuq5Z0Ga9hCggjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Fe83znBaqc35Q/CktaNVbQWcXFUhFYMY05AYw0xYdeLdGrwRCMxVRN2a+2hQMB3RHefVPMP0676xW3CNjlArxS1mnMhToQ9vztqQauSKzj/90urV2dMTmtDPLQn0VdmVp+kNGclx+jdXu2nGWmVNxdT0pn1jS/hdKQ5BernuPEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=auDH6c+V; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lA+3XAcn; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="auDH6c+V";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lA+3XAcn"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FDN500014944
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Ne0kKEE+WBxF97a34N
	Vy1Hx8kPTWbYQDhSqqxIykCNY=; b=auDH6c+VXABbKqAtj/2VzdTqn7VVYD7sO0
	AE27FniKH4rRNAvOZJIKRM01EtiKvXiO2nmel7kYV0rmpZ1njtQnFKJGOW4NoNc6
	4ID/DI31cNty+ziGkeTdSuj4U02i4h49pWuHRxF+OZYSpp1F/qR7HDkDCtoeXe4g
	2TrC3W8ovyEJuICR5bk8Ezn4+r6ygwSNGzO/rJ9O+QY6RI5MS1BeRn6opA/ui3bw
	fWcwLy1zcHv37wpbK8kE3Nbp+ugm0ldqIovkyCTKebarE2W02fYf318ta2wwN6sC
	h6sSYkexVm41Eq6J9vP5V+uLrTb+oDr/QomlFGw9rRyv8EOYbCng==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48dvx4m66m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:35:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 57FFUJhZ006368
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:35:21 GMT
Received: from cy4pr02cu008.outbound.protection.outlook.com (mail-westcentralusazon11011014.outbound.protection.outlook.com [40.93.199.14])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48dvsdxfkg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 15 Aug 2025 15:35:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxdjoQ//KolfBji8lCWt54C+cD3TMTxo/l3MW0YdO/o/TFJmcYGrZsCAjPfcOKCqZDCs/MZC4hkraKB4UVKDAt4WdlOoVHU8gjVztA9V0sG87Xi60M0lW3z4zDCRh4YDuAIENP+hm1FArANIg0Bg5V7EJbvsLxjPmYuZURp/pFk5cudV2WXbdtcnS9URKCGj+BVQQPBoBfI5i7Y/kX+BMR5S8z4CGJnxBrfOnZeBr5x4C7bDRRCgOzHJFjptahVYpwpO5jIUKomzSEMbmihG+Ho0NnbU3ve9hWEJ+pZT1cFlkN7WhUbgYfLkPg63hi6outnR0i5oA9r5AlTe1rAooA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ne0kKEE+WBxF97a34NVy1Hx8kPTWbYQDhSqqxIykCNY=;
 b=oehzBYOtjuJ+wkNZuGWCFrdcZuXOwONL57GPiUSCkJvSqE8saE90MqmVfcum92lQG7BMp7/zLq91EbtmNXxMI/iiYpr53ZQWBpPRyM1qL1yAjED0J0dF98GcNg8bg58w/BHKp7iQP2BAwpAO+KUpTPpOb9fqvAn0DI7YKWxZLWRWvAtTVCJ0hC10lKS367qulkEICtnEDnrScR3k7nWVXt0QadK73AHDPxwSsBJt6Coq1ouBLprf2GTsv2qkUBKGkynCErjcUKrS8T3k3Ju4BdftnIkJVH1WtBn8qlIdrscN1mONfLsZp7iNVTZbhx8OAd1bUptWUEsQzjBI3noT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ne0kKEE+WBxF97a34NVy1Hx8kPTWbYQDhSqqxIykCNY=;
 b=lA+3XAcnTLe4XbI7n/lIkn6kgXKa2DEVvy8Ij/vOvkDaj4WvKqP+nWICAb8NZtwCiszbDwXDrzHiSbBbHjw3dZE7kO/6dTg1S9h8boTFBt2kt/5c/Og4hUO/S1J4Qow4kGVTs1PmrdZ+yhvMf/cDLZWGq1JjZ30j+BMZqfzcfqo=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by DS7PR10MB5198.namprd10.prod.outlook.com (2603:10b6:5:3a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Fri, 15 Aug
 2025 15:35:18 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9009.018; Fri, 15 Aug 2025
 15:35:17 +0000
Date: Fri, 15 Aug 2025 11:35:14 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 2/2] Use a consistent type for
 dtrace_consume()
Message-ID: <aJ9Tsgo33AyjR2F0@oracle.com>
References: <20250812224606.16606-1-eugene.loh@oracle.com>
 <20250812224606.16606-2-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812224606.16606-2-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:36e::14) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|DS7PR10MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: 66d22979-e531-4063-4f32-08dddc115611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZlfXUer6qaO1m9h9qMUcyG5ABO62k4660oqvgrxVECyTZB04UWGMVDJHjtHN?=
 =?us-ascii?Q?xQ7bwZiNrprrwxAiH16mx0mzAJS+Y6zN66QZF07KOmAR8jvKR3fSF08W+upH?=
 =?us-ascii?Q?OwM4CVFS5U+8uIEx8CVhR46SuISl/EvmttCaxPYXwVGKIRceXN4s/2uun+Tn?=
 =?us-ascii?Q?MY1blNKr2Ez536mMtkli/MqslM1BbptJnqoOEtfuJYK5HRE95LXBIxnGzcVh?=
 =?us-ascii?Q?0Ihur7vBa3FLchiUgUCQGqwU2XPJy+q1ACQOFOOZdEm4E13P7JTujwApNTjY?=
 =?us-ascii?Q?SYI//mMjUYK+eLWFwx/Otv4oRFJLzxIHsnCAKEdIcIUdl/PHeQpn2PMpkTFm?=
 =?us-ascii?Q?un8kF7bMuSG206XS7xGraweic4MrQlzIeoW5+dWVnOPFmqMw0/tVKxGgpsLg?=
 =?us-ascii?Q?cyQymJzNuv3X09ycZmYo2a/Z3kWPZAx+Zf6BDeGKYMFVnoIsfN4Kk4Dlx4+H?=
 =?us-ascii?Q?IurWrhwPztcXFPE8BcQPTfnWF1AUqa5veC5/nL/DUiaTa19yksiUgVdaWZD3?=
 =?us-ascii?Q?GJWDKa8lUNNtEYg7Q0EtFeKH/+6cguTmvnbB7/SD8DLiPT8A23eVBCbh6ASS?=
 =?us-ascii?Q?mASPN0caHCDxnDlTMH4WTG3wCx76cRdU0U5iUj1J0Idl0Qz6eJm41sDPGalc?=
 =?us-ascii?Q?OacaCbFB2D8ho5hcoRsm9TCRk9ZY8ROAP26yfVLp5e4Nwmk9twP5bJYlg+9K?=
 =?us-ascii?Q?dsMgUqmKR6X3iEfjvZKGQlWP8KrJV14gTltpSm1Bz9kY8x5i1CVctC2rZzvD?=
 =?us-ascii?Q?9fVLq8ISha2zLVNVnbZKTCuCwiSQM+hFJ5E0V4j1rIP+KvoEqSnb0Egp5BHe?=
 =?us-ascii?Q?LFBkRlKLPoNsMjN/4qgC+5ZeRtpo3bBlKi4URyF9pcvAvnRU5Vj4WP2N6G6n?=
 =?us-ascii?Q?uopOr39zMBFMFzjnit5JQD8o7UcZk8IxVnMzL6yMyHA8kB+u25TjQ1wyPduk?=
 =?us-ascii?Q?9cFUOiOJPOTF9vjvaN2cnd06BcDdzKWPJMfN9yY8mecid1OiUSB8IY6boqQG?=
 =?us-ascii?Q?wF10FQTjOdk+dsO24YzWE/1xgqTd9IzeTKIKWhbvGG22wPKglLnikwcHoAgG?=
 =?us-ascii?Q?Wx04vvBZgoKKt/S+LYP34aujObFmZaD0BG4Hm0873aZuUGlmprftUQZ4zl+y?=
 =?us-ascii?Q?Q4Hj1gH/sLupQF3meMcFjX+UeSTVccsRqpqppxDcaTMefTfQ6bbpQpOnv5Vc?=
 =?us-ascii?Q?171ZcMuQwmWo2KJLWfKDQnM4Yj++DZJxzBkYafL+/heyoglelet3vrwRW6ra?=
 =?us-ascii?Q?4+CNmP14QcrUE+wtlwcTEW8sL4AjlPwhsLc14z83vUBiVuHRd3R7ra88DOm1?=
 =?us-ascii?Q?d5fQqrfHBS4p24qoHlD2YcDvp169lrQigpyQ5vCFhrfkLZCaEl+R0JCsku6A?=
 =?us-ascii?Q?aHkp1f382FvXCqQoBMvmHJ4Wh63vzGbOzMNnfGEZbL/U7SCsfEQQlXDgtyvQ?=
 =?us-ascii?Q?KNsyjuWmm2M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XwU01ziPTe6E3ITEP3ama7llduIv2p5DgkLz3LKzDkveJiNpv0TLWcbJl0Dy?=
 =?us-ascii?Q?5zhfOnkZcdmP8teZQ7xjryRBSc3acUSqTVXCtqaVdls6aFymvEL9MKGRYSwB?=
 =?us-ascii?Q?XA6l81Z9vc0kojnyYoQPnj9WmFeVzPJkFDoHLWOHSyRqGes75SM8vgTcuRqN?=
 =?us-ascii?Q?vmj/GKAMZldhLScTTPgxS7nC8055Pnam4irtqrqJsW48ltbdzZcHZkAuSn/J?=
 =?us-ascii?Q?VFEb1Qp5vEvDoGsLEL+I5UPCrLFQ5sITdl/tNJoAX4H0cPTdBfafmPWG75WP?=
 =?us-ascii?Q?vHd+woC81f/+eCYydWevq0wWqYFLh8u9n1HAOyQ1JoGpMLoc2ER9qWcnlDVr?=
 =?us-ascii?Q?urxlXK/y4Y7SiVLrJ5z4P8v8jMHx5rESnu6l8cytw6NFPHhWfNj6A/ych1MX?=
 =?us-ascii?Q?d8R3J4zSi1dQaPgT+HFFcUb48N1k5PmJlndy3xtPHdpQqvAYAdMXM6Xxkigi?=
 =?us-ascii?Q?jJQD0frg1GAhYjkU9H2v6/38bF7uzMr3is8rCnzp8IYqrpQC9sY4kDTDuJ9X?=
 =?us-ascii?Q?iOsuYTVTYbg6cKVy+8b9od1eWYCiPTuMom23QKcTt7lyWPg9uGrqoVrT6A6g?=
 =?us-ascii?Q?N9HDlpsr+UA7hW0BoID7qZ5eU52cvaespinEEf7g6VVhzeW3rBs69JcaZerp?=
 =?us-ascii?Q?kL84ArVHrfISrqrTcxAkX77EGQGGGQWIO+0Dnkq9CajOYcF2AJ/q+uK8bNIv?=
 =?us-ascii?Q?4EWyE82paAxNyZBuR/4Rh9yWNAznoc/sN9FmPMM1n6tkB2CHm+skDnPwwV/8?=
 =?us-ascii?Q?Zs8x6Q2aeKMs2CQ9KOBqW1yeN3/w0Cmcd5vp1qTUCGTn/BjJcKQ10Gyacz/A?=
 =?us-ascii?Q?Ai7QQtji1PV8NnU46k8Nk3oYhGEDUY6kqoaMM5S7mfJOBxFjmd1epQCqyDkD?=
 =?us-ascii?Q?4mSb8ttmZyCY5hpDgllxEkIWuZAztDGUDjyHBnlRTTt9atK/s8RzqW1KSwHl?=
 =?us-ascii?Q?Y5bYsHSlmVAinVLaYIYSFve5EXEKP0l9UyCSnT2/oBeIkBIDsEzG+a4rvNBA?=
 =?us-ascii?Q?EoI60tQf+ovZvkQBaa0xyW7doJfdkYm8DzXwZqpAJOv7aJ95thfnOKkJsAuR?=
 =?us-ascii?Q?7isP9NAPXvrqDplxf5OqdZILEv0lQ01gMnl/7ZTjGHf2ZrTjioOdy1vpUVBH?=
 =?us-ascii?Q?U/ex3BBSzxBWXx9NnFGhD70tx9mDGwEG0wBDYoFZNPGX1cHG3F2A1Z9KSpsp?=
 =?us-ascii?Q?t2/u+lSLiUyRa5GKZ5d6JynBkqQeAPn4gfXmGrS5of/64FmUfHtg13VWjLOD?=
 =?us-ascii?Q?BwikBXgGGCPHRwK/ZaVGbEk0aJhkN4sOjsZ2NcT7tfKfyULsniTc1/50F6CU?=
 =?us-ascii?Q?fEBd4a0P2ZqDPHo/XA0mvygyZ9/Zi4317gxjgU4lebE7wphxOta6fRRUyLaE?=
 =?us-ascii?Q?h/DexdUgi8E/QUlEAl2ABLXevEt/7Aulo4QNnXzO0HQLr79PejJU6e+f3z6f?=
 =?us-ascii?Q?yl8z4KV6Hcwi+ahwUwyYqvMZix9U17xjXlJ4dHSAiDR67FNXvclF8sixTlrU?=
 =?us-ascii?Q?eYsKYAROQrNFy4ttteMNPi+81mUxmYPgHsOukg/tQqALlG5SwmYUj2N0pApI?=
 =?us-ascii?Q?r5KLST+IT6V5rcdY6F7eXwb8Qsmcg+iQR46BCWgeY3iDvLnNH1OEQBsJfwhs?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0cdHj72KwdYJjaHD6A6nRCwI09u+dNp9dM8PvTiadnEy4lbmnQ280wbYHyFG6Z/LrFej8DZjzY1rfGuRoqYsl9kH4tzbAziCIGT4JRNFW899nlMPRLvY5uUSAqP3TDOdo05gL4JClWISlXUPeAk0zOdJgCMMtlzNCLvQEwja1Sc9kjiHUnbwmnqtgEhSH+729FK6kYqkUah+Aivz0BPJNp9R+KM1kZx0+LyVOhF8utEvNf4lxMlTDtvG6pBqIoyXt/F50651jeRK6lB87XG87iI61mH2YBoMe4HSFUajnotYECgz64WVtkXR4lC/LdsSiFDmRblTga9I/Axf4Su1s53+jZ9DWg80bpSqnfHYxYujoqV0aNsc6o1hh1Zs+eUtetO8DmFSGax8AMitJ+SUx8EIBBFll9L7l2T+9hle+0wLCUqRLtR0goDI5ETJzGbs2OrduqnW0Z6H1+M05UPVTNXgxRr/DRn3w9KoqFSeUMRFGi1yFr+me3MvuuNW3kYvhooCUTBxLDfH1O1qIuS29CDYf3hNN6XLI1OMft1VYvJ8xmjkQ6ZQp7VkT2iA5j9ot8t7V4mYY4APX3AMtMc+s3+ckhl+YJb580LySuRUbaU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66d22979-e531-4063-4f32-08dddc115611
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 15:35:17.5808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pZR/xYIspcqaTWroMlevQMw4u8HKQxnEUvJIHzrKciNRKmcrbMBL/+EgVrYfzC9claqa/Mb42enhiEATjJx6l/9EmoyMyYPJ+bbx6R6Fx8E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5198
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2507300000
 definitions=main-2508150128
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE1MDEyNyBTYWx0ZWRfX2j3imqwRgXL6
 n5SNNkBV39BWyil1uVwU/RuS2axvJfDZRKz/y9bAjoacCRErhvo1Fqvj3NKWTOmZx5Ma74VWmBg
 MlQ2FyPD1/wgKGT4TMaRhdBMeijB3vbq9rU5LvYnlb4uPOnoTdpg//L+p9KlNVgRrQcwni5Iruj
 dcKNC/EqoEIpGC48yQsGmWU0BvamXhPALdZhgmLQjqXtg7HegHMb97/zT6C/5CHW2+vcnD3sgan
 IDoOgYOasjTHL/ojjZ/R/sgWyfibtGu2x5e4gkuxtuIgm90VqDVMbWEhFK5uIAhklblcM0BCZkc
 00wiJCa7oVYO6HI7mhOwA1CpdFwJU4vWrDIPNNbFh2j69b+SMLnXSq8yRGzERIbbpn+GMic9WYT
 XGwr+dan1KGSGnNoPHpiVhaPfWnfRywOaHG9Z/gVukpTl6KH2P9nIsa/fIzMxlpe7ArDbaU6
X-Authority-Analysis: v=2.4 cv=eIsTjGp1 c=1 sm=1 tr=0 ts=689f53ba b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=aIz_Co64duF09TpWQkwA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13600
X-Proofpoint-GUID: 8eTIDjVKBPaUuGJ41bnGtWu0ckOfqoFQ
X-Proofpoint-ORIG-GUID: 8eTIDjVKBPaUuGJ41bnGtWu0ckOfqoFQ

On Tue, Aug 12, 2025 at 06:46:06PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> For a long time, the type of dtrace_consume() has been
> - int                 according to libdtrace/dtrace.h
> - dtrace_workstatus_t according to libdtrace/dt_consume.c
> 
> With some recent compilers, however, this triggers the warning (redacted
> here):
> 
>     libdtrace/dt_consume.c:3041:1: warning: conflicting types
>     for ???dtrace_consume??? due to enum/integer mismatch;
>     have ???dtrace_workstatus_t(...)??? [-Wenum-int-mismatch]
>      3041 | dtrace_consume(...)
>           | ^~~~~~~~~~~~~~
>     In file included from libdtrace/dt_impl.h:14,
>                      from libdtrace/dt_consume.c:16:
>     libdtrace/dtrace.h:210:12: note: previous declaration of
>     ???dtrace_consume??? with type ???int(...)???
>       210 | extern int dtrace_consume(...)
>           |            ^~~~~~~~~~~~~~
> 
> which is a nuisance.
> 
> Note that dtrace_consume() is called from only one site, where its
> value is compared to DTRACE_WORKSTATUS_ERROR, which is an argument
> for the dtrace_workstatus_t type.
> 
> On the other hand, dtrace_consume() is defined to return a variety
> of values, like 0, dt_set_errno(), and dt_consume_cpu(), all of which
> are int, but also DTRACE_WORKSTATUS_OKAY, DTRACE_WORKSTATUS_ERROR,
> and rval, all of which are dtrace_workstatus_t.  But then rval itself
> is set to dtrace_workstatus_t dt_consume_begin() or int
> dt_consume_cpu().  So, there is simply no consistency here.
> 
> Having the prototype be dtrace_workstatus_t requires some amount
> of code refactoring.
> 
> Just change the definition to int and clean up the warning.
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

... I admit this was my fault.  I tried to refactor the code so that we could
    have dtrace_consume() return dtrace_workstatus_t, but only got this far.
    I agree that for now, changing the return type of dtrace_consume() is the
    best action to get rid of the compiler warning.  Maybe we can revisit the
    actual refactoring work later to clean this up properly.

> ---
>  libdtrace/dt_consume.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/libdtrace/dt_consume.c b/libdtrace/dt_consume.c
> index 07b19d498..d9be563d9 100644
> --- a/libdtrace/dt_consume.c
> +++ b/libdtrace/dt_consume.c
> @@ -3037,7 +3037,7 @@ dt_consume_fini(dtrace_hdl_t *dtp)
>  	dt_htab_destroy(dtp->dt_spec_bufs);
>  }
>  
> -dtrace_workstatus_t
> +int
>  dtrace_consume(dtrace_hdl_t *dtp, FILE *fp, dtrace_consume_probe_f *pf,
>  	       dtrace_consume_rec_f *rf, void *arg)
>  {
> -- 
> 2.47.3
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
