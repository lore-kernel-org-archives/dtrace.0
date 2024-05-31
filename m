Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D77EEF5
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717181992; cv=fail; b=WG56jPeHyyF/AnAO966eFLlMUQkt1+LMdzV5rfDD17HDW8WG/W1n96NJ37c8fz8ugHgoqgC3MQYa32MrUaBSnEhWZ+IpOGtMweojDDuwg1S909sYU56Yder8E9H2DrBsmLSuHBcro2nl6NEQSWIUbY9BdYdQHlbi8/vPlXj3sPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717181992; c=relaxed/simple;
	bh=AhhXTMGq7EKcpWyKrMdwVYT3aCzB95DiksBgs9O4TzI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CNiepTr0ERd+H5RObp+DKZCJrV3GINUHOUvROaKm9SA4EKieNhThqsrV4t+8dx6neu1iqkodpm1SsOGGQfC04VDUtFO+ladgiVAhag44uv/R5XsSwBVdfFTFqc/me9OucomWgJYg8x70nhJOAajS1QM4xmglVDtHn2XV8gbsr0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44VI1dGh006932
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:49 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Doracle.com;_h?=
 =?UTF-8?Q?=3Dcontent-transfer-encoding:content-type:date:from:in-reply-to?=
 =?UTF-8?Q?:message-id:mime-version:references:subject:to;_s=3Dcorp-2023-1?=
 =?UTF-8?Q?1-20;_bh=3D6MLERu2pUq5Jvldz1wWYfHweudksMXv3+v/1HtktI0Y=3D;_b=3D?=
 =?UTF-8?Q?HfXfWueLuIsfy31cqyywh04JU5AWo7WpIApYXJrCO7gyQotfJ0OkskPAyxfOLmI?=
 =?UTF-8?Q?FXmut_7kI2IuXqPnetvTUDgAZioHy557J3YXsVcLGTFG1R+KWydmivMC8R45YlK?=
 =?UTF-8?Q?as99HHEGCvD_uD6n9L9DOnzB7XCo3kSWHH/5+7rqM4CsqMCDLO6KOUEtKcH80hg?=
 =?UTF-8?Q?OkweLNfuIv2an2OEg_HhgC1amZXKa7B8tjn1QmUOqNicTplKO2MrqHOVXiU3Hiu?=
 =?UTF-8?Q?gQuIQdLXd7QDbo3/GEfm4KM_o8Aj9+9VraTUK2ZRb7JcqY5CrXwJedOpTaQoDA2?=
 =?UTF-8?Q?4MPUmBLj+aZd0RqhoD0mPaxO2M0j9_cg=3D=3D_?=
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3yb8g9v0vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:48 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 44VH9qZh019356
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:48 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3yf7r2u8t3-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 31 May 2024 18:59:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ByBIVxxoPdYwqI1z+rOhh9N20Me9wthQoWdTpFubrwPDImzXCoIIfiwY/BpYXrVMVm2q26v2MwMSmyrKz4sGQ+km4g174NLieZPi84OrXjOP02Oa4GKHcXfZoWHDRs0e+Gnbt3kS++RH+gcaKDsqcqn0m+UQDsYmBqxViVtM+6VKRe6KYVVhVw9HxERbKjA0OOCF7Wtgujdd+nSO76Cpl/TkXVsVS8I8khSG+OjNJl8a6Z+V8Ti3oOQbh9aDGp/KZUE2U/ewalIhEm7TVNpPU100dCuMa3THfsPrQVuXR+A8mCE34fpcrqxCA4+3CLJxBf91nUBucgv53RnCiEP1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MLERu2pUq5Jvldz1wWYfHweudksMXv3+v/1HtktI0Y=;
 b=nsne9pKOjz+iJpJecW0jLmQUBk6pXsxZ2WGv+DgjhOSeTfsf489DhNwDbrkga3KZ/4cl0D7RdA88O4whbVenVw+7Ezox+aZK7gHDuYjjDbLNFxz3nw7xE9kJZOJ7EFJUMb4Dn3oNwgrMwxMW7O6rocTUCZwLVnOC76xRcbB2PuNRaUEHTenHBzkxSODUk3KvivfIJQK6nPaPi+4WnBCFEB41I5PDVTWfrwZ9s9IzJZryV6AvDT+YF2ob90Wvsa4KMloVkbz7hE90OoG09vTuS3I1NKJZTan/oBrcaP7NKoBXYT3wVnb6jF/pEuzV1WlD9P7IRfEiNOOgMMYc8kksSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MLERu2pUq5Jvldz1wWYfHweudksMXv3+v/1HtktI0Y=;
 b=tLeoEgwtEYM4m/7hlMadcNXGZRr52OJiJsybwPd1s2LSwAmHoLmvUVKKQp3xdkZhCMGaHcXSwWC8WpKvZOet9BUF1pH4FAgKQ6Swh/DEBXz9tN95Qv/tW6S1N+rEcWXKcbFoYL+peMrBwZ2qrlkLU0HP5k1Gcpny5WOaNW+mFqE=
