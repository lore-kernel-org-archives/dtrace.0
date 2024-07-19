Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BB81482E4
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721418773; cv=fail; b=DqCMwmprVAMOiKjkPQfLLjycf0RQidJiYZ7YXutfL8u9qjHySOr9LggO6VkEaRYDZLLJpeZH7lApIGQRPW/5TbjEKucc7d6ZFWT5Ezh0nYdL2u6y+iDDUPloQshDZjLJEJwDfb3xQWBuwHuw8qNAhVElBtNV5/CkQchMc/SM27g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721418773; c=relaxed/simple;
	bh=PlAIk159wJV0NsrqwfBOr/KYmZzEeaCm0RfstAzcr4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ls0XgPiPGAN0fpkGaxBcEnaunKzpzb+W3qjyZ+2G/70M07GouOGWFVXOf/miUnQaK6QRC8ZHsboX8CmNnnQEXORyrVgXosMWaz5pqXGgQW/mjm3ZsQcqMu/NFpf8+mV45bqUSiOLSi6kl2CZmLG1NdYy4786+0rIjA1G/g3lHu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dbswOL+k; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=lOEh5djp reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dbswOL+k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="lOEh5djp"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46JJjq5Y017226
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 19:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=JfNJHrF4kFBqYJOngo2Le2qor0HMvDltM8dYrQpjVSI=; b=
	dbswOL+kcBjqcUnKaIqhYxb4QPYpJ9djCUT9s1TgC70ohSEIK/fsGn7wcdh/nMaw
	wxIXCLXivGE6lW4GuA68y7616qv68wRfGjFLbLNOJcQ7H1NT1MWSRJoCrmwlb0sp
	gOPWdQewrFIQda2N+FFheR+hJfoh53dyGdilOX7Wl2sYu4z91k/jAaAsA8xarKbn
	kp07AoAVC356szWyItypdhLQPgBT/OscPyD0rOd4Ictb8j8UAbizIPoKQB0mPfUu
	v2WkLP2h/JYI6zDvN9sU+CDR7cOg2/c7O+cK8LSqHo2zctFsDq3RgZud/ZhvenWf
	9CuiHIoqXH1yOnKF+Z2HMw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40fxk0g0fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 19:52:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 46JJDUUG006877
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 19:52:48 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40dwf1n8g6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 19 Jul 2024 19:52:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ixlalx2gdKMJneM/jqT1sk4GmYI4Cm9S6MnX9G7iL4tgs7XuLcJ2ALT4bIhFTdSxoenK3TkvLHWSUQiWgS0JxbFyq3+69rN20ClIKhooEScNPUfhXW5NKBFcyXn+XG0Y16Go0XCs8iSgD2OrE7/tw48jhZ359hfVDa4uZJ2rmvHssm2YuzBssFaaqJr/ZsH59vUAx3izdc9HKeUaplxGnIDIzF71cwN4lgsfOQYAPXJTket8RJBgxSSC/IZ4kifaZQjczXmOyKZ0mXKOZHmEXkqtorXzJ1ZuW7EUgDZ3IYB6O+TlqMfS1qFe3aWD5taAsGhhtoI1WHb77lPCof4PUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h177dx1JrUzHH0W04hDrxWhN0Feua/rnWRFsbzhCmfc=;
 b=noj0LSzwkFFe94vsfuN7EkhELrLnMbPnWlS+d4yKRDAAcsIsmKm5h6YA+t06SEMmYTazGs6JgqciVFRsjKNCAI5Z8zOqhXI3Da+Q7R8qL330StQE05X4ZZW1yarzhkj0nyOw7H+iimjOB45wzGVGywcCDfjlsIrAXTEEy0+G3NqqL0/yFSWhnFQim1jZuKmg9UYj9ILDDcpbq/HnQZzU61l97xHZvHhfYeHz9/gvA6arIfzYDANaNYWTxvHrA3RfYdSVf03klE371jS92WgkD7e2kBrkN7/kfdXOzIjqbS4ULxxvcz3CiVXVH0EnKzTFCPINuAp92/uAbh6pHCbPIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h177dx1JrUzHH0W04hDrxWhN0Feua/rnWRFsbzhCmfc=;
 b=lOEh5djp/fHQ23/UB6EOf5gFTMltAMQgqTpgzi2MPkSbtESurZrLWEXGSqxSkx2cDghkotQ7R9FQ00wIt8cmg+/hkzPVo7NDhLznnWJ3oMQGQIxrRJ5vrr00imSyH9utJnPTEQs16pqstMPoWrOZtDTqX8aau4b7O9lIaV8kcgk=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM6PR10MB4140.namprd10.prod.outlook.com (2603:10b6:5:21b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 19 Jul
 2024 19:52:45 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%3]) with mapi id 15.20.7762.027; Fri, 19 Jul 2024
 19:52:45 +0000
