Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9651FBF6
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 16:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737737772; cv=fail; b=X9LvdzfMQQOW1kQir4GYivL1ipA5iT/Wne9AnCOF1vvkzN0jZWWGhXDgQ7wcVNmNFDi6yETdb70gJalPKe4rZ1YpOTAEOjrXlKJbJ7UgkunLTpI6n7DLXcabSfB9zHuMX+2gfG45ADzImp28ZLkBdKRS4vrxIxlowWg/MD+6HqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737737772; c=relaxed/simple;
	bh=VaUtRtm44QB+0y5QLjRm0itrknb4yljFpXOptov+GC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Msh+GYrFQ+/ALoj8QQoLmg2l+ShTvgMv6FxqO5/wSG53CJqcllzRxj0YJm5h0OvozghRCFRN0HW+yPemEFDK7OKs6DV5CpC79wV8b2rO7F0BJXuUN03HTJNKm8FywCyVgEk0azPeI09xh4FRVS4XGdWrCUevdm2iNMfP+0r4KTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=dOZWImxi; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=m6WOAbcE reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="dOZWImxi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="m6WOAbcE"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O8fxHw022439
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 16:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=YX/dgszibE8N+e2k/wob/rAsOCkyJ5t7aPAh4GyaMkM=; b=
	dOZWImxiHDZcIrry85djwjDJ8ZutBZlcI/WzRM/k27vvo20LxLYDk5FUtpyu9bee
	T055iPfQvBvZU0HtI01j944T1ljYwKQI16b70ox9lOUCX8LP7e/aJk97cnTNc3UD
	UVscdzlIJE3tN1wkTcPtLKhEh18dMXVfVA3XDvDb2fYYksSC5zkEG50P7HJbdMpd
	U7OArKp2DbVTfVUMvxFtakMunEuChRsMH2MfuIH6P4uJUMZdAtA3WAcIi1z/VuqW
	+7NhjJcyKc5w9kSdLlhmZ2wxtAoIjiBk4/5/hIcKrD9dnYioC13PFyxJfyrVh5Ir
	GJHwKKpOuJ3astRsoSke+A==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4485qm4a1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 16:56:08 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50OFFxS0030592
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 16:56:07 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4491fp40tk-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 24 Jan 2025 16:56:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jjuRRiKrm+kQRUxoV04BW4Mb1UDZ6qlJd/2FuJ/fD37n1f2EOUL+9QvmDm9XyXuf6mA/yGMKQKrSrkdWoy7KSWVbDPpOFNNzfiqKU9p8JgXVqxHY6cXyFF6eEgnD/YcnmwwvRSZ6NZ4LN5ITvBRbgpo5QTh9xtnelJ4iQcMd1fC/bJfyPIMxk8vzZvS3/VnnARk9mUnTcMUNQUmzdFCR7DqwHDakeFI8cDZN9ArRwXdaBN5L/oV/IskoO5HwZZJrbm0wssjuKMExSuFcgL41TQ0ZFunvMvGum5xPkB39O6CvxT7vM59cm0l1q2wMR8FvhFjYZnL37t1raJyoeZecbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mw3JQm6kEZF4zV17tlVfn2nRZJxz8VTJ7d+H8qyJWpY=;
 b=q3wbQoH04Oau2/s4jnmIFYMNhSVTn3UjZysTWB7kfeOcSqKuiR9/e4eVNezczXc1Znh2WmqeSOPiWq4q/ssYvuU9XrSgOnKbqdt2KZbJfsLmOZXDyL5YdJ7ggOFq2QwyWeXDBj+8u9vTyxyC6r8LDHVR4qW6fEiA45dyFC/LyNN7N8d3GNyRDzlFDVtZs19RijzlmW8OFfBmk5ALCdEIhiDhr06blRzIhLDsg/gQdSCNmzS8GEco+CYJvwFnAHS7APkWLIhgTdIPxW6510EPshhI/IgA55MRI8pZefNevlQXGws8RTl7sdj01U4byXnsTDV906gy2isDg7zc1XcewQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mw3JQm6kEZF4zV17tlVfn2nRZJxz8VTJ7d+H8qyJWpY=;
 b=m6WOAbcEuVtKVdKb3wu4ebyslgVIIN8xNSgTwSRPhxv65nHEUqPpWiDgyzte9ztBG5ooUIxrJhHAREZjEYPKjjrJ3RKYKdHQy7HN7vftkwMHefqzoYlckbuttH+wQ4bEleiRaQSeRTHUkWbes1GtVbJw5st+HkkMVWngWVAic/E=
