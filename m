Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5188C2DFA48
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729778; cv=fail; b=kwPwv/IXR9vk2O7KyNc4P186a/V5VZGuxBdteLEj7KpxVtr9nJWwt8Pi9+3QXRf9QOuGpSxFRB29VPM1KRZMMtGyGqSoONrDf4IK8UUI9vGILAYtavb/ZGiogwHzevlPeIvf8KZxuxCeFqyPR8nWlOwV5aRWLrAMMeGezUIrrOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729778; c=relaxed/simple;
	bh=hZBjAaWUhSFGe3GrUHiUeY1jQf60MZyyjGAH6g5vZnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PJ1YxMzvPIuXRK4I+SyLk8+VKl2W420C65pP5hme9B9IGg/bzqmBbS9O2ICoHfJKBOFyLvJRJEt+Wu8LPwrQaJB26zMrmpCx2qPfUbpmPEYUqf9nhfs43znOyPcqe4sfrHpnld2QJZUvhee4i+yeWMvXrlcJWdB5L173/WdBI9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=KGtWVTz1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fnCnQl8+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KGtWVTz1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fnCnQl8+"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FF0x3G015578
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=kzckgzmBtDWNPqjdma
	0g+3SNCS/7SZMO+wSo8dZFRrc=; b=KGtWVTz1LrHkfHYUMaNRsT/jESVJmlYD/2
	a0m82jkC3Uy+YXuWUK44c3/H+trg/ZDzLCff23c1cc6lUu0ixnC4scR8rsPlUwL4
	fqYqVEF9/hDD5koTv9FD7qxrSikvYOYHHAGVXSdXPnHTpUERSDQORchxamdk1Hbg
	z1yg5qmYxYkCcI4EHm2bQnQ8rKfThIWd8KmvLpNe5eyCSw/3WHsRz3y+JMEJbPwW
	QSl8aO8NjzxQPuFC2A0QUOMSvAbOpeR8cakXxYs2W+5oQ3mtahrB+PwmgAMOfAMF
	E9MoXTnZ/mInwxez0bbGd79M8VNvRlNr3pM8MJHn6QCmUVfzjZGQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619441rq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:09:35 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53FEGJE4024716
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:09:34 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012054.outbound.protection.outlook.com [40.93.20.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d50esc8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Apr 2025 15:09:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdUvWapmDONT/2MpphiiZou7KMjL5u71+dB0r1mOTL/Q3gGqrFgfPygZYrSFS1n4j222wZ12Kz8QaMD1mH3UcEnw2hcwSbs/HQmyxT6dTWnsYQNya+ygMOmJiG1FDFBIOyvzNlTFGh9GO+4skNMeRfMX8f5yBG5ptBTCVtn1OVy2i6nVuXZC2Jq5nOHlNtMALk6aDoflbS+3yUKGhqrp0bxiyH8U1nLlOGvkKdcKfPWrwTjwKTHPTts/YWRHscVTSO0wqYU5V0jFp9Sux9EaRs7BKC1SxxAkuZi+Yefb9F/UDxmZdmuRZ1vi3bwF18zoOBOM0WjzEvUTL7vutCA59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzckgzmBtDWNPqjdma0g+3SNCS/7SZMO+wSo8dZFRrc=;
 b=kNXMajXef/n3/yuENy9r0EyhSeaEIblta6OzCJvyKsz1P6oC3DOhxRTgHmNfJ4t6ZFcwZCwy6PXfU3qOvaFDV4+0ylTL2APrMEhStvU6uOJwtMqwZ+9UQ1pYiaU/SalEnp/OIbd5rO/fDU+yUTQnFfeJDTd0UstExYWBIm6n1quo34ZhvpvGwY9ejA883FU6hx3Klt3hzap7oVE4xkskyZi4R/eGLs162vLgegl6noJZrKqTu8Jxnpw4cc7RV81OugM0Gj5eDPXIcd6afWaRihBpLymCLY4EkbBhSWTwzd5DQfEDheR2bNkzdtBIASTQ3vNkHf+jujBxoCQSDsN+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzckgzmBtDWNPqjdma0g+3SNCS/7SZMO+wSo8dZFRrc=;
 b=fnCnQl8+CouDJTxVV3xz8Zfz+3OsDvwD/S6K/fQt/8imQ1GSIfQyJOVn29BFE36pmDRHg1u+ujXBdlXdknc4YaCtWGiQchhfLSGnjTCpGspXvkR0gmNiYO46EiRZL0Dx/AIPJeBr7WdC9yvx/XUp4oErUKgglT4uNWo457f2Xco=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by CY8PR10MB7268.namprd10.prod.outlook.com (2603:10b6:930:7d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 15:09:31 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 15:09:31 +0000
Date: Tue, 15 Apr 2025 11:09:28 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: eugene.loh@oracle.com
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test: Test fds[] member fi_fs
Message-ID: <Z/52qBL5jtYwqytQ@oracle.com>
References: <20250414224057.3287-1-eugene.loh@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414224057.3287-1-eugene.loh@oracle.com>
X-ClientProxiedBy: BLAPR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:208:36e::12) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|CY8PR10MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e4d162-44b7-4fcf-77a2-08dd7c2f861c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LIQiSF97PeSvEwKN7UaBK3Vep5IBqNsHrRQLiJsr7sH8T9mEq36ousyT9ze6?=
 =?us-ascii?Q?1vT/wZUUcv1umd8S7mYUcxn4ue5a/QPaC3zZXKd4bOXBEzkVE5eChUV3EfRe?=
 =?us-ascii?Q?TxhiV7/6lNYFK+QW9Ej2//0wT4RWlsFkULL7gHQE5Y5UtqGDS7qajrAFS8tg?=
 =?us-ascii?Q?4kcicOdSijhSd8tLvF5Md5X4RlA8xullw4+3ZUFXkTffL+fnFRLaSUArKeu8?=
 =?us-ascii?Q?3X4zE8aTbRC+4DTIQ3En/dWwVTYUYNln+hpOZ+KJlUL7OMnvTJ3CMpwqsfPt?=
 =?us-ascii?Q?/UZe+vE1YOfq3omNUBXgmBgNZ8Df/lvs95uBCPNZO1FVDLfpsoJCjMbipEMb?=
 =?us-ascii?Q?hPt9FH6b5153fzHd2e+Dszg3JcDP6XsNxkBI6DnMy1snWiYvqny746eEHMR7?=
 =?us-ascii?Q?ysMxJZjt1KVGCYFG+lGpXQA1yEMy49VzsGKKGWEgfl0wnrm0dVBWi2vYWd4J?=
 =?us-ascii?Q?gjZDiv+YLAQo4PV4Grl2FVKX7YwGL4jKc2L+sVtMv6uxuLij8469u44Mx5B3?=
 =?us-ascii?Q?BNr3jaDmnXkjj+Z5oljaiFNqLitOm/fjKWfSQYAgb6p0PsmwnyL+FS8TTH1f?=
 =?us-ascii?Q?j1LrdwkkHqhAcLFfguFscgZqypSmOAk9K2+AcTXig4BUCeH7Er5NcAlD5koP?=
 =?us-ascii?Q?RMbkrdTNR0krx5o3r8D0/rgxcV0bjvFQRXHN1UqhM6OtkYASue308U3Y0wxq?=
 =?us-ascii?Q?ehtJKua48j0rirqp62omCGvT6gJ0RkCNpI3m/ROa1rCH8OToLZp73FXHWhPo?=
 =?us-ascii?Q?QLFjHZOkYb7Ny/0C9q3VqVBaRMr+P3gdIwxJU473jabBg2MMzuobIWKpnzUd?=
 =?us-ascii?Q?p5+RZy5UEu+SAzx9eEeFla10aHAGw2igv3FcegFQKw8THWavsEvOnlkVK1cY?=
 =?us-ascii?Q?1aRe6LyRbTPXeUicQmoxdN3pfrmyGUR4/FTosL1NjetVOvSRqtRtf6dSK7Wl?=
 =?us-ascii?Q?ggzA0poqxZgLYl8t6KcBJoMtMy/bAEFUewS1WGBEMaTR4a/d1RK0qABu+6hO?=
 =?us-ascii?Q?IMKGL0jZhNOoJR3+TCedu8vHlWjP0hqWDLzw4uvd0PzzmhK9DHPq/LkJTizn?=
 =?us-ascii?Q?AfO+8USJWwFm0GkV/s8tjcZ9BLiLIAxdcEOAn39ydWUmM+zpb+XSOpul+Q79?=
 =?us-ascii?Q?mWPP5FZevi9XZ2CO1jKRJRe5RrX6nymjU6Kl84TqJLKcnCCXtwVHRZ1CBsDt?=
 =?us-ascii?Q?DlaU8k1eodJGiWEAeXCqZ3H/SBrg+i4cjbM10lPsUCn9TF8sNg3t279Xmf7o?=
 =?us-ascii?Q?ddfpq4QmCd5vYXJ/VdZwoKvFO+LgNOlb8IcR0gB+gFjCj4w8c2qq5xxE1Guu?=
 =?us-ascii?Q?Ij7IIo0g4vvqst8iveUm+XJmvS2JDjvCJAnM1dXOstp1wvqWX6joYrdz6KK7?=
 =?us-ascii?Q?Fz1zGsChp0kf+AvrRDC4bS5x+DPWR0Aq8ScVAAtFXRTB9T6EDy3K8J0PaqiT?=
 =?us-ascii?Q?0wvE8o4irpw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u62wMpcUU68kbe1ua2oCbQxIyLeF8PEW7HOlSSQY7nUUnna9zXxKqkDoMLH/?=
 =?us-ascii?Q?ljfoRwX3LUSttWbNlK0Irm5oVZnR3En+Izv8p5xV4GwH4iCFHdo0xEr6kOPx?=
 =?us-ascii?Q?x1lbKCHnBxtpN0Sg3jL/tvx5YnSRADAdMLVlLolhKfYO08FwcpF5c9UKTbqE?=
 =?us-ascii?Q?wF9+o5jaeUz/oSc0KxpKzWQ8MBEZAKkUfZ4DuBkOa09DcptpzKuqExiD+NNL?=
 =?us-ascii?Q?S3ulsDOQHRJ+vbknWPhs+FatlOQiE66L4bM5gIJUUXwGXh05pgiVnDOLvMSi?=
 =?us-ascii?Q?XRFVQBO00sSr/MACGdJ3DDKX2V03KXkuo58wC4d4F1nJ0SIkErHeN459URcd?=
 =?us-ascii?Q?ZP7I46u1w9mb8k5AsJUgq7Ro1gM/mNLgpMaEWaUKHlvoIEXdWpZtwESVvSnC?=
 =?us-ascii?Q?0PwFerC4BfH9iIQsJTFeijtYQbg2l3qdxHQkpJVIuHl3gOdkPJizX50TVM2Y?=
 =?us-ascii?Q?hvsJTnOimhBixPc3DX5vdtGjAYkUKpFmyGyoBVs8RUGwY1yyhhJSLnEPTzaZ?=
 =?us-ascii?Q?BJ7oNmMKvF9mcCe9Rl0OGVIvo+ePEuaufgR2mIXTnCptK0BjhEhvobXABOxr?=
 =?us-ascii?Q?oeqnM2AJURJhQfwQEgdnZQt5SINrZVD42HJb6h+r+n/J9OAQmf71FTJV6w2L?=
 =?us-ascii?Q?hFAmKOu5IAYfjxmP743Jg6qVsmV/39anWJ+OxMzOedLdrxnz7TiQsWOqATge?=
 =?us-ascii?Q?u0HzGvY6bMNLUPuK3PvyIBpqmUhaQxJXd3oxPwDSOgjm0ZYl1C9ExztSUtKr?=
 =?us-ascii?Q?jIAL608io11JFwP2RrQaCDo3RHl/KAnEYgF2hLHcBKXHkWwxbwp195dkFJGe?=
 =?us-ascii?Q?2yoJj6fKsDcSMir3FHuADVeC7vTY/74QNxzuIEgoyHr/RsLmA3v1f1Z9A3g3?=
 =?us-ascii?Q?23gW3YksCNC7iWgpDsSqot022NLYSxNjPsQG4CCX7YItp9SW39Kmq6FukhPq?=
 =?us-ascii?Q?4H5/VofDa0IkdjSQyc9onGXBPvNB0nCM/TDSWvg1Vqrhq1ZtPXdIZaAP7XiY?=
 =?us-ascii?Q?28E63dub203AGf9rm6UEcnWlxz/Hd+jBiCLAWFNdcdroa8ic2meageHcnDSX?=
 =?us-ascii?Q?1vZ0fHvw35OxvBjpZkr1qcjA/jZna/aYyEv0fm6tHCKNRUN9g6UYLsTIv40d?=
 =?us-ascii?Q?/ne4Rh4tu4LLC+jj6ooxVIlpqY59F00u8B1xbC/m3pdo9kY1jWIBfW62Xv6D?=
 =?us-ascii?Q?ESc9X0pKkccwLOLRGG6sanoJKZ3bcLXl4vYLxAd9AIx4VvaZ0T9Rc9LPPwps?=
 =?us-ascii?Q?nS6bXMyhNEwHJqJlw6m5mmLjbYsGjV2Lp4I1agzlJWaY6OroOOG2bx0FFuj8?=
 =?us-ascii?Q?3dPC1jxrXglp3ixRFJjkEMtQqrsK3xKprIUQyG6biu0tPr9WEOleBkgp+x4x?=
 =?us-ascii?Q?/SydmB2Aq73Sqlk2TXbFqFZGD+YEA0xEOyWFIxUEWDywf/cbqI63KRsuzzk+?=
 =?us-ascii?Q?wtJ1b7cqHzTvRlsbOZD07OSmoZgAnfj0lHLuwfrDMBky/M3+p2W8hR5/S4DA?=
 =?us-ascii?Q?1nA+FMGHRIM3H/sqIaMbAlUoxLopedM0NqoU/WkLV692+iEpjGWKgykuuFrz?=
 =?us-ascii?Q?z3klPQSaXRRkPqF3z6rd+GKqHpSlttWWVPbCdajmVSzPpnoEd3mMnx6zIJTG?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	atBaXk4shgGVSpPVVG3XecXlAQu+jt14gxurO5yfJ+kO1dA1nxq/xa1QpJCMGM4ekvReO0aXYqIC04ysgibHCoDkLTDvAP4ynmx8ojEb5MdJbmeY7L6Bgnu72cSsTlbyLPS1LiE8CWfp6ydGEykWqDPqARqRmaLEGnC6UKcMFh9gjnKk7X4QUCLMkHCtVRnXkyPXMM6S6G+TUrzQLeqv8SYiAknKbxJ4ZVYT8m0dKvLVoGGfWtRgiQrxVG2G7wvzb4MkFzhewHFXOAGjLLmf030eFSoawEvqfiNR6DbDx4Fd658xB+QP24sRLlXJ1DS175qPj91EtL498cx6gnTBGA7VKcYc+d0dwUjlOF80wknBwAf+19hg52w1Rrj42ktkLQjIV72HL2ZY3DCuJdYUHJmTJuLsneRniS8G1zfAgLvvbktTfNo25uN9DBxZr1IP1NrakM124leNIhgOJTMEKrywHWaPsAYXTEj/jafIFp2GGOgZs1peZAwUcZPbtaxsW0cB6dDO6ASVIA7oq7/+3Z8K589kjUEV8XsQlpDPD8uDt0VFqY3eFoO9cTbPDYGdnYpT7sckfvVoCZKcIc/J+J++QBQop2851PKRX2Lfarc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e4d162-44b7-4fcf-77a2-08dd7c2f861c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 15:09:31.4040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9S2DlSXHEJTQHJmfSsHtur8ZaPWa3HjwA5PHZ0e4+kH0FvwL2iSJ9licugvEU3tv2r8M7QADrcYZreSEfwISssnmWSJlg6KJ0FYKQfetc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7268
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504150106
X-Proofpoint-GUID: Skj2B-BfRyB219lNKeCtt-PdUxONLYrO
X-Proofpoint-ORIG-GUID: Skj2B-BfRyB219lNKeCtt-PdUxONLYrO

On Mon, Apr 14, 2025 at 06:40:57PM -0400, eugene.loh--- via DTrace-devel wrote:
> From: Eugene Loh <eugene.loh@oracle.com>
> 
> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  test/unittest/io/tst.fds.aarch64.r | 5 +++++
>  test/unittest/io/tst.fds.d         | 1 +
>  test/unittest/io/tst.fds.r         | 5 +++++
>  test/unittest/io/tst.fds.sparc64.r | 5 +++++
>  test/unittest/io/tst.fds.x86_64.r  | 5 +++++
>  5 files changed, 21 insertions(+)
> 
> diff --git a/test/unittest/io/tst.fds.aarch64.r b/test/unittest/io/tst.fds.aarch64.r
> index e1160e5df..762f122e2 100644
> --- a/test/unittest/io/tst.fds.aarch64.r
> +++ b/test/unittest/io/tst.fds.aarch64.r
> @@ -1,29 +1,34 @@
>  
>  fds[0] fi_dirname = .
> +fds[0] fi_fs = proc
>  fds[0] fi_mount = <unknown>
>  fds[0] fi_name = mem
>  fds[0] fi_offset = 0
>  fds[0] fi_oflags = 20000
>  fds[0] fi_pathname = <unknown>
>  fds[1] fi_dirname = .
> +fds[1] fi_fs = proc
>  fds[1] fi_mount = <unknown>
>  fds[1] fi_name = mem
>  fds[1] fi_offset = 0
>  fds[1] fi_oflags = 20001
>  fds[1] fi_pathname = <unknown>
>  fds[2] fi_dirname = .
> +fds[2] fi_fs = proc
>  fds[2] fi_mount = <unknown>
>  fds[2] fi_name = mem
>  fds[2] fi_offset = 0
>  fds[2] fi_oflags = 20002
>  fds[2] fi_pathname = <unknown>
>  fds[3] fi_dirname = .
> +fds[3] fi_fs = proc
>  fds[3] fi_mount = <unknown>
>  fds[3] fi_name = mem
>  fds[3] fi_offset = 0
>  fds[3] fi_oflags = 121c02
>  fds[3] fi_pathname = <unknown>
>  fds[4] fi_dirname = .
> +fds[4] fi_fs = proc
>  fds[4] fi_mount = <unknown>
>  fds[4] fi_name = mem
>  fds[4] fi_offset = 123
> diff --git a/test/unittest/io/tst.fds.d b/test/unittest/io/tst.fds.d
> index 06caefe4d..2ae2a33b2 100644
> --- a/test/unittest/io/tst.fds.d
> +++ b/test/unittest/io/tst.fds.d
> @@ -32,6 +32,7 @@ syscall::ioctl:entry
>  	printf("fds[%d] fi_name = %s\n", arg0, fds[arg0].fi_name);
>  	printf("fds[%d] fi_dirname = %s\n", arg0, fds[arg0].fi_dirname);
>  	printf("fds[%d] fi_pathname = %s\n", arg0, fds[arg0].fi_pathname);
> +	printf("fds[%d] fi_fs = %s\n", arg0, fds[arg0].fi_fs);
>  	printf("fds[%d] fi_mount = %s\n", arg0, fds[arg0].fi_mount);
>  	printf("fds[%d] fi_offset = %d\n", arg0, fds[arg0].fi_offset);
>  	printf("fds[%d] fi_oflags = %x\n", arg0, fds[arg0].fi_oflags);
> diff --git a/test/unittest/io/tst.fds.r b/test/unittest/io/tst.fds.r
> index d7c12b86a..b5fa2df95 100644
> --- a/test/unittest/io/tst.fds.r
> +++ b/test/unittest/io/tst.fds.r
> @@ -1,29 +1,34 @@
>  
>  fds[0] fi_dirname = /proc/#
> +fds[0] fi_fs = proc
>  fds[0] fi_mount = <unknown>
>  fds[0] fi_name = mem
>  fds[0] fi_offset = 0
>  fds[0] fi_oflags = Please customize for arch
>  fds[0] fi_pathname = /proc/#/mem
>  fds[1] fi_dirname = /proc/#
> +fds[1] fi_fs = proc
>  fds[1] fi_mount = <unknown>
>  fds[1] fi_name = mem
>  fds[1] fi_offset = 0
>  fds[1] fi_oflags = Please customize for arch
>  fds[1] fi_pathname = /proc/#/mem
>  fds[2] fi_dirname = /proc/#
> +fds[2] fi_fs = proc
>  fds[2] fi_mount = <unknown>
>  fds[2] fi_name = mem
>  fds[2] fi_offset = 0
>  fds[2] fi_oflags = Please customize for arch
>  fds[2] fi_pathname = /proc/#/mem
>  fds[3] fi_dirname = /proc/#
> +fds[3] fi_fs = proc
>  fds[3] fi_mount = <unknown>
>  fds[3] fi_name = mem
>  fds[3] fi_offset = 0
>  fds[3] fi_oflags = Please customize for arch
>  fds[3] fi_pathname = /proc/#/mem
>  fds[4] fi_dirname = /proc/#
> +fds[4] fi_fs = proc
>  fds[4] fi_mount = <unknown>
>  fds[4] fi_name = mem
>  fds[4] fi_offset = 123
> diff --git a/test/unittest/io/tst.fds.sparc64.r b/test/unittest/io/tst.fds.sparc64.r
> index 71cc83095..89579e176 100644
> --- a/test/unittest/io/tst.fds.sparc64.r
> +++ b/test/unittest/io/tst.fds.sparc64.r
> @@ -1,29 +1,34 @@
>  
>  fds[0] fi_dirname = .
> +fds[0] fi_fs = proc
>  fds[0] fi_mount = <unknown>
>  fds[0] fi_name = mem
>  fds[0] fi_offset = 0
>  fds[0] fi_oflags = 40000
>  fds[0] fi_pathname = <unknown>
>  fds[1] fi_dirname = .
> +fds[1] fi_fs = proc
>  fds[1] fi_mount = <unknown>
>  fds[1] fi_name = mem
>  fds[1] fi_offset = 0
>  fds[1] fi_oflags = 40001
>  fds[1] fi_pathname = <unknown>
>  fds[2] fi_dirname = .
> +fds[2] fi_fs = proc
>  fds[2] fi_mount = <unknown>
>  fds[2] fi_name = mem
>  fds[2] fi_offset = 0
>  fds[2] fi_oflags = 40002
>  fds[2] fi_pathname = <unknown>
>  fds[3] fi_dirname = .
> +fds[3] fi_fs = proc
>  fds[3] fi_mount = <unknown>
>  fds[3] fi_name = mem
>  fds[3] fi_offset = 0
>  fds[3] fi_oflags = 84600e
>  fds[3] fi_pathname = <unknown>
>  fds[4] fi_dirname = .
> +fds[4] fi_fs = proc
>  fds[4] fi_mount = <unknown>
>  fds[4] fi_name = mem
>  fds[4] fi_offset = 123
> diff --git a/test/unittest/io/tst.fds.x86_64.r b/test/unittest/io/tst.fds.x86_64.r
> index 799e85623..34172b2a2 100644
> --- a/test/unittest/io/tst.fds.x86_64.r
> +++ b/test/unittest/io/tst.fds.x86_64.r
> @@ -1,29 +1,34 @@
>  
>  fds[0] fi_dirname = .
> +fds[0] fi_fs = proc
>  fds[0] fi_mount = <unknown>
>  fds[0] fi_name = mem
>  fds[0] fi_offset = 0
>  fds[0] fi_oflags = 8000
>  fds[0] fi_pathname = <unknown>
>  fds[1] fi_dirname = .
> +fds[1] fi_fs = proc
>  fds[1] fi_mount = <unknown>
>  fds[1] fi_name = mem
>  fds[1] fi_offset = 0
>  fds[1] fi_oflags = 8001
>  fds[1] fi_pathname = <unknown>
>  fds[2] fi_dirname = .
> +fds[2] fi_fs = proc
>  fds[2] fi_mount = <unknown>
>  fds[2] fi_name = mem
>  fds[2] fi_offset = 0
>  fds[2] fi_oflags = 8002
>  fds[2] fi_pathname = <unknown>
>  fds[3] fi_dirname = .
> +fds[3] fi_fs = proc
>  fds[3] fi_mount = <unknown>
>  fds[3] fi_name = mem
>  fds[3] fi_offset = 0
>  fds[3] fi_oflags = 109c02
>  fds[3] fi_pathname = <unknown>
>  fds[4] fi_dirname = .
> +fds[4] fi_fs = proc
>  fds[4] fi_mount = <unknown>
>  fds[4] fi_name = mem
>  fds[4] fi_offset = 123
> -- 
> 2.43.5
> 
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
