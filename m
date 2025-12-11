Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4D173
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 22:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765493269; cv=fail; b=tDfMMuL3vgRMN/oAkwQFDxOnmSpFnNxJOAnyPqolWuqFA4AT08yFwJSN5RrDW2yrVklIuNfqs1xgEf2ZLYaIl8bdyX7GnQ2B6k4yO54INEmH/FYt5Wok4mxpA47VKy+JUOBmJc7DD7Y6EsD31+fzLBhvLb8/9XhjvXfhkh0V96E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765493269; c=relaxed/simple;
	bh=kMxTduIkGoWqgLc6IqGCLyHX94mdL1svWIMUO9QncEM=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=l8HDghzsnwhhauKlB34eox4iOiXwUQhfeEADFJ781dQQgdLpkkUxJEaEzNErvLN/6N2zgBs66CdtRQn+TzK0ezLWTSkDEr+LnXJ26+MuVMlQC7cJvSk69CskXWW3cdNHvGbkwVW5IMC/dVBTX8MdX298efdpwq5P12ESgKUCsUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eQIn2KDP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=L8XTT74M; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eQIn2KDP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="L8XTT74M"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBKYhJi2357919
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 22:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=l/MVYOynWQ3klLiK/msQjGtU/lBrkiC5Os0vZ4EVOR4=; b=
	eQIn2KDP8Dd6thkBhm7rlo2KJFs7i9zmOiYyo25nmxTNRihIPYWtjQIRE+Hdtk/j
	O2v0ewSR0yC49P1zNr/4W+EA0DRN2qRFTgA3wQ5MOW/QA4fPXQPSCSUxsd+yKtCf
	fJ2Um4fPjEqAvg4x6ahx+XRR84Kh6Cwn9sm9pr1efyXnUaGF1KP9K8mFNZKat5jZ
	LpZ+T2Bya48t/4cwqvGk+DIsgIAUvr7an2cDR5io8QwVYvK76AiDav/KOh7g1GCT
	C8sd53fnXEGictcWTwqcSfV7QrWqSsQlRdkO9AgLEVCl7S9a4L8YEo45a4+OMvL/
	rLjvjqX80Urt9/d3UImo2Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ay9y32vyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 22:47:46 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5BBKL8Bu039821
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 22:47:46 GMT
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010049.outbound.protection.outlook.com [52.101.201.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4avaxp6y0t-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 11 Dec 2025 22:47:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHZjx+sxukXx2H4zKGZ/dlWLvsZHxnbwiqqR2m8RwVWyLLKc2tZQ8/MZcD5pJS3l8mYDBjI9CMsxdZFYuz6EBUjFYX0UpEjnkSfQ0S+F/wBhcrrzKE7H/dJkbkzZpNejzn0eba/BK1HIGtUJUiWs0WrrRBmWY+hhvN56T74FaTj1v+gpJR4UPRYqy8sK0lpV5kKndGLwRyHZ7gEW/eNb5uUrMwwV5+2XySWMeKu5B9oX/NE2E8j4Iz5+e6f5L9uOPeULgMNw6zRNjI1ky16KyLdUwhV3g7HKqprs9A5lhYG0Z4kUwUK3eieD0dOj+FYZiBR4dpUbCOU7BZY86TSwuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l/MVYOynWQ3klLiK/msQjGtU/lBrkiC5Os0vZ4EVOR4=;
 b=TQ0Txs1Ti4VsDilr64u7iCpZBkTWYowIriEKFarG1jQgms7h3oNrLhQOXkihHOOHQCbB+L1MqSTXETyb5x32+MpOosKSolhu1UlXXsV8pBqW9bl00SWg75qItaoRY2MwuV53T0o2EJ0mI9eyrzqUAtYCf4yVWHid44gtA7K8yW6AVVjFZEzBaSFr3+bGElYo8cTsyZ4xc7J1Swjp2WcROmWV0r9QFA1N1wlPgP/ZND/HN68ROWcqlpCv3jANDcDqvF28SR6w61EXvdLHs0GlgngzAvpe64CNjYeZjGqomIBpm8baIxgwVZOmu/nOSZOzrY/jCaca/8uW7UgRuRg1lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l/MVYOynWQ3klLiK/msQjGtU/lBrkiC5Os0vZ4EVOR4=;
 b=L8XTT74MRVjtrcN+S5v0n/lgW+yrDRgmxDDC4Vuap0Iax7oArnkeg4+o+R4ZmgEY1HAr+Zw9txZ+qKH6P7e1h/Uhx8343z7fS4SP796lGx8S5Reu+HowKraXtJH8ckWdi89SiQdOcWvvHsHfF4NNQJmvbWgF7r602uFVcncucJo=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SJ0PR10MB5598.namprd10.prod.outlook.com (2603:10b6:a03:3d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 22:47:43 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 22:47:43 +0000
Date: Thu, 11 Dec 2025 17:47:40 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] bpf: allocate the buffers BPF map to fit highest CPU id
Message-ID: <aTtKDK3PIBYoWh32@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BLAPR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:208:36e::17) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SJ0PR10MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2a71ae-4e7d-4772-bc16-08de39074b92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?emng/i9vJl4o8OmODNGcozIdmTJojfhmsWgsMq6R6HxtIYm9KJZ46gTCEyJX?=
 =?us-ascii?Q?/hwfELN8QqGafKkxenUWRgHtAbRmy64sD+8t++k8PDO5TSoo+J2VTXevK4TF?=
 =?us-ascii?Q?Xi62P4pe1u6OIMeHl+ZIzstFjky1hOHtfXbhtT2dDFQDRcz9ch1W+Yr+3OEo?=
 =?us-ascii?Q?VegUpU87/JasrzdQzwhovltRIZxPJIRleYruGUxfdxKIvY9uvWpampPcKB6l?=
 =?us-ascii?Q?kMqXgTqxkpXyxylLlEhGESDgZKaL0XQA/EO6kbr8TjQjHCd4HdmyJtHSPlIJ?=
 =?us-ascii?Q?1QG3RswB/7Ubw97siDDE3sGtdvndBkQSGKZVmbNOHaRxCzDt/CpwwgHxbpU1?=
 =?us-ascii?Q?HoC536YMkLVc+Y+BLhaX5wtyABiEKBfSMWIbLZFTGPChERyTuBcp+w1N9ZKJ?=
 =?us-ascii?Q?SHLZGiIq9hzQCpThQJRsLJszk4vgv0GnA8NzfZsAd8la06HDPFK7Dwi6EO/D?=
 =?us-ascii?Q?KKLpzB9xDVTokR9OmeWCrqfk9wh9K095ZCd2GRjemKvIHJDHTusHsOPGeDhi?=
 =?us-ascii?Q?Er7GxDJt3iKW0O7zGov/M/apmrWWrsIVly0aVVmay9HjR3b5NzLalt3Mwtje?=
 =?us-ascii?Q?w1edf6wcm5qzeUq6ivhwgfjZe6MfUeEcsUBGSo0YWMQuaeidAuawo8eKxI4Z?=
 =?us-ascii?Q?PruHGyavg9OSsiLTKOQhbZTdoaSaAllF0/cqAoY6Z+IiCHYnmBE9m9NgcCpE?=
 =?us-ascii?Q?BJ6/XthkXf5GQjV6DBAaUqGA7p7UfZq//NpqKYPmlLO52mzeu61BaNbXQwbz?=
 =?us-ascii?Q?LV/5kMP930CeuFY0z0P+N0+XftOx+W1fPZVHpAnCZ8FvUkHEXkJqFKVShqgs?=
 =?us-ascii?Q?iggObtz6aTAV1jJUs8mHYWi8KxgEISvbChGnnEovSCT89m/Jd42ldFJMQxoC?=
 =?us-ascii?Q?LiPKP3jQ82pzNxvOWELGJ03V+KSFW/tYWR5obi2zfIPNK/ZpczzGUUgU0/7z?=
 =?us-ascii?Q?j64KfeYi0N3UQSeI0T5cbd1qTlJUJ8MXi+I0/Vlw+5lxRGYfDSu8X5bJGIb6?=
 =?us-ascii?Q?7tiNzgrmN3Otml8PLUP4rULw4YUP+dE4f7N0p1BNZ2eYGne0ThNh5IfBBfIr?=
 =?us-ascii?Q?Lsz9NXaRYHmjM+INS0mpDD2Bms7zJPuoole6kX+s6cdkyIXm1OJwEz59c7O/?=
 =?us-ascii?Q?82by+X04kOUXsuVrkmEMuNSOkZD4dIjpHKRrxwNf7rN4kSmtDGVddcr5UaCc?=
 =?us-ascii?Q?E7wpXPOdnE9FlqI7FsGCGcNP5U5t57HdLnCfwZy/bRljZsavLHYslprUvxL5?=
 =?us-ascii?Q?wDOYE4fRq0C9naP663qbDRcGCdni5jr5ytOqEMTS1puXPwUCMDOd2I/i/YXi?=
 =?us-ascii?Q?UrVzwAeJNXh4lsenyoNf0oP/nYRCM5NnlBFLu5loKwqaH1NNl5bMheX9UHPa?=
 =?us-ascii?Q?AVEx+I2oWGgcrdZ43B+uSyRYVMk516QeduA5tglPTPzS746VyD5NHTPIb4sM?=
 =?us-ascii?Q?vCm7phhDTixNGmRUZpm+AnuWAfZCY6eU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0cIyrjXZRIXOdJKVm+bh4JmylvoDj72wutgSB1UZvbP4BSbjVatzBdMAGlJT?=
 =?us-ascii?Q?zashVsdTLMEGia4Wl00ZUve6iIY+6efGax0jBRWV+iOxrI52/fMQu04g9TX8?=
 =?us-ascii?Q?/IiE0abOATl0tfYiJDz8fDERSMQcLqpezNKGFRema7qOV6frlbzxE717oG3c?=
 =?us-ascii?Q?y+WNaxpK7Rt3y+R5LZwAu5+i+4u7jn5e3aKv0dovqM1Xs+TIuA3vKwGHyljy?=
 =?us-ascii?Q?FTYqfX69gImgwzHjm7zy0Y4qvRsYfGy7aEUtcvS/bWKDqp7qe4KrtOgkRMKA?=
 =?us-ascii?Q?4cEHhV2DeZcj6QB/rkO6Q7ETj+0ToMZRcIgLduiVUhdFJHTRdayJ2Z43kO8g?=
 =?us-ascii?Q?30z+N8WkbXOtx1INlUGXhRQDaA+pwRmKJKf6foxSTkNpBp83MhGsDhu1y44Q?=
 =?us-ascii?Q?VUFS8JCYDIb8XS3c7b1NYUSyhHsuDLng4bZmq0qjRRO2kZ5ioYWq+OJFmvKr?=
 =?us-ascii?Q?6T/dX/csXnrN0SgeYklCzuaZTH0WC5YOukq7TZLECMh7DvfiPGqN23euS3ZF?=
 =?us-ascii?Q?Gm+p3ns7TiOc4B1vS+anSj1BazsfUg+7NraapqgWHB2A91jwdrim11EIRP1d?=
 =?us-ascii?Q?+Ls4TVfPq3Cek6el1G/dEsrGyDbJQ44/legC3Exkdoih23atREXrlFV/L3Bu?=
 =?us-ascii?Q?B9yDFXfqYxBlgpNFYQo+f57YjEoB03oym2byzJdqxAxlKUYwCRt8XEcMa/95?=
 =?us-ascii?Q?mDZsTpbRHyo7BqDE94TwagtL1ug+HPSjJRCKrKh3++46WxNl4a/6MVp6mvW0?=
 =?us-ascii?Q?vJiPkG81OXax6Hz2jjAg/y4CHBv6NkpiobNhVOMRlS/JLkPPi+s645taRiq5?=
 =?us-ascii?Q?wpyZsWNcZJQm5ge1qNB1ptUP3RE9A3nDSmi9jlxu1Pmibxgk6KUmT+4SrFUK?=
 =?us-ascii?Q?GpgMeHKh8433YID5hFK/NTlboe21yHrtWX2oVBeyccuwpTpK5K569YTlmFMW?=
 =?us-ascii?Q?D7Ts7dvz8DO90/lgn2UkawOD9IMjCRdVD2nl06QKbRQnUBsThx8kNBm9u5hs?=
 =?us-ascii?Q?/NJtYK56ovOMb33E1N0Glkkv4rQ/9yMhzA/6nVoDEBFP0ARvY5rWAwoHx5WF?=
 =?us-ascii?Q?ytoKNjwh3I60oYjgR0/KDzJmP+QWbRexqr8FFjHxzN72idpV8IP2JvvJEPYQ?=
 =?us-ascii?Q?pgCoGJgkbLRkIZQYG1Blp6/xkvP3guDi6A9QsC/D/+sLsezOdRGPaddd1REn?=
 =?us-ascii?Q?B+XySExciA6o8ZxW1COltOfNCEVsUxQJM9bB1A5NMpu923vo3Smn4jmvV2C2?=
 =?us-ascii?Q?PBhxvYdwXoFxCbjnU73kl7YRvuzbgOUTJGmakQ1SC+Ft29+JJa8MQelxqOyi?=
 =?us-ascii?Q?0Uf1lPPwGwyi4wRsQPLmB0MIHIQ12A4sgmvccCT+m+uxxP2pm2QgpArY4Wav?=
 =?us-ascii?Q?72KblyQejWcjySwyBLL1U6U1mdznZjq/iBy/XbzUOk6YcfnROk9eOit3M80h?=
 =?us-ascii?Q?Z2ZL8X9d7J7qFI29vgdfwAH4QOX8HGOp2neWHJlNNlN28IhfnUespMbXBRBG?=
 =?us-ascii?Q?mEEVHkZgtQPww1+pq2oE1LIO2vfIOUKp1Qy708s2/tF/h01UtrsIT/yLlb1z?=
 =?us-ascii?Q?bFvbAgTSlOM5IDLP3MbHWWux4u6fUcVxzOsYTmwjsfeWa/vp3umglvMjKBrs?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	haft/VfOPXQKNIRBvJ40eAKb6gEIm+UgXXFD7FWN1+WBgf3mAOoKt+BEtf5kYrVPInmULEfGoeQzz4DqPDxJoINlOT1SD5NjuU/g03AqK6u69bDUlnuHX107fdRv/5ldc2muvYlGz6wXO/KuAaMiS6cCqGzq88RSk50PJrl+VSM+10UvfSkj68jcM07p7FCF/983zM2aw3PmL0SG5ozjT5PKqba1pHcOmOJSSjnI6d2hOwicoaE5c1tJm04kDOaW/jUST9FFMHN/1yyFKS6sXuG1KDHhnEbeJQH8cQUeFxAJlmoORViK8qkSJ/Wys3uFm+hWUHfMou9++ss9XPoQOkkb0LUWhsKCtLi+7RkXYwHmfJUgXBMiOUieGBtUjUx4AWQEp1HnNnvVf41zDe3eUCsWkaSrUr0n3tIMC1Jza3I+mEbKznbTQFYs8U/4JCsIm0VNC0TjL1ThveeJsS8JKooBm01imVSmUixsy2ZCTOx/YqflHPDFoe+7KRc/04I2dsF5xAlPzZaWXEhZ/kDsdZD7XfQMO3Fcq6TuKHXYfxuhCi6ldMPuI+oISfQuCAgNodOS/lxkLce2QPNscjceuETNCGUt3JxKu7Ygfetqyvw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2a71ae-4e7d-4772-bc16-08de39074b92
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 22:47:43.0009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCca2E04Rs8wbKBaIhUavmtdafkDOWoo7Skbt4VsCQsN+qCc5tlcEaFFuYCugaZ83Zz+lTDk2UX2pXhyb3Rbyj+ydCfpClU0tRE7Q4Ki1YE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5598
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_03,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512110183
X-Proofpoint-GUID: neKprfiAiiOGxiBeeJzpZezxaSeVkBXa
X-Proofpoint-ORIG-GUID: neKprfiAiiOGxiBeeJzpZezxaSeVkBXa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDE4NCBTYWx0ZWRfX05j3MsOeA7Tw
 cVwsCA9xpgzdP3baANOUz98UvR9zwg3n9HleXswZtbY6VgygyCchM8xtCZCbekAHhu0X+HjPodv
 1tNMFePcP1SB2lHGkUKWIIvd3t1Fp01xa+NyT+FEwXP7manWFpU8OiZM4md1k8mxPVFTBLW/AEo
 XlNssGy5sOpHLJk58Z4tf5IXF5KSWcagqeHZf7wFZE+JT3hZ8Tr5RKf4ssga1SGGdtdAskRBIG4
 Cpg7rtAUpYzBZth/BKH4rHidB/xuz2e9W2Qh68YC1V1arYHHLsn/JO7NBi2plpjCR9eZ8PoqT3N
 cw87yNHQlbfZtH81+RZBIwgZmUgeFh0HNwaoZOj2UoGWJ7Z0A41tPCMciTRlYJqyPgSbgd7MCnZ
 bEkhscux5hWZeV7TvAK1DAYvJSsHPtT43ZzNF0LQ4pGM730KwQc=
X-Authority-Analysis: v=2.4 cv=YJeSCBGx c=1 sm=1 tr=0 ts=693b4a12 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=Dv7hwv4hi08CPql2O_oA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13654

Even when less than the possible number of CPUs are online, the 'buffers'
BPF map should be allocated based on the highest possible CPU id because
probe data is written to the bufer that corresponds to a given CPU id,
which could be part of non-sequential CPU id configurations.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_bpf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libdtrace/dt_bpf.c b/libdtrace/dt_bpf.c
index 0a57b7d2..6568a572 100644
--- a/libdtrace/dt_bpf.c
+++ b/libdtrace/dt_bpf.c
@@ -755,7 +755,7 @@ gmap_create_buffers(dtrace_hdl_t *dtp)
 {
 	return create_gmap(dtp, "buffers", BPF_MAP_TYPE_PERF_EVENT_ARRAY,
 			   sizeof(uint32_t), sizeof(uint32_t),
-			   dtp->dt_conf.num_online_cpus);
+			   dtp->dt_conf.max_cpuid);
 }
 
 /*
-- 
2.43.5