Received: from PH8PR10MB6337.namprd10.prod.outlook.com (2603:10b6:510:1cc::10)
 by LV3PR10MB8083.namprd10.prod.outlook.com (2603:10b6:408:283::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Fri, 24 Jan
 2025 16:56:04 +0000
Received: from PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88]) by PH8PR10MB6337.namprd10.prod.outlook.com
 ([fe80::5aad:120e:fe7c:ea88%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 16:56:04 +0000
Date: Fri, 24 Jan 2025 11:56:01 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH] bpf: separate bvar implementation into separate functions
Message-ID: <Z5PGIcMPGNVXo5Fb@oracle.com>
References: <PH8PR10MB6337FA3F91721239230015A6C2E32@PH8PR10MB6337.namprd10.prod.outlook.com>
 <252a8cc4-0bcc-a41c-997d-f5c264c1ed1c@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <252a8cc4-0bcc-a41c-997d-f5c264c1ed1c@oracle.com>
X-ClientProxiedBy: BLAPR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:208:36e::9) To PH8PR10MB6337.namprd10.prod.outlook.com
 (2603:10b6:510:1cc::10)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6337:EE_|LV3PR10MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d92d6e-b8d4-4e53-7992-08dd3c97fd22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?jzKOXdt6ETYAb56j/WI06ny3vqanEIY2Y+oyaCohIUqTnzPPZg03Rgv9O8?=
 =?iso-8859-1?Q?28YffQJaaZOLfbdeZzVFQsuRfSl6HL4IoNZt4WZW6lrCZBMB/0ohWbRB8n?=
 =?iso-8859-1?Q?oC7YvmHyRJXP96tSG1WUSfarJJjAwmlKJTOAHEf0kiYrjIJ1u6dTPXHXJ9?=
 =?iso-8859-1?Q?3tzBF3P9OIh5gn6tY4QIDlYtGq2Wjd203ljNVS0/mb1OHDGd+qF7SiXnq5?=
 =?iso-8859-1?Q?Zb+QQhizgG1OqAkhAFSoKXp29CP1YmpujyYEgblCB7Yaf59fA6mdMm4hlY?=
 =?iso-8859-1?Q?EKB7OCeNkvZdepHCaC3sTE/Bwxp/PyYwzx1NELTm+NHCwaM5p/PrgOVu33?=
 =?iso-8859-1?Q?sjJYx9ehvy9DXgyMq7U7ec0THs/+CtNXGyMhlexInwsed4b+dE2e5yEspt?=
 =?iso-8859-1?Q?Z19Nj3ux8M+RFiLSWXIaL9nipxgmAgVk/nq09dwrFjL1lTR4zMIpQg9Pcf?=
 =?iso-8859-1?Q?5upjJ4dJVkQFC5XIubGPRvC2HuLx5WJDr21Aax+72LlP/qxOlP9mA0BQ1i?=
 =?iso-8859-1?Q?codxFuHFPF7bu8ua4lOYUzXJP244K0s/J2IncaNaGxgSsxs34DoSlumZuy?=
 =?iso-8859-1?Q?KfoujgcgZUOM664T1gPXY3ko8ZA41XkMJh1alYt15HOJpuQ2DklxBvw+KO?=
 =?iso-8859-1?Q?iI/iqdU1hRiA081MA3AZ4WpUA4+Rd4pbEnwo7uM3B8efO8NHnjVhDOSs4g?=
 =?iso-8859-1?Q?Et3xvUU38rtEvQubVU1to5Vo2KQ5/qa9E31Lrtc7CM9OOBZIrgEp9Odig0?=
 =?iso-8859-1?Q?nMzE+R761S3hDrbIpkX3Sn5jvdCqEeVXTxRXXIBbJwu6q2lvD+A73w2j6U?=
 =?iso-8859-1?Q?qbRnCh6bkqvBRTIrf2215s1ESe7TcXrpUojSGAyRTqA2OBVCZd5h/ddDA3?=
 =?iso-8859-1?Q?WEI5/glpL/0kb0o5oRkNtgKO0aZPvR1fhPmpGJ2OOuiLWjxbEY1e5lsYOi?=
 =?iso-8859-1?Q?Tq2k9npiM4kBDGplaTiYSNRCQzDRfhFVTGNY812Z40Sht3C2E838hXX9D7?=
 =?iso-8859-1?Q?Vexw+D9SsrnR6uIQ9s0o/jomOXzz9QThev4Tfc/CBG8u06oY9naFppje67?=
 =?iso-8859-1?Q?9wbm3KtPudGXLy5rtcC/F1AqVb+dRbSXlE3FYlEyzl92o846WUaQmImUzi?=
 =?iso-8859-1?Q?zcHHPwfk0Dt392k28EmkJa4XKwLYG0oMx9NtqjCx95J7GU5kfi5rGwB5C8?=
 =?iso-8859-1?Q?2MsI1TTT8grCZdId/DchijDpWOfOA7SnhJIR+l0VMkF4luxCsUwOzzbwCX?=
 =?iso-8859-1?Q?c8ypLhBpHb3dskjWQyfO92MH+nIgbqpiVgqHl2ykkT3HyHGAfIXX+1xMeP?=
 =?iso-8859-1?Q?TVisN11o3We0B1HAQJdCBMDHP62tPzbKSAxe/0qpJ+tGX2ygpEVBYB6bUW?=
 =?iso-8859-1?Q?MVUzYE2UpAjXmf+ubFqLL2QuHkHyoyYQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6337.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?WFUlLqTa547ywac6v3zWyu5cj569WGjN7TKjuzZRkuJStmSRILqjDBjgrO?=
 =?iso-8859-1?Q?tsTC4fqzKmM13ceEtNL6YnkbCD75rDjVz2R4oeirQMB7UJL79s+R2elLeJ?=
 =?iso-8859-1?Q?EhOd/syoup/szTMDB2KURmgqODEWFcCqJ11YZyy7AQKrMvFsgwWV5Ygeh6?=
 =?iso-8859-1?Q?CVjXhED+moe7LD/zsvo0eJHwhV9rHeeWyTyE9igSelCbYRJKqn03RWvjaC?=
 =?iso-8859-1?Q?ozDqQ1/l0icYgCOsJjg2GAlcY+pKrbW1S1nmPuuMM+9+FLzHqUnPy8c4Sw?=
 =?iso-8859-1?Q?nJJzeFbFVuiwaTTKRpoXQ33lmfpDSZ1DSz9tTd46MJvKyVGYpoqF1DmoTW?=
 =?iso-8859-1?Q?tI403GUcMwRV43RvALNC4roBbub/svwUU+BI1H9UfsgKP77ek+QSp8QENf?=
 =?iso-8859-1?Q?sEQfUzHpGgLZfXVpAooejtH7Zljr0vh4/Lhf3IPq5C6ohu/vCJ5Ur81h0W?=
 =?iso-8859-1?Q?KfGbNcMNNP5ctvndMuWsMsqMlKMOuCImIfNi4UirnebETK/2KvA/IDCHO6?=
 =?iso-8859-1?Q?bGJCRHTSLd1CM7hWSX69/Kj/YG1gEAaOqGW9EuITVVYWDpi6el1YEf/ONa?=
 =?iso-8859-1?Q?gIF5zNrvwhaKNPD6QKteFQyCixoAWEnGNixLhGTyohumQ4mkil4xZl5qku?=
 =?iso-8859-1?Q?vUsr6FzX3mGA1MuzG2hCFK5LiqOnoEOQEtWjHG2TJ/J8Gd3fEH3dtZJWH2?=
 =?iso-8859-1?Q?1yCW1tcKmbfrGfzhViQDxxef+6Mth2izysubH0CespsZYDhwtsb7Of9mWh?=
 =?iso-8859-1?Q?XkeFYPUURWXjHETZKKbk+jnEDBtBw0SIDusmYuDyh6w0CL+Me/8ySRK+CL?=
 =?iso-8859-1?Q?4OmltwC9pVpXuYaGrZ2xH71hKHJgtwQBT9kuxAFAoHzUW4sQKplD2EBOCy?=
 =?iso-8859-1?Q?Qbq2UZOi6QjduVBWfIM71UUacHiwPnb3wJQVqBTQa2fz3Oa8m5hjIhSpRb?=
 =?iso-8859-1?Q?9Z6rO/0dq86enismdFlNCxueOGO5mwcZ+xMt5xl7VU9+Ws/2ap5Q7WUBPp?=
 =?iso-8859-1?Q?afCAldxPHmWI9O7tDU1dOrVqhab7w8XLYMvpym8riF9Q0YnTDQf943OQwM?=
 =?iso-8859-1?Q?Itk4vTR/FfXBQf9YI4t6VG96+C5jbAeud8z71RzahfU5yvXYZ1vxyXrQ2k?=
 =?iso-8859-1?Q?5XRKg6+w3ijQxWvXBYX3Ejw/TfNs9h9BPYDvloogbfuce4RfLePf7dHygZ?=
 =?iso-8859-1?Q?xR+bCV6sCOXBIDC14ICQHpKUUdl3WtNT0IJzsZ5k58Em2OaUkUhUCza5gg?=
 =?iso-8859-1?Q?2HubIPN7rKSYtC4+mdMXa3kuCOHLXQcdiEPdHJqFJOHPc8hbhjzcoDRZzJ?=
 =?iso-8859-1?Q?qrX2wPYs6RpdEV02um1+c4P26cZsOXFljU++UhZ3d2RSLpt5/ZGJNFpx1V?=
 =?iso-8859-1?Q?UGab6LfM52jLPZNCcoHlQGcNFyAva1xQkuwbBHnutt8oC3LGqXrsBzBFDp?=
 =?iso-8859-1?Q?9W9aPlV6dtLOglJCgkc6pXl/VaQkSlIgJK01+g5QTQ5PaVeMrkO4BY+DRg?=
 =?iso-8859-1?Q?1QVe4rx6plBobnwdAkhFYACuH/JYvVNtLc8nwUlKDp8AVECg52j9hWlxRe?=
 =?iso-8859-1?Q?FIQZ+FkXmALpZSaGWRUTDJM/Mma7OK6NG+gMtMU79mAILrY5JrL5n8L3yK?=
 =?iso-8859-1?Q?RPWDVqJYx/MDsuZJffRaAWRCqGjSJmQ3NUw8d7LB2FMKqnCuUo3FqBog?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	du3mpAZLA1nXsnWmsUTQqvHUv35Wiy1UIqbXaeUIzvhZN+6RTeV0Fd6Q1LKq+yIgiRhY6g5z5XOhpjExhDTomapvGyRV01IehbnGiB/3dwu3m22yIAW6UxIuNVomz1R1YrLJK3nq8CCibESiAZwUps37eQf0cc76nnAVmGWfnGIET17s4SgpQW14BpdnTWQl7JWMHrRMf2BYuDp35YJea64xbG5x17XutZS46YaghKwJE49PRdnR+ZkYEDeJ/fyf3NGaVxC7l6M5372mOeXlnOdsdfs1T4uvKzZtRSx31qjtu4RWxN7/QjNIY/7Z1pGbfH66OP09RCIAIs+qQhrP9M1HFzCAwaoAdYH11GW9WzoowlZCn1XVrVk8vajpIxOxQrjn7eE8IBUIFS8HMWEZAonLJESRBTzxDIt89g7TGx1/hZeMnMs98h952abd8lsLh/aNA8208r/544DrqSCIZTy11CTOOKkOLLJC20EtHtd/akvGtzbf362vXiGDaXU8bKRiHtNLHBCPQulSNAzHCmF8mE0G6VmckaIKwcI9D9iG75epv7NJflFeyy2OOssP9sKTntT9C6Y4dvm90BIrFyGw/UbyZrdGVquFW5CiQkE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d92d6e-b8d4-4e53-7992-08dd3c97fd22
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6337.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 16:56:04.3470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZxt82XpBuUzQi5MElnFShISz35tv9dkFNqK6dqRV8hNPYiepuHOtTIEQQYvl86qCpFzUkDtXqMVkmRgB691cILWWNNbBFbtos3kY2+V09s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8083
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501240118
X-Proofpoint-GUID: szS5qC3RpUnnQrQAJszspkMXgB1hB68z
X-Proofpoint-ORIG-GUID: szS5qC3RpUnnQrQAJszspkMXgB1hB68z