Date: Fri, 19 Jul 2024 15:52:39 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [PATCH 19/38] Retain probe descriptions
Message-ID: <ZprEB/BAGndM2Rxr@oracle.com>
References: <20240627053810.21928-1-eugene.loh@oracle.com>
 <ZpmINm9hojBpvWhP@oracle.com>
 <18d5f183-bab9-680a-a29d-6a7f76b60197@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <18d5f183-bab9-680a-a29d-6a7f76b60197@oracle.com>
X-ClientProxiedBy: LO4P123CA0449.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::22) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM6PR10MB4140:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d560aac-01b1-4532-0462-08dca82c5bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?qGEPB2fqiVTa2VBkdDhkMPuTa7lvLr04BWPCl5yz07BRp/5HPd5DgJeFfn?=
 =?iso-8859-1?Q?zRwa/ANrRcPfVNMAGVnmh9DcOaVjUmNrr7TgeHN4TfVWrFeKeKtjZMJ1qC?=
 =?iso-8859-1?Q?F5OvXMT81+gzp5EpwowG56pgo8lYF1KmZEOuy+FSLp/exgmju2MANMAmIa?=
 =?iso-8859-1?Q?Fub+ot1Z+kywXsR/T0ltCsrLBROdBD5mR4l+k+wLKoYdOACN2aXfnYMn9t?=
 =?iso-8859-1?Q?hP13OIga8fHGgGvE2s+uRj9V9AI6N/syBbk57F/0pEArkVeJMu8D9b3Dfa?=
 =?iso-8859-1?Q?JOOUibwMl9CW3ctg4Ijh5vn4SMWK3WCDyNDv7ucZ+ceDbIXDqBhgzt0HQb?=
 =?iso-8859-1?Q?IKSncQRjM+zL3LjpUnMR29Q4ulzmMeZFiKB1lXTWbyJlb6k3nmmCEwKTtF?=
 =?iso-8859-1?Q?DQOhkKhUq5Qr1++trooZYz6r7mySs6dKwci6llabA7k0FvAqaNqOWDTJmq?=
 =?iso-8859-1?Q?Meuz3HAgaPQFMP+uqowUlaT97i04Jn5+c7QNs69Qajr1gKNW3nqYs44W3M?=
 =?iso-8859-1?Q?wEtCd3+I6xRsQ7m1hfQMz+xPCeiTd8wcpEH+KaPx8ostCn1l2PFUMTZJqj?=
 =?iso-8859-1?Q?tBEUxpnLEiUexgmvJJ5qxg0USgs4bm6MunOYVZ8jOvJktmDlSvLiINp5O6?=
 =?iso-8859-1?Q?PcV0VGAzSDLjz+RAWYYrWvFBY9AqT9S7Hvzo1ZNbsAaVuvqYx02rqpkS33?=
 =?iso-8859-1?Q?nTpku6Kfxk0aZwcfgdf3l+XC2flnDUzWoekf2ODpXyCxEo2OQ1HTa+1r/z?=
 =?iso-8859-1?Q?rfIBQTBdCK8agFvjTufb8Gc/7oGLDld5ciTLsjijFFHL9rXw0IrLeMO4yp?=
 =?iso-8859-1?Q?9M61gVcX8/qYEqBw/YplBhXr0xlGFjUSHFrrCmzLS6EC0Dr/HYWm8YIpnB?=
 =?iso-8859-1?Q?Arl8Nwq2pCPmnwpNuMqDRwOFGf2nSA42Cem/PqM5M5pu2AbqWjqPEaY6Wq?=
 =?iso-8859-1?Q?xEwLrA728/rcoQ4iRONPDYfutQyyZUKixcILaqdXfohIlxiCZz1o0YGBqF?=
 =?iso-8859-1?Q?Ia+WqGHeV6sukANc4zDEDqcwuw7n1Dq4NIC+0F0nxsJWGKk8PpQyxIiX9q?=
 =?iso-8859-1?Q?X8jyzB9B7bMgNEOt40k3lSgmLo3kKasV7GcxcCb0l7tHWjuVmZXmB5VBkU?=
 =?iso-8859-1?Q?9mXwHnE6LfoS81/uMsL7H2QLZkpn9k5tRAxyJ26SzC6LyJAm8xE6iw3VC1?=
 =?iso-8859-1?Q?+wlRUIv3OSlkdN8C/A5r4AeIiOIkAfMU0yTtskzPxAeKoxUDgxq8P3sg3f?=
 =?iso-8859-1?Q?7g2kO/pzgpf+f9OSsD/ACWXHeHUTRtmMbOH0efl83rrUEq0qneRFlJLq+F?=
 =?iso-8859-1?Q?p5C/cZVj0vbQyWgFYm3WZP6D3YHQl0Ip5B5pjK7Pi9dHYZXIK5IQFR+xl2?=
 =?iso-8859-1?Q?n1WssttFiRkImqaCsbBpMv2qAXCidA5g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?jtAg5ylYyLivioAr5rpUOqDczekpalPrcnAksf6sdCdO2/MvFhsjp4lPjx?=
 =?iso-8859-1?Q?cOVfd+Yxq5h5xueDLAlOxXxGtlHPVp7Hi++xAjRKJ/cI6T+Mh7pL3HzKCW?=
 =?iso-8859-1?Q?kiLHXM8hsFqnHtxKgHvVhpxOJE5U+1UiVx0ubT8uDUQ4SPaN6yTOGwSQyB?=
 =?iso-8859-1?Q?Ovodx4inGiI5OawbYIKSGKRfysaPCJC8nwOruSjsNEIBtzIxKJG/tmzrdJ?=
 =?iso-8859-1?Q?gkgtC/XtNH+auXlbSFPq37l7ParhCKrfz5LuNHmkAY2OPmFZKVxPQWTOkP?=
 =?iso-8859-1?Q?UTb18VtrxKqhd9Qos2LKKX8axndYCUXkNCUfbqAOEWRiRAqHokoR9+x50+?=
 =?iso-8859-1?Q?rhvUgd5GnWCIkR82X2Dur0+eB14CFYkqDrFrJsu2twsFLmRzU7vfIiCJUf?=
 =?iso-8859-1?Q?TNRSiv26mp2/bIAhbOPs0b5ithtd/ji5sSqsqQ78OMlcHa9wu702b2u6x3?=
 =?iso-8859-1?Q?7cro0HVAnUtkHgLpqpoK9DzQRrgEh+B+J6TQrhkdLQV8D9uvPtIDmUhDbV?=
 =?iso-8859-1?Q?W1TMGNb+iMErK6uVPX+FyxoCYYQANcZS19/lZ13OivdulMU29ri9IjBGBI?=
 =?iso-8859-1?Q?EAOPklp4j+rMuOpp/OnImgrz+lTCS2SswceA6kN4Dw4Be4NWCvYSrrSEbH?=
 =?iso-8859-1?Q?z9qNLjJwfUKHi/Y5wOPU1zQqQeWssiPnCMFvji6d3JLAe8ZdtK1pYGnfL9?=
 =?iso-8859-1?Q?THHidOpurWhAolEnnb3p8qTmyEjcUEg4wBW56qJPikCcJZUo19x7QNHC+Z?=
 =?iso-8859-1?Q?BwQE/3kr/Yu1hNNIExjc+Wc7T2fbn9PwWy4z1Qi1RayOL67o65WuHy31Nf?=
 =?iso-8859-1?Q?4/e3yK+W4ZhSOrNSZ0ql1NC1kpjbtKiTN2jRqXmsrN5Ph/bBEzqZYZyjQt?=
 =?iso-8859-1?Q?gYSdg2kfGzbsHzEU73AAltlzPnBzE/ElMHQ+rEPc+Jd8reDcw24SRO7UGZ?=
 =?iso-8859-1?Q?BRAJlzCHKlj6a83/KBc0lTL1cUTyi6xsjG5okdkgIAXHu1PLcQSUPb0x2Y?=
 =?iso-8859-1?Q?88kjxMJshgni/jkW5Jk30ymwma59AC+8cJi1ol67bTaPKhjssedkHQBTDh?=
 =?iso-8859-1?Q?tDoKjPhlHcFizdIAwlaqX2lPTsBCKOR69CPfyosNtxv9eynm/Ad4qDv3gU?=
 =?iso-8859-1?Q?zb2jgMCpXrCKUXmVVdXWU7vP2Lzd+upllA4vnxPuyqU2DxAmGIlCRwiM2s?=
 =?iso-8859-1?Q?U1Yv+2PVFjmL1VtV9O7kS0APY5gdwmrl1hDUHJ3lIUIML1Yf80lbTQP4dj?=
 =?iso-8859-1?Q?zZxPYqjYAYoj/w3PjkGoZ1V5jzCVyPRF/R02zOclCEo2cP8wTCS1qrNqH+?=
 =?iso-8859-1?Q?qsdDowTySk+xuSA1Oie1SAo4duISUFp0+hfbJImlte2ZqUlYClLSAIHcPk?=
 =?iso-8859-1?Q?rInJLB3Y7lKFhao5FBHmfCi/aw+tAaQOVtMDeDl/vm591Q2GY1hRUIs63M?=
 =?iso-8859-1?Q?i78Zgu5+CBd2Xg+42bU+2IbRZkER6H63FhOll8y5WAsdTsIKzn0WDtTVdQ?=
 =?iso-8859-1?Q?sst9xazHe7DSSYax59hM/6tqvms/C+HV6YNfXuS13JkdRH+I70eMXUhU9J?=
 =?iso-8859-1?Q?KywuuMcZ5enf9sh7cmI5CQF58Qe1wu1qVmjKtrJZ2xLhFwulnJmoaTQ+sb?=
 =?iso-8859-1?Q?nZkrxFpg32iFhQimxoL25nSGS3nMQEEDdMOPn1dYfXEJD9G7QCuwXVmw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Rg5vkESDEJQkxTHqM9YVDcon1U4LsVgoccZ2G1ecbtVzP15VLdBnEnr0hCk3Ah65J8y6VCoMDW6isurgSnOhzqP+udDW8UbrB7tnIK6yYtiatAvzePH2FZU/zz+/16/5MIWUIaF+TEUi8dy5cw0iG+WkEEdq5nmgHHDlqZT3Cr9nGt/ZITBjxfNDyDfDyPLlSGffyLPQjaebwimz9LZfx/iMacoC2DGyijBtTWct/6ndpvt2NQMZJwiMvd5Eni8Sr0Gtt0FVSzWkgtl7+8xrgnhKhnhFjgjoDdb4e8sIqfW5wcVn4knJ7zrS0S5lu+66BG1jhuYdw1Jree+xsMQ3ikKLu4zKbh/b4T+SYb5LHpjND8NvYcE0TYBKSgOIxWHBdTiTEU98GEA+6yuRNZMA3otpCRvp67xfy1wc7GCJWD9wx1iqxMtG5QVjQX34q9rJD4Zx9P5rZ9jYmOJq4rsISgNpTQS1CPcZ9y1EfgcmmaziqREflja98ZmEzzucLpPZIYf08VKlTaSk4XLDSF/25DIpGv3GXPCAyjfq8Axhj8nyObp9swfl5mutKkhsZdq0E6Zy5H+4jah0lexNRYYt3+QUqwiJLBBME4HELxgTfp0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d560aac-01b1-4532-0462-08dca82c5bc4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 19:52:45.3367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCFiFP3bHWb3cjEpm9PyYZQSrcsNwMuxsfm+no1pC7+8wVg+XtKYX1WswT0OBD/4QLnp3r1AwRejxreqnB2gBrLF+wH2ey4+8BEYf+vCHWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4140
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_07,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2407190148
X-Proofpoint-GUID: X9gPvp2z_JKFYp3B5kTvU6R2zN6PltB5
X-Proofpoint-ORIG-GUID: X9gPvp2z_JKFYp3B5kTvU6R2zN6PltB5