Received: from MW4PR10MB6608.namprd10.prod.outlook.com (2603:10b6:303:22e::8)
 by DM4PR10MB6255.namprd10.prod.outlook.com (2603:10b6:8:8e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 18:59:46 +0000
Received: from MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df]) by MW4PR10MB6608.namprd10.prod.outlook.com
 ([fe80::b53a:ccc1:c190:c5df%6]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 18:59:45 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 3/9] build: track configured vars
Date: Fri, 31 May 2024 19:59:22 +0100
Message-ID: <20240531185928.363245-4-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.45.1.275.g567cb0950c
In-Reply-To: <20240531185928.363245-1-nick.alcock@oracle.com>
References: <20240531185928.363245-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0170.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::13) To MW4PR10MB6608.namprd10.prod.outlook.com
 (2603:10b6:303:22e::8)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR10MB6608:EE_|DM4PR10MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a4a7b7f-f110-4a69-4912-08dc81a3d650
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eh8jj136lb0/gAFBccVaz75Qu01J6AQ1rdB0o6T+fBnvoRZ5QNXtPWrSe1fz?=
 =?us-ascii?Q?T32iT3Qn5pSgoCV7Ov5wQeQHH7i+WAQV54E7Uuwo46erMZFH8LSmlLkM0ddx?=
 =?us-ascii?Q?6oXuR8xAhGUWY08PD0l0LjHhpeLAPU/VbjhedrAsVf2NHhUq59L54dFfj/V/?=
 =?us-ascii?Q?G6LrATf1eOikNhTk4kIaeEbUY+j4vV7EL2AopTN3CEAycSIm4ox+DgzRWbDN?=
 =?us-ascii?Q?B7xNVocIbJJH4WYU/Jy/xo2rxREHYB0Z1Su+Baw7cliirY+dZQTEUGurNWRC?=
 =?us-ascii?Q?T/WbGHIIF/rsu23Vjw/puZttGJsDe5y7Fg96574Ub+vg+tS1/h/vDiTq0bbv?=
 =?us-ascii?Q?m2q6XD/LYnxHchZAH3ZcJYn1sP5y91ONgbcu5KoIERzVQySQsUU2ZVNFC6Xj?=
 =?us-ascii?Q?xCydmC5qrDspSwjXmDep7erJFn1/2bYCrBpa790IfJvaoh9nAjWY7S9NfC7h?=
 =?us-ascii?Q?/6w+n61BJ1X3GqcjorPC8t2rVhZ5Xab1rx6I8SHd7y5EAPejrOpXqo2AwVXT?=
 =?us-ascii?Q?/jw2cBONTvuk3IDUoke3ANpYSjLLGRdsBZGu4G3LU88uOYkM9L1Y5oDf2K7I?=
 =?us-ascii?Q?lCFvTnBKcSnr6PbXRRO/sfHADrg8mAqqj4YDZyzVXS80hq1LYwbvN6RbuJ9f?=
 =?us-ascii?Q?caZGUxYthExNY4XugDeF8gic7TNN6OrqAkMw+XqNVYLlhdBjncMorsccFZI4?=
 =?us-ascii?Q?cj29qtL+fXm0DRL39uoCi/2/dN8wGRUCCmfWpMtJNq6OSOvRlQjfg6rf9dGN?=
 =?us-ascii?Q?22Eqk7xJdOaNT3OVoaxLifnJl4IaHTwrf4bD+jKFOoT252AD2tHNPCd4+2Xs?=
 =?us-ascii?Q?xdmGgpk+xDr6h+tEMx+/xgCghEqW3y0z0XFScXoRCulIkEB1z1K2p8InDNUu?=
 =?us-ascii?Q?+pkyLqI5INH6llDqF07GlLimA65YTkVybaMCJxq61g0pAFU5mVSyB6rNCnDu?=
 =?us-ascii?Q?65JmCF5RTnvDQnDQSraUJxHuG3BWSH77H/Vgk9fkrxKYh7Xqsi38FRXmlPnk?=
 =?us-ascii?Q?0NhL3whN7uO2bq47H6XFeSCR17J/Qe+JxG/lllMaIIYkPWBvPRyMM+I8ibo9?=
 =?us-ascii?Q?72zE7wzupoT24roKlowNzSxuzT+aOdTSyZQScIVxQluESHxjNy7DoF/mCdhK?=
 =?us-ascii?Q?GMNhpEV7G+vrVC7ipo0UQWQv3U7LPL1LrJqT/hod9e+Z5uTGX/A2H33vehHN?=
 =?us-ascii?Q?YM3XHPzUA2bHAop3nGaNFxFDzR8Ef/8fOk3cWlmZyKGTF5lJTm6GOnBwzuLp?=
 =?us-ascii?Q?jazt7sIjK44YWhlp0Tp7vEivmlVIuD3ugTZDKHTGXg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR10MB6608.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zPcrk0c6iVQp7K1XKnKujv4lCDP6mupcEKgYbBdVELDpYr/sg8AhwkaHOTUo?=
 =?us-ascii?Q?cnUQlkN1ZCZVn7fvqaAFOUaedkToui8bnAEvzDmJZR7vu5kO1W9/vpwq9Ggg?=
 =?us-ascii?Q?oR1qff2VpEwihfiWWOr1m4D4aczPFVlA2DCLntn/eCy0glxXHOwMwFwXZgNN?=
 =?us-ascii?Q?ze9W60wQmkuM6r0lvjF6543OebhTNRr9CuhqGqj0W44I26SG2WBndzBRnMcf?=
 =?us-ascii?Q?npeLtHoWyKuklhbKjHzPPNQy+0mSsHNkhtgoQuKTC21GlnI5MA48LJnmdp1P?=
 =?us-ascii?Q?JMsCeIdv9KrFZdc4CNfOwTHmmtvTLyy+hVxl+QbO/HhHwynwWqYL7xmv+MeR?=
 =?us-ascii?Q?KNYWhXHKmNz0W97m21c77kViyEG8SARfYzbAlsgSBBKhbvMjq4jYTzgwOKwX?=
 =?us-ascii?Q?wtvNCCeMAtcIGqS82xz3RarqMj1bmNSyJdNtexFXV3Tcd3PxWNVmFrx7tNlt?=
 =?us-ascii?Q?/1qE3NPFryz34Bc6bPAmDLKfCNF5oBuVAW4DHD+fPTpyQaNTfKb/yH9N+msR?=
 =?us-ascii?Q?MV/D5bKN4BQghGd8racRezqxqAXV7f6EJCySdjHdFCvmBZlRO7gwwzfgI+Ec?=
 =?us-ascii?Q?NJduePxi+vd/gRahMwxU5p+/O/pkOB4qPiwgxcVqLpgS33L7DZ6Qy1aezhxQ?=
 =?us-ascii?Q?wWxfqVKxOPGVFl37WxYpE9IuVqoKZnzuiUqDgAGLUTIF5PCfhOUJaC8Jdl9q?=
 =?us-ascii?Q?Z6MAu98+F91VYrflBGpAD8j6okThrl5VKrTkUtOSUHBfb6NfIeQw1tzefxcc?=
 =?us-ascii?Q?rtiOeLr02G2FlaAx2qIeffgfl5objIoN2iZYfc0cK5tbwOB+Dbxi8PyvhPCw?=
 =?us-ascii?Q?MOtiLNa0qk8lPJQ8uRnPUpvYzkJ5wFY464wUixLiq3PgrDiEsVOkjVibcExf?=
 =?us-ascii?Q?62lo9TjyBTWERMIf+pSJpcVZiq1T3ELMNVuAz2+nebep7VSq8WcFKGzoI4+F?=
 =?us-ascii?Q?mXIE3nOmcKxLitcFksWP7HMtnr/UzZf6RdHIKajcTvUZBK+BR1+PAk0L9+Rn?=
 =?us-ascii?Q?M+HmMhZyuwI9IeSJO9+EDMVHwM+etAvl8t+vpN6mH318jDtJ88F1g6bvzs8I?=
 =?us-ascii?Q?VoBbeOO2QQ+TaW2b+6u5IybvPSVz7qrpi31E3maCo0LWlj+AP+TuFqhGrayn?=
 =?us-ascii?Q?13ENfHJUua3KaZfwTSDocMSbKT8FDj1MkPpb7x6ufTeaVO6WfPsPm7519N+V?=
 =?us-ascii?Q?LH/XHaIv5GUvQRqXx/AYT/VoufVqnmjVHyE9v6abHzUvZwXOXlnIDFfEYlPT?=
 =?us-ascii?Q?vNGars63xJhEURoQgTMEF7zIPXkdwnDUCQ0anv0lk8tr7Yd2/Jg737p9/m8l?=
 =?us-ascii?Q?T5tsPLaMsxDU/fuPFVpYEUJPdpCiQ1sZOXe/WzEtMbbtX42f2pYgD9R7nho/?=
 =?us-ascii?Q?EVsEbI10I48dwEj22gvRdnMkVldrW2itDca/hinEVhlMadmFDibvkhWNSCbz?=
 =?us-ascii?Q?9MB+b6FvlXNX9bfSmTkq2ZrDqZax+pIJaa0z6VMInLd+mXmVaK8impnRssRr?=
 =?us-ascii?Q?M4hgJ8IldJjiPqB57QnwEMtkp7OCH0O7uoThP7oKdYnMuZrrNK/2zMH5yV+n?=
 =?us-ascii?Q?r4RKQO9CIuC9Sp31jQVMCGShZnIANJ95vZ7iBt+GOVIoo/hpRcN5Y1+Sotpl?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Z49FbMKyDpGP8AE5dDP4k8zoutQftuHQUzDCDQSjMog22jNo61ZJZwDL2GPaxAE6rAQVkdZcvoEEHWyxJIbJzHSPqggAj8H+qcEwH4zs0erb6b9KvMDFpgMMPxTZzFyLlweBAGVsyfryxyZA1ZCn3CwmimJlxNaXTzpBhesHsnvHPjwrQ2vDBJzClHs3hunUvPy3fKURGVjMCg3BoFIeVgi3OGPIoel/8HNOgNJOT1PJ3C6HoNn48TLPo0Z9yPgdqd+UM8heV9o4Kxu1B6uv4Ia4FKQ8deg4u/b0TR+gVAmsyucNc7iNtJDAeYWNtWuNfDxb16lOfoi0Cv3ndT6dPoJjCq23vOTN/PPMh5oD0G8VD5xc4pHLKvJnz6WFyZ5B7Lkt5jNi/ABpfAjF/5fCXQ88wv23jRF5mhpIg/1LEWPUSkHYprZlf9Z9p9XlCGtp3QkowiTGN4igEpPfVcCkHC1e6zzO1zE+op9Exar+7d5ebMQMXtEOo0zYRN0+SLdUaRO/d5XVE7HrIX1qpwQNSMhwwm9YFh+5RoQTsir754Tod24bPgyRBEnIy6GUqvABZABMygDaACUbl7aXlanjj2ggiXViA/1h5CQ4JM+EgLI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4a7b7f-f110-4a69-4912-08dc81a3d650