On Fri, Jan 24, 2025 at 02:35:49AM -0500, Eugene Loh wrote:
> I think I'm on board with this patch, but two questions.
> 
> 1.  There is DIF_VAR_EXECARGS stuff in two places.  Is that stuff in the
> wrong patch?

Oops, yes, that is for a follow-up patch.  WIll adjust.

> 2.  I'm confused why
>         test/demo/builtin/ipl.d
>         test/demo/builtin/vtimestamp.d
> were passing:  there was no ipl or vtimestamp support before and there is
> none now.  Presumably, the tests used to time out... so why was that
> considered a PASS?  I guess I see why test/unittest/buffering/tst.cputime.sh
> used to pass, but maybe that suggests that the test needs to be tightened up
> and be made quite a bit more discriminating.

The test/demo cases are all mostly pointless, especially because e.g. these
PASSes came from the test/demo/test.options containing "@@timeout-success".
We should probably just remove the test/demo cases from the actual testsuite,
and leave them around (for now) as examples (and overall not very good ones
at that).

> On 1/23/25 22:48, Kris Van Hees wrote:
> > The handling of builtin variables was done with a single big function
> > that therefore got linked into every single BPF program (twice if the
> > builtin variable might raise a fault).  Providing separate functions
> > for most builtin variables reduces BPF program size significantly.
> > 
> > This also reduces pressure on the BPF verifies.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   bpf/get_bvar.c                          | 412 +++++++++++++-----------
> >   include/dtrace/dif_defines.h            |   1 +
> >   libdtrace/dt_cg.c                       |  39 ++-
> >   libdtrace/dt_dis.c                      |  57 +++-
> >   libdtrace/dt_open.c                     |   2 +
> >   test/demo/builtin/ipl.d                 |   2 +
> >   test/demo/builtin/vtimestamp.d          |   2 +
> >   test/demo/io/iocpu.d                    |   2 +
> >   test/unittest/buffering/tst.cputime.sh  |   1 +
> >   test/unittest/disasm/tst.ann-bvar.r     |  69 ++--
> >   test/unittest/disasm/tst.ann-bvar.sh    |   9 +-
> >   test/unittest/disasm/tst.vartab-bvar.r  |   2 -
> >   test/unittest/disasm/tst.vartab-bvar.sh |   7 +-
> >   13 files changed, 360 insertions(+), 245 deletions(-)
> > 
> > diff --git a/bpf/get_bvar.c b/bpf/get_bvar.c
> > index 1c0fa884..c760126d 100644
> > --- a/bpf/get_bvar.c
> > +++ b/bpf/get_bvar.c
> > @@ -19,18 +19,21 @@
> >   # define noinline	__attribute__((noinline))
> >   #endif
> > -extern struct bpf_map_def cpuinfo;
> > -extern struct bpf_map_def probes;
> > -extern struct bpf_map_def state;
> > -extern struct bpf_map_def usdt_names;
> > -
> > -extern uint64_t PC;
> > -extern uint64_t STBSZ;
> > -extern uint64_t STKSIZ;
> > -extern uint64_t BOOTTM;
> > +extern struct bpf_map_def	cpuinfo;
> > +extern struct bpf_map_def	probes;
> > +extern struct bpf_map_def	state;
> > +extern struct bpf_map_def	usdt_names;
> > +
> > +extern uint64_t	BOOTTM;
> > +extern uint64_t	NPROBES;
> > +extern uint64_t	PC;
> > +extern uint64_t	STBSZ;
> > +extern uint64_t	STKSIZ;
> >   extern uint64_t STACK_OFF;
> > -extern uint64_t STACK_SKIP;
> > -extern uint64_t NPROBES;
> > +extern uint64_t	STACK_SKIP;
> > +extern uint64_t	TASK_COMM;
> > +extern uint64_t	TASK_REAL_PARENT;
> > +extern uint64_t	TASK_TGID;
> >   #define error(dctx, fault, illval) \
> >   	({ \
> > @@ -38,198 +41,231 @@ extern uint64_t NPROBES;
> >   		-1; \
> >   	})
> > -noinline uint64_t dt_get_bvar(const dt_dctx_t *dctx, uint32_t id, uint32_t idx)
> > +noinline uint64_t dt_bvar_args(const dt_dctx_t *dctx, uint32_t idx)
> >   {
> >   	dt_mstate_t	*mst = dctx->mst;
> > -	switch (id) {
> > -	case DIF_VAR_CURTHREAD:
> > -		return bpf_get_current_task();
> > -	case DIF_VAR_TIMESTAMP:
> > -		if (mst->tstamp == 0)
> > -			mst->tstamp = bpf_ktime_get_ns();
> > +	if (idx >= sizeof(mst->argv) / sizeof(mst->argv[0]))
> > +		return error(dctx, DTRACEFLT_ILLOP, 0);
> > -		return mst->tstamp;
> > -	case DIF_VAR_EPID: {
> > -		return (((uint64_t)mst->prid) << 32) | mst->stid;
> > -	}
> > -	case DIF_VAR_ID:
> > -		return mst->prid;
> > -	case DIF_VAR_ARG0: case DIF_VAR_ARG1: case DIF_VAR_ARG2:
> > -	case DIF_VAR_ARG3: case DIF_VAR_ARG4: case DIF_VAR_ARG5:
> > -	case DIF_VAR_ARG6: case DIF_VAR_ARG7: case DIF_VAR_ARG8:
> > -	case DIF_VAR_ARG9:
> > -		return mst->argv[id - DIF_VAR_ARG0];
> > -	case DIF_VAR_ARGS:
> > -		if (idx >= sizeof(mst->argv) / sizeof(mst->argv[0]))
> > -			return error(dctx, DTRACEFLT_ILLOP, 0);
> > -
> > -		return mst->argv[idx];
> > -	case DIF_VAR_STACKDEPTH:
> > -	case DIF_VAR_USTACKDEPTH: {
> > -		uint32_t bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
> > -		uint64_t flags;
> > -		char *buf = dctx->mem + (uint64_t)(&STACK_OFF);
> > -		uint64_t stacksize;
> > -
> > -		if (id == DIF_VAR_USTACKDEPTH)
> > -			flags = BPF_F_USER_STACK;
> > -		else
> > -			flags = (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK;
> > -
> > -		stacksize = bpf_get_stack(dctx->ctx, buf, bufsiz, flags);
> > -		if (stacksize < 0)
> > -			return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
> > +	return mst->argv[idx];
> > +}
> > +
> > +noinline uint64_t dt_bvar_caller(const dt_dctx_t *dctx)
> > +{
> > +	uint64_t	buf[2] = { 0, };
> > +	if (bpf_get_stack(dctx->ctx, buf, sizeof(buf),
> > +			  (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK) < 0)
> > +		return 0;
> > +
> > +	return buf[1];
> > +}
> > +
> > +noinline uint64_t dt_bvar_curcpu(const dt_dctx_t *dctx)
> > +{
> > +	uint32_t	key = 0;
> > +	void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
> > +
> > +	if (val == NULL) {
> >   		/*
> > -		 * While linux/bpf.h does not describe the meaning of
> > -		 * bpf_get_stack()'s return value outside of its sign,
> > -		 * it is presumably the length of the copied stack.
> > -		 *
> > -		 * If stacksize==bufsiz, presumably the stack is larger than
> > -		 * what we can retrieve.  But it's also possible that the
> > -		 * buffer was exactly large enough.  So, leave it to the user
> > -		 * to interpret the result.
> > +		 * Typically, we would use 'return error(...);' but
> > +		 * that confuses the verifier because it returns -1.
> > +		 * So, instead, we explicitly return 0.
> >   		 */
> > -		return stacksize / sizeof(uint64_t);
> > -	}
> > -	case DIF_VAR_CALLER:
> > -	case DIF_VAR_UCALLER: {
> > -		uint64_t flags;
> > -		uint64_t buf[2] = { 0, };
> > -
> > -		if (id == DIF_VAR_UCALLER)
> > -			flags = BPF_F_USER_STACK;
> > -		else
> > -			flags = (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK;
> > -
> > -		if (bpf_get_stack(dctx->ctx, buf, sizeof(buf), flags) < 0)
> > -			return 0;
> > -		return buf[1];
> > +		error(dctx, DTRACEFLT_ILLOP, 0);
> > +		return 0;
> >   	}
> > -	case DIF_VAR_PROBEPROV:
> > -	case DIF_VAR_PROBEMOD:
> > -	case DIF_VAR_PROBEFUNC:
> > -	case DIF_VAR_PROBENAME: {
> > -		uint32_t	key = mst->prid;
> > -
> > -		if (key < ((uint64_t)&NPROBES)) {
> > -			dt_bpf_probe_t	*pinfo;
> > -			uint64_t	off;
> > -
> > -			pinfo = bpf_map_lookup_elem(&probes, &key);
> > -			if (pinfo == NULL)
> > -				return (uint64_t)dctx->strtab;
> > -
> > -			switch (id) {
> > -			case DIF_VAR_PROBEPROV:
> > -				off = pinfo->prv;
> > -				break;
> > -			case DIF_VAR_PROBEMOD:
> > -				off = pinfo->mod;
> > -				break;
> > -			case DIF_VAR_PROBEFUNC:
> > -				off = pinfo->fun;
> > -				break;
> > -			case DIF_VAR_PROBENAME:
> > -				off = pinfo->prb;
> > -			}
> > -			if (off > (uint64_t)&STBSZ)
> > -				return (uint64_t)dctx->strtab;
> > -
> > -			return (uint64_t)(dctx->strtab + off);
> > -		} else {
> > -			char *s;
> > -
> > -			s = bpf_map_lookup_elem(&usdt_names, &key);
> > -			if (s == NULL)
> > -				return (uint64_t)dctx->strtab;
> > -
> > -			switch (id) {
> > -			case DIF_VAR_PROBENAME:
> > -				s += DTRACE_FUNCNAMELEN;
> > -			case DIF_VAR_PROBEFUNC:
> > -				s += DTRACE_MODNAMELEN;
> > -			case DIF_VAR_PROBEMOD:
> > -				s += DTRACE_PROVNAMELEN;
> > -			case DIF_VAR_PROBEPROV:
> > -			}
> > -
> > -			return (uint64_t)s;
> > -		}
> > -	}
> > -	case DIF_VAR_PID: {
> > -		uint64_t	val = bpf_get_current_pid_tgid();
> > -		return val >> 32;
> > -	}
> > -	case DIF_VAR_TID: {
> > -		uint64_t	val = bpf_get_current_pid_tgid();
> > +	return (uint64_t)val;
> > +}
> > -		return val & 0x00000000ffffffffUL;
> > -	}
> > -	case DIF_VAR_EXECNAME: {
> > -		uint64_t	ptr;
> > -		extern uint64_t	TASK_COMM;
> > +noinline uint64_t dt_bvar_curthread(const dt_dctx_t *dctx)
> > +{
> > +	return bpf_get_current_task();
> > +}
> > -		/* &(current->comm) */
> > -		ptr = bpf_get_current_task();
> > -		if (ptr == 0)
> > -			return error(dctx, DTRACEFLT_BADADDR, ptr);
> > +noinline uint64_t dt_bvar_epid(const dt_dctx_t *dctx)
> > +{
> > +	dt_mstate_t	*mst = dctx->mst;
> > -		return (uint64_t)ptr + (uint64_t)&TASK_COMM;
> > -	}
> > -	case DIF_VAR_WALLTIMESTAMP:
> > -		return bpf_ktime_get_ns() + ((uint64_t)&BOOTTM);
> > -	case DIF_VAR_PPID: {
> > -		uint64_t	ptr;
> > -		int32_t		val = -1;
> > -		extern uint64_t	TASK_REAL_PARENT;
> > -		extern uint64_t	TASK_TGID;
> > -
> > -		/* Chase pointers val = current->real_parent->tgid. */
> > -		ptr = bpf_get_current_task();
> > -		if (ptr == 0)
> > -			return error(dctx, DTRACEFLT_BADADDR, ptr);
> > -		if (bpf_probe_read((void *)&ptr, 8,
> > -		    (const void *)(ptr + (uint64_t)&TASK_REAL_PARENT)))
> > -			return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_REAL_PARENT);
> > -		if (bpf_probe_read((void *)&val, 4,
> > -		    (const void *)(ptr + (uint64_t)&TASK_TGID)))
> > -			return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_TGID);
> > -
> > -		return (uint64_t)val;
> > -	}
> > -	case DIF_VAR_UID: {
> > -		uint64_t	val = bpf_get_current_uid_gid();
> > +	return (((uint64_t)mst->prid) << 32) | mst->stid;
> > +}
> > -		return val & 0x00000000ffffffffUL;
> > -	}
> > -	case DIF_VAR_GID: {
> > -		uint64_t	val = bpf_get_current_uid_gid();
> > +noinline uint64_t dt_bvar_errno(const dt_dctx_t *dctx)
> > +{
> > +	dt_mstate_t	*mst = dctx->mst;
> > -		return val >> 32;
> > -	}
> > -	case DIF_VAR_ERRNO:
> > -		return mst->syscall_errno;
> > -	case DIF_VAR_CURCPU: {
> > -		uint32_t	key = 0;
> > -		void		*val = bpf_map_lookup_elem(&cpuinfo, &key);
> > -
> > -		if (val == NULL) {
> > -			/*
> > -			 * Typically, we would use 'return error(...);' but
> > -			 * that confuses the verifier because it returns -1.
> > -			 * So, instead, we explicitly return 0.
> > -			 */
> > -			error(dctx, DTRACEFLT_ILLOP, 0);
> > -			return 0;
> > +	return mst->syscall_errno;
> > +}
> > +
> > +noinline uint64_t dt_bvar_execname(const dt_dctx_t *dctx)
> > +{
> > +	uint64_t	ptr;
> > +
> > +	/* &(current->comm) */
> > +	ptr = bpf_get_current_task();
> > +	if (ptr == 0)
> > +		return error(dctx, DTRACEFLT_BADADDR, ptr);
> > +
> > +	return (uint64_t)ptr + (uint64_t)&TASK_COMM;
> > +}
> > +
> > +noinline uint64_t dt_bvar_gid(const dt_dctx_t *dctx)
> > +{
> > +	return bpf_get_current_uid_gid() >> 32;
> > +}
> > +
> > +noinline uint64_t dt_bvar_id(const dt_dctx_t *dctx)
> > +{
> > +	dt_mstate_t	*mst = dctx->mst;
> > +
> > +	return mst->prid;
> > +}
> > +
> > +noinline uint64_t dt_bvar_pid(const dt_dctx_t *dctx)
> > +{
> > +	return bpf_get_current_pid_tgid() >> 32;
> > +}
> > +
> > +noinline uint64_t dt_bvar_ppid(const dt_dctx_t *dctx)
> > +{
> > +	uint64_t	ptr;
> > +	int32_t		val = -1;
> > +
> > +	/* Chase pointers val = current->real_parent->tgid. */
> > +	ptr = bpf_get_current_task();
> > +	if (ptr == 0)
> > +		return error(dctx, DTRACEFLT_BADADDR, ptr);
> > +	if (bpf_probe_read((void *)&ptr, 8,
> > +			   (const void *)(ptr + (uint64_t)&TASK_REAL_PARENT)))
> > +		return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_REAL_PARENT);
> > +	if (bpf_probe_read((void *)&val, 4,
> > +			   (const void *)(ptr + (uint64_t)&TASK_TGID)))
> > +		return error(dctx, DTRACEFLT_BADADDR, ptr + (uint64_t)&TASK_TGID);
> > +
> > +	return (uint64_t)val;
> > +}
> > +
> > +noinline uint64_t dt_bvar_probedesc(const dt_dctx_t *dctx, uint32_t idx)
> > +{
> > +	dt_mstate_t			*mst = dctx->mst;
> > +	uint32_t			key = mst->prid;
> > +
> > +	if (key < ((uint64_t)&NPROBES)) {
> > +		dt_bpf_probe_t	*pinfo;
> > +		uint64_t	off = 0;
> > +
> > +		pinfo = bpf_map_lookup_elem(&probes, &key);
> > +		if (pinfo == NULL)
> > +			return (uint64_t)dctx->strtab;
> > +
> > +		switch (idx) {
> > +		case DIF_VAR_PROBEPROV:
> > +			off = pinfo->prv;
> > +			break;
> > +		case DIF_VAR_PROBEMOD:
> > +			off = pinfo->mod;
> > +			break;
> > +		case DIF_VAR_PROBEFUNC:
> > +			off = pinfo->fun;
> > +			break;
> > +		case DIF_VAR_PROBENAME:
> > +			off = pinfo->prb;
> >   		}
> > +		if (off > (uint64_t)&STBSZ)
> > +			return (uint64_t)dctx->strtab;
> > -		return (uint64_t)val;
> > -	}
> > -	default:
> > -		/* Not implemented yet. */
> > -		return error(dctx, DTRACEFLT_ILLOP, 0);
> > +		return (uint64_t)(dctx->strtab + off);
> > +	} else {
> > +		char	*s;
> > +
> > +		s = bpf_map_lookup_elem(&usdt_names, &key);
> > +		if (s == NULL)
> > +			return (uint64_t)dctx->strtab;
> > +
> > +		switch (idx) {
> > +		case DIF_VAR_PROBEPROV:
> > +			s += DTRACE_FUNCNAMELEN;
> > +		case DIF_VAR_PROBEMOD:
> > +			s += DTRACE_MODNAMELEN;
> > +		case DIF_VAR_PROBEFUNC:
> > +			s += DTRACE_PROVNAMELEN;
> > +		case DIF_VAR_PROBENAME:
> > +		}
> > +
> > +		return (uint64_t)s;
> >   	}
> >   }
> > +
> > +noinline uint64_t dt_bvar_stackdepth(const dt_dctx_t *dctx)
> > +{
> > +	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
> > +	char		*buf = dctx->mem + (uint64_t)(&STACK_OFF);
> > +	uint64_t	retv;
> > +
> > +	retv = bpf_get_stack(dctx->ctx, buf, bufsiz,
> > +			     (uint64_t)(&STACK_SKIP) & BPF_F_SKIP_FIELD_MASK);
> > +	if (retv < 0)
> > +		return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
> > +
> > +	/*
> > +	 * While linux/bpf.h does not describe the meaning of bpf_get_stack()'s
> > +	 * return value outside of its sign, it is presumably the length of the
> > +	 * copied stack.
> > +	 *
> > +	 * If retv==bufsiz, presumably the stack is larger than what we
> > +	 * can retrieve.  But it's also possible that the buffer was exactly
> > +	 * large enough.  So, leave it to the user to interpret the result.
> > +	 */
> > +	return retv / sizeof(uint64_t);
> > +}
> > +
> > +noinline uint64_t dt_bvar_tid(const dt_dctx_t *dctx)
> > +{
> > +	return bpf_get_current_pid_tgid() & 0x00000000ffffffffUL;
> > +}
> > +
> > +noinline uint64_t dt_bvar_timestamp(const dt_dctx_t *dctx)
> > +{
> > +	dt_mstate_t	*mst = dctx->mst;
> > +
> > +	if (mst->tstamp == 0)
> > +		mst->tstamp = bpf_ktime_get_ns();
> > +
> > +	return mst->tstamp;
> > +}
> > +
> > +noinline uint64_t dt_bvar_ucaller(const dt_dctx_t *dctx)
> > +{
> > +	uint64_t buf[2] = { 0, };
> > +
> > +	if (bpf_get_stack(dctx->ctx, buf, sizeof(buf), BPF_F_USER_STACK) < 0)
> > +		return 0;
> > +
> > +	return buf[1];
> > +}
> > +
> > +noinline uint64_t dt_bvar_uid(const dt_dctx_t *dctx)
> > +{
> > +	return bpf_get_current_uid_gid() & 0x00000000ffffffffUL;
> > +}
> > +
> > +noinline uint64_t dt_bvar_ustackdepth(const dt_dctx_t *dctx)
> > +{
> > +	uint32_t	bufsiz = (uint32_t) (uint64_t) (&STKSIZ);
> > +	char		*buf = dctx->mem + (uint64_t)(&STACK_OFF);
> > +	uint64_t	retv;
> > +
> > +	retv = bpf_get_stack(dctx->ctx, buf, bufsiz, BPF_F_USER_STACK);
> > +	if (retv < 0)
> > +		return error(dctx, DTRACEFLT_BADSTACK, 0 /* FIXME */);
> > +
> > +	/* See dt_bvar_stackdepth() above. */
> > +	return retv / sizeof(uint64_t);
> > +}
> > +
> > +noinline uint64_t dt_bvar_walltimestamp(const dt_dctx_t *dctx)
> > +{
> > +	return bpf_ktime_get_ns() + ((uint64_t)&BOOTTM);
> > +}
> > diff --git a/include/dtrace/dif_defines.h b/include/dtrace/dif_defines.h
> > index c8c1d961..9f6e3b55 100644
> > --- a/include/dtrace/dif_defines.h
> > +++ b/include/dtrace/dif_defines.h
> > @@ -162,6 +162,7 @@
> >   #define DIF_VAR_GID		0x011f
> >   #define DIF_VAR_ERRNO		0x0120
> >   #define DIF_VAR_CURCPU		0x0121
> > +#define DIF_VAR_EXECARGS	0x0122
> >   #define DIF_SUBR_RAND			0
> >   #define DIF_SUBR_MUTEX_OWNED		1
> > diff --git a/libdtrace/dt_cg.c b/libdtrace/dt_cg.c
> > index e7e3a132..6e74b4b0 100644
> > --- a/libdtrace/dt_cg.c
> > +++ b/libdtrace/dt_cg.c
> > @@ -3197,6 +3197,7 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >   {
> >   	dt_ident_t	*idp = dt_ident_resolve(dnp->dn_ident);
> >   	dt_ident_t	*fnp;
> > +	uint32_t	idx = UINT32_MAX;
> >   	idp->di_flags |= DT_IDFLG_DIFR;
> > @@ -3298,15 +3299,38 @@ dt_cg_load_var(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >   		return;
> >   	}
> > -	/* built-in variables */
> > +	/* built-in variables (note: args[] is handled in dt_cg_array_op) */
> > +	/* Special case for arg0 through arg9; encode as args[n] */
> > +	if (idp->di_id >= DIF_VAR_ARG0 && idp->di_id <= DIF_VAR_ARG9) {
> > +		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
> > +		idx = idp->di_id - DIF_VAR_ARG0;
> > +	} else if (idp->di_id == DIF_VAR_PROBEPROV ||
> > +		   idp->di_id == DIF_VAR_PROBEMOD ||
> > +		   idp->di_id == DIF_VAR_PROBEFUNC ||
> > +		   idp->di_id == DIF_VAR_PROBENAME) {
> > +		fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_probedesc");
> > +		idx = idp->di_id;
> > +	} else {
> > +		char	*fn;
> > +
> > +		if (asprintf(&fn, "dt_bvar_%s", idp->di_name) == -1)
> > +			longjmp(yypcb->pcb_jmpbuf, EDT_NOMEM);
> > +
> > +		fnp = dt_dlib_get_func(yypcb->pcb_hdl, fn);
> > +		free(fn);
> > +	}
> > +
> > +	/* No implementing function found - report ILLOP. */
> > +	if (fnp == NULL)
> > +		xyerror(D_IDENT_UNDEF,
> > +			"built-in variable '%s' not implemented", idp->di_name);
> > +
> >   	if (dt_regset_xalloc_args(drp) == -1)
> >   		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >   	dt_cg_access_dctx(BPF_REG_1, dlp, drp, -1);
> > -	emit(dlp, BPF_MOV_IMM(BPF_REG_2, idp->di_id));
> > -	emit(dlp, BPF_MOV_IMM(BPF_REG_3, 0));
> > -	fnp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_get_bvar");
> > -	assert(fnp != NULL);
> > +	if (idx != UINT32_MAX)
> > +		emit(dlp, BPF_MOV_IMM(BPF_REG_2, idx));
> >   	dt_regset_xalloc(drp, BPF_REG_0);
> >   	emite(dlp, BPF_CALL_FUNC(fnp->di_id), fnp);
> >   	dt_regset_free_args(drp);
> > @@ -5065,7 +5089,7 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >   	dt_probe_t	*prp = yypcb->pcb_probe;
> >   	uintmax_t	saved = dnp->dn_args->dn_value;
> >   	dt_ident_t	*idp = dnp->dn_ident;
> > -	dt_ident_t	*fidp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_get_bvar");
> > +	dt_ident_t	*fidp = dt_dlib_get_func(yypcb->pcb_hdl, "dt_bvar_args");
> >   	size_t		size;
> >   	int		n;
> >   	int		ustr = 0;
> > @@ -5135,8 +5159,7 @@ dt_cg_array_op(dt_node_t *dnp, dt_irlist_t *dlp, dt_regset_t *drp)
> >   	if (dt_regset_xalloc_args(drp) == -1)
> >   		longjmp(yypcb->pcb_jmpbuf, EDT_NOREG);
> >   	dt_cg_access_dctx(BPF_REG_1, dlp, drp, -1);
> > -	emit(dlp, BPF_MOV_IMM(BPF_REG_2, idp->di_id));
> > -	emit(dlp, BPF_MOV_REG(BPF_REG_3, dnp->dn_reg));
> > +	emit(dlp, BPF_MOV_REG(BPF_REG_2, dnp->dn_reg));
> >   	dt_regset_xalloc(drp, BPF_REG_0);
> >   	emite(dlp, BPF_CALL_FUNC(fidp->di_id), fidp);
> >   	dt_regset_free_args(drp);
> > diff --git a/libdtrace/dt_dis.c b/libdtrace/dt_dis.c
> > index 9f319d70..d983c099 100644
> > --- a/libdtrace/dt_dis.c
> > +++ b/libdtrace/dt_dis.c
> > @@ -364,16 +364,57 @@ static char *
> >   dt_dis_bpf_args(const dtrace_difo_t *dp, const char *fn,
> >   		const struct bpf_insn *in, char *buf, size_t len, uint_t addr)
> >   {
> > -	if (strcmp(fn, "dt_get_bvar") == 0) {
> > +	if (strcmp(fn, "dt_bvar_args") == 0) {
> >   		/*
> > -		 * We know that the previous two instructions exist and move
> > -		 * the variable id to a register in the first instruction of
> > -		 * that sequence (because we wrote the code generator to emit
> > -		 * the instructions in this exact order.)
> > +		 * We need to support two cases:
> > +		 *  - access to argN:
> > +		 *	lddw %r1, dctx
> > +		 *	mov  %r2, N
> > +		 *	call dt_bvar_args
> > +		 *  - access to args[N]:
> > +		 *	mov  %rX, N
> > +		 *	lddw %r1, dctx
> > +		 *	mov  %r2, %rX
> > +		 *	call dt_bvar_args
> >   		 */
> > -		in -= 2;
> > -		snprintf(buf, len, "%s",
> > -			 dt_dis_varname_id(dp, in->imm, DIFV_SCOPE_GLOBAL, addr));
> > +		in--;
> > +		if (BPF_OP(in->code) == BPF_MOV && in->dst_reg == 2) {
> > +			if (BPF_SRC(in->code) == BPF_K) {
> > +				snprintf(buf, len, "arg%d", in->imm);
> > +				return buf;
> > +			}
> > +
> > +			in -= 2;
> > +			if (BPF_OP(in->code) == BPF_MOV &&
> > +			    BPF_SRC(in->code) == BPF_K &&
> > +			    in->dst_reg == in[2].src_reg) {
> > +				snprintf(buf, len, "args[%d]", in->imm);
> > +				return buf;
> > +			}
> > +		}
> > +
> > +		snprintf(buf, len, "args[?]");
> > +		return buf;
> > +	} else if (strcmp(fn, "dt_bvar_probedesc") == 0) {
> > +		/*
> > +		 * Access to probe(prov|mod|func|name);
> > +		 *	lddw %r1, dctx
> > +		 *	mov  %r2, N
> > +		 *	call dt_bvar_probedesc
> > +		 */
> > +		in--;
> > +		if (BPF_OP(in->code) == BPF_MOV && in->dst_reg == 2 &&
> > +		    BPF_SRC(in->code) == BPF_K) {
> > +			snprintf(buf, len, "%s",
> > +				 dt_dis_varname_id(dp, in->imm,
> > +						   DIFV_SCOPE_GLOBAL, addr));
> > +			return buf;
> > +		}
> > +
> > +		return NULL;
> > +	} else if (strncmp(fn, "dt_bvar_", 8) == 0) {
> > +		/* The variable name is in the function name.*/
> > +		snprintf(buf, len, "%s", fn + 8);
> >   		return buf;
> >   	} else if (strcmp(fn, "dt_get_agg") == 0) {
> >   		/*
> > diff --git a/libdtrace/dt_open.c b/libdtrace/dt_open.c
> > index a0205887..51c056b2 100644
> > --- a/libdtrace/dt_open.c
> > +++ b/libdtrace/dt_open.c
> > @@ -153,6 +153,8 @@ static const dt_ident_t _dtrace_globals[] = {
> >   	&dt_idops_type, "uint64_t" },
> >   { "errno", DT_IDENT_SCALAR, 0, DIF_VAR_ERRNO, DT_ATTR_STABCMN, DT_VERS_1_0,
> >   	&dt_idops_type, "int" },
> > +{ "execargs", DT_IDENT_SCALAR, 0, DIF_VAR_EXECARGS,
> > +	DT_ATTR_STABCMN, DT_VERS_2_0, &dt_idops_type, "string" },
> >   { "execname", DT_IDENT_SCALAR, 0, DIF_VAR_EXECNAME,
> >   	DT_ATTR_STABCMN, DT_VERS_1_0, &dt_idops_type, "string" },
> >   { "exit", DT_IDENT_ACTFUNC, 0, DT_ACT_EXIT, DT_ATTR_STABCMN, DT_VERS_1_0,
> > diff --git a/test/demo/builtin/ipl.d b/test/demo/builtin/ipl.d
> > index ca7f3bb7..f613bb70 100644
> > --- a/test/demo/builtin/ipl.d
> > +++ b/test/demo/builtin/ipl.d
> > @@ -1,3 +1,5 @@
> > +/* @@xfail: dtv2: need ipl support */
> > +
> >   BEGIN {
> >   	trace(ipl);
> >   	exit(0);
> > diff --git a/test/demo/builtin/vtimestamp.d b/test/demo/builtin/vtimestamp.d
> > index 9f01bbf0..fcb708d0 100644
> > --- a/test/demo/builtin/vtimestamp.d
> > +++ b/test/demo/builtin/vtimestamp.d
> > @@ -1,3 +1,5 @@
> > +/* @@xfail: dtv2: need vtimestamp support */
> > +
> >   BEGIN {
> >   	trace(vtimestamp);
> >   	exit(0);
> > diff --git a/test/demo/io/iocpu.d b/test/demo/io/iocpu.d
> > index c7b847e7..1230d6f6 100644
> > --- a/test/demo/io/iocpu.d
> > +++ b/test/demo/io/iocpu.d
> > @@ -5,6 +5,8 @@
> >    * http://oss.oracle.com/licenses/upl.
> >    */
> > +/* @@xfail: dtv2: need vtimestamp support */
> > +
> >   #pragma D option quiet
> >   sched:::on-cpu
> > diff --git a/test/unittest/buffering/tst.cputime.sh b/test/unittest/buffering/tst.cputime.sh
> > index 6a420e8d..c0e248a6 100755
> > --- a/test/unittest/buffering/tst.cputime.sh
> > +++ b/test/unittest/buffering/tst.cputime.sh
> > @@ -5,6 +5,7 @@
> >   # Licensed under the Universal Permissive License v 1.0 as shown at
> >   # http://oss.oracle.com/licenses/upl.
> >   #
> > +# @@xfail: dtv2: need vtimestamp support
> >   # @@timeout: 12
> >   script()
> > diff --git a/test/unittest/disasm/tst.ann-bvar.r b/test/unittest/disasm/tst.ann-bvar.r
> > index b514dd99..a55fb6de 100644
> > --- a/test/unittest/disasm/tst.ann-bvar.r
> > +++ b/test/unittest/disasm/tst.ann-bvar.r
> > @@ -1,34 +1,35 @@
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg0
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg1
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg2
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg3
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg4
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg5
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg6
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg7
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg8
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! arg9
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! args
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! caller
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! curcpu
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! curthread
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! epid
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! errno
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! execname
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! gid
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! id
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! ipl
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! pid
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! ppid
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! probefunc
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! probemod
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! probename
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! probeprov
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! stackdepth
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! tid
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! timestamp
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! ucaller
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! uid
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! ustackdepth
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! vtimestamp
> > -85 0 1 0000 ffffffff    call dt_get_bvar              ! walltimestamp
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg0
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg1
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg2
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg3
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg4
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg5
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg6
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg7
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg8
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! arg9
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! args[0]
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! args[1]
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! args[2]
> > +85 0 1 0000 ffffffff    call dt_bvar_args             ! args[3]
> > +85 0 1 0000 ffffffff    call dt_bvar_caller           ! caller
> > +85 0 1 0000 ffffffff    call dt_bvar_curcpu           ! curcpu
> > +85 0 1 0000 ffffffff    call dt_bvar_curthread        ! curthread
> > +85 0 1 0000 ffffffff    call dt_bvar_epid             ! epid
> > +85 0 1 0000 ffffffff    call dt_bvar_errno            ! errno
> > +85 0 1 0000 ffffffff    call dt_bvar_execname         ! execname
> > +85 0 1 0000 ffffffff    call dt_bvar_gid              ! gid
> > +85 0 1 0000 ffffffff    call dt_bvar_id               ! id
> > +85 0 1 0000 ffffffff    call dt_bvar_pid              ! pid
> > +85 0 1 0000 ffffffff    call dt_bvar_ppid             ! ppid
> > +85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probefunc
> > +85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probemod
> > +85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probename
> > +85 0 1 0000 ffffffff    call dt_bvar_probedesc        ! probeprov
> > +85 0 1 0000 ffffffff    call dt_bvar_stackdepth       ! stackdepth
> > +85 0 1 0000 ffffffff    call dt_bvar_tid              ! tid
> > +85 0 1 0000 ffffffff    call dt_bvar_timestamp        ! timestamp
> > +85 0 1 0000 ffffffff    call dt_bvar_ucaller          ! ucaller
> > +85 0 1 0000 ffffffff    call dt_bvar_uid              ! uid
> > +85 0 1 0000 ffffffff    call dt_bvar_ustackdepth      ! ustackdepth
> > +85 0 1 0000 ffffffff    call dt_bvar_walltimestamp    ! walltimestamp
> > diff --git a/test/unittest/disasm/tst.ann-bvar.sh b/test/unittest/disasm/tst.ann-bvar.sh
> > index 6dc43424..61e838d1 100755
> > --- a/test/unittest/disasm/tst.ann-bvar.sh
> > +++ b/test/unittest/disasm/tst.ann-bvar.sh
> > @@ -22,6 +22,9 @@ sdt:task::task_rename
> >   	trace(arg8);
> >   	trace(arg9);
> >   	trace(args[0]);
> > +	trace(args[1]);
> > +	trace(args[2]);
> > +	trace(args[3]);
> >   	trace(caller);
> >   	trace(curcpu);
> >   	trace(curthread);
> > @@ -30,7 +33,7 @@ sdt:task::task_rename
> >   	trace(execname);
> >   	trace(gid);
> >   	trace(id);
> > -	trace(ipl);
> > +/*	trace(ipl); */
> >   	trace(pid);
> >   	trace(ppid);
> >   	trace(probefunc);
> > @@ -43,10 +46,10 @@ sdt:task::task_rename
> >   	trace(ucaller);
> >   	trace(uid);
> >   	trace(ustackdepth);
> > -	trace(vtimestamp);
> > +/*	trace(vtimestamp); */
> >   	trace(walltimestamp);
> >   	exit(0);
> >   }
> > -' 2>&1 | gawk '/ call dt_get_bvar/ { sub(/^[^:]+: /, ""); print; }'
> > +' 2>&1 | gawk '/ call dt_bvar_/ { sub(/^[^:]+: /, ""); print; }'
> >   exit $?
> > diff --git a/test/unittest/disasm/tst.vartab-bvar.r b/test/unittest/disasm/tst.vartab-bvar.r
> > index 53e5f618..04fa3a8d 100644
> > --- a/test/unittest/disasm/tst.vartab-bvar.r
> > +++ b/test/unittest/disasm/tst.vartab-bvar.r
> > @@ -2,8 +2,6 @@ NAME             OFFSET KND SCP FLAG TYPE
> >   args                    arr glb r    any (unknown) by ref (size 0)
> >   curthread               scl glb r    D type (pointer) (size 8)
> >   timestamp               scl glb r    D type (integer) (size 8)
> > -vtimestamp              scl glb r    D type (integer) (size 8)
> > -ipl                     scl glb r    D type (integer) (size 4)
> >   epid                    scl glb r    D type (integer) (size 8)
> >   id                      scl glb r    D type (integer) (size 4)
> >   arg0                    scl glb r    D type (integer) (size 8)
> > diff --git a/test/unittest/disasm/tst.vartab-bvar.sh b/test/unittest/disasm/tst.vartab-bvar.sh
> > index 098c1f45..ce489a24 100755
> > --- a/test/unittest/disasm/tst.vartab-bvar.sh
> > +++ b/test/unittest/disasm/tst.vartab-bvar.sh
> > @@ -30,6 +30,9 @@ sdt:task::task_rename
> >   	trace(arg8);
> >   	trace(arg9);
> >   	trace(args[0]);
> > +	trace(args[1]);
> > +	trace(args[2]);
> > +	trace(args[3]);
> >   	trace(caller);
> >   	trace(curcpu);
> >   	trace(curthread);
> > @@ -38,7 +41,7 @@ sdt:task::task_rename
> >   	trace(execname);
> >   	trace(gid);
> >   	trace(id);
> > -	trace(ipl);
> > +/*	trace(ipl); */
> >   	trace(pid);
> >   	trace(ppid);
> >   	trace(probefunc);
> > @@ -52,7 +55,7 @@ sdt:task::task_rename
> >   	trace(uid);
> >   	/* trace(uregs[0]); */ /* test this separately until uregs[0] works on all kernels */
> >   	trace(ustackdepth);
> > -	trace(vtimestamp);
> > +/*	trace(vtimestamp); */
> >   	trace(walltimestamp);
> >   	exit(0);
> >   }