On Thu, Jul 18, 2024 at 11:34:05PM -0400, Eugene Loh wrote:
> What do you think about replacing the array dt_retained[n] (as in,
> "dt_clause_$n") with a hash table that uses a string (like
> "dt_clause_$n") to look up a probe description?
> 
> On 7/18/24 17:25, Kris Van Hees wrote:
> 
> > I think this needs an actual description of what you are trying to do,
> 
> An underlying probe gets a list of clauses to call in its trampoline. 
> Actually, the underlying probe looks up a mask in some BPF map and then
> walks the clauses, calling them conditionally based on the mask bits.
> 
> To construct the mask for a particular overlying probe, we walk the
> clauses.  Each clause is associated with a particular probe description.  We
> compare the overlying probe to the respective probe description to decide
> whether to set that particular bit.
> 
> So, a uprp has a list of clauses.  We want some way of getting from clauses
> to probe descriptions.  The linear array using that $n was one way.  I can
> move over to the hash table based on clause string name if you prefer.
> 
> (Incidentally, a uprp's clause list is set during dt_probe_add_clause(), at
> which point we do not know the motivating probe description.

Well, yes and no.  At the point of compilation, when there is not a single
task yet with the USDT probes we're wanting to probe, there won't be any
underlying probe(s) yet.  So all there will be are compiled clauses, and the
statements they belong to know the probedesc through the ecbdesc.  So, we
cannot even count on the BPF program already existing with all clauses linked
into it so all that needs to be done is setting the mask.

I am not clear how this fits in the design you came up with.

Even for the case where we already have the underlying probe (and thus the BPF
prgroam), I think it might perhaps be a cleaner design to not just store
clauses in the clause list, but perhaps store statements (which gives access
to the pdescs).  Then, when we encounter a wildcard match that relates us to
an underlying probe that exists, you can just go through the statement list
for that underlying probe and use a running index in that list to know which
bits to set in the bitmap.

> > because
> > retaining pdescs in and of itself does not seem meaningful.  They do not
> > contain a reference to the clause they were associated with when the code was
> > parsed and compiled) and it seems to me that you are doing a sort-of reverse
> > association, and are actually (indirectly) retaining clauses by keeping a
> > link of pdescs, one per clause.  And you identify the clause by its numeric
> > id as obtained from its identifier name (which is dynamically assigned during
> > compilation).  That seems fragile and rather non-intuitive.
> > 
> > If memory serves me right, the intent was to retain enablings.  Of course, in
> > the current implementation of DTrace, enablings are nothing more than probes
> > because the probes have BPF programs associated with them (unless they are
> > overlying probes, in which case the actual code that gets loaded is part of the
> > BPF program of the underlying probe (which will be in the enablings list).
> > 
> > When we are retaining enablings, it seems to me that it would make more sense
> > to keep a list of objects { pdesc, clause } where clause would be the
> > identifier name of the compiled clause (similar to a function name).  Using a
> > pointer to the actual clause instead is (I think) not going to work becauase
> > AFAIK the clause does not store a pointer to its own identiifier.
> > 
> > In the end, this will largely do the same thing as your code (here and when it
> > gets used later), but it removes the implied dependency on how identifier names
> > for clauses are generated.  That could change in the future, and doing so would
> > completely break this imlementation.
> > 
> > On Thu, Jun 27, 2024 at 01:38:10AM -0400, eugene.loh@oracle.com wrote:
> > > From: Eugene Loh <eugene.loh@oracle.com>
> > > 
> > > To support matching probes after dtrace has started, we retain
> > > probe descriptions.
> > > 
> > > Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> > > ---
> > >   libdtrace/dt_impl.h    |  2 ++
> > >   libdtrace/dt_program.c | 37 ++++++++++++++++++++++++++++++++++++-
> > >   2 files changed, 38 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > > index 2132eda2..445cd602 100644
> > > --- a/libdtrace/dt_impl.h
> > > +++ b/libdtrace/dt_impl.h
> > > @@ -300,6 +300,8 @@ struct dtrace_hdl {
> > >   	dt_list_t dt_programs;	/* linked list of dtrace_prog_t's */
> > >   	dt_list_t dt_xlators;	/* linked list of dt_xlator_t's */
> > >   	dt_list_t dt_enablings;	/* list of (to be) enabled probes */
> > > +	dtrace_probedesc_t **dt_retained; /* array of retained pdescs */
> > > +	int dt_maxretained;	/* number of retained pdescs allocated */
> > >   	struct dt_xlator **dt_xlatormap; /* dt_xlator_t's indexed by dx_id */
> > >   	id_t dt_xlatorid;	/* next dt_xlator_t id to assign */
> > >   	dt_ident_t *dt_externs;	/* linked list of external symbol identifiers */
> > > diff --git a/libdtrace/dt_program.c b/libdtrace/dt_program.c
> > > index a4b052fc..7106c249 100644
> > > --- a/libdtrace/dt_program.c
> > > +++ b/libdtrace/dt_program.c
> > > @@ -163,7 +163,42 @@ dt_prog_stmt(dtrace_hdl_t *dtp, dtrace_prog_t *pgp, dtrace_stmtdesc_t *sdp,
> > >   {
> > >   	pi_state_t		st;
> > >   	dtrace_probedesc_t	*pdp = &sdp->dtsd_ecbdesc->dted_probe;
> > > -	int			rc;
> > > +	char			*sclause = sdp->dtsd_clause->di_name;
> > > +	int			rc, nclause;
> > > +
> > > +	/* Get the clause number from the clause name "dt_clause_"$n. */
> > > +	assert(strncmp(sclause, "dt_clause_", strlen("dt_clause_")) == 0);    // FIXME can probably drop this check (make sure the name starts "dt_clause_")
> > > +	nclause = atoi(sclause + strlen("dt_clause_"));
> > > +	assert(nclause < 65536);	// FIXME are we okay here with some arbitrary limit?
> > > +
> > > +	/* Grow the list of retained pdescs, if necessary. */
> > > +	if (nclause >= dtp->dt_maxretained) {
> > > +		int			newm;
> > > +		dtrace_probedesc_t	**newr;
> > > +
> > > +		/* Figure how big to make the array. */
> > > +		if (dtp->dt_maxretained > 0)
> > > +			newm = 2 * dtp->dt_maxretained;
> > > +		else
> > > +			newm = 8;
> > > +		while (newm <= nclause)
> > > +			newm *= 2;
> > > +
> > > +		/* Allocate the bigger array. */
> > > +		newr = dt_zalloc(dtp, newm * sizeof(dtrace_probedesc_t *));
> > > +		if (newr == NULL)
> > > +			return 0;
> > > +
> > > +		/* Copy data and reset the parameters. */
> > > +		memcpy(newr, dtp->dt_retained, dtp->dt_maxretained * sizeof(dtrace_probedesc_t *));
> > > +		dt_free(dtp, dtp->dt_retained);
> > > +		dtp->dt_retained = newr;
> > > +		dtp->dt_maxretained = newm;
> > > +	}
> > > +
> > > +	/* Add probe description to retained pdescs. */
> > > +	assert(dtp->dt_retained[nclause] == NULL);  // FIXME can probably drop this
> > > +	dtp->dt_retained[nclause] = pdp;        // FIXME I think just pointing to pdp is okay.  No need to cache my own copy.
> > >   	st.cnt = cnt;
> > >   	st.idp = sdp->dtsd_clause;
> > > -- 
> > > 2.18.4
> > > 