X-MS-Exchange-CrossTenant-AuthSource: MW4PR10MB6608.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 18:59:45.7048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L2X0tM4ON0JQwfvI0TLgspS/nWNbCebm50kY+rUt48gNKEdoxZDrGQUZhyb/scKgWxhcQ8u+ep7vJu4VNsWoMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6255
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_12,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405310145
X-Proofpoint-GUID: L1rU1a88SBxd8EK5CaFgNVckMEmPr29i
X-Proofpoint-ORIG-GUID: L1rU1a88SBxd8EK5CaFgNVckMEmPr29i

This lets the build system determine whether a variable was
explicitly set via ./configure (the assumption being that
if you set something explicitly, you knew what you were doing,
so e.g. if you set the --systemd-unit-dir to /foo/bar, you
have also arranged for systemd to look there for unit files,
so the build system can install the systemd unit files there
on the assumption that they will work).

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 configure | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 462548bcc69c9..fb9a45cda1b77 100755
--- a/configure
+++ b/configure
@@ -17,13 +17,12 @@ write_make_var()
 {
     local val="$(printf "%s" "$2" | sed 's,^.*=,,')"
 
-    [[ ! -d build ]] && mkdir -p build
-
     if [[ ! -f build/.config-vars.mk.new ]]; then
         echo '# This file is automatically generated.' > build/.config-vars.mk.new
     fi
 
     printf '%s=%s\n' $1 "$val" >> build/.config-vars.mk.new
+    printf "override CONFIGURED_VARS+=%s\n" $1 >> build/.config-vars.mk.new
 }
 
 # Write out build/.config/*.mk and build/.config/*.h, which are the same
@@ -115,7 +114,9 @@ above stick for future make invocations until "make clean".
 EOF
 }
 
+[[ ! -d build ]] && mkdir -p build
 rm -rf build/.config.new build/.config-vars.mk.new
+echo 'override CONFIGURED_VARS=' > build/.config-vars.mk.new
 trap 'rm -rf build/.config.new build/.config-vars.mk.new' ERR
 
 for option in "$@"; do
@@ -173,8 +174,6 @@ done
 
 echo 'Writing build/config-vars.mk'
 rm -f build/config-vars.mk
-[[ ! -f build/.config-vars.mk.new ]] && \
-  touch build/config-vars.mk
 mv -f build/.config-vars.mk.new build/config-vars.mk
 
 rm -rf build/.config
-- 
2.45.1.275.g567cb0950c

