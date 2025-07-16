Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E902E7658
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752643945; cv=fail; b=kbEJhNjy2tjB4VuUaQHp2lRe+2/u2LPWeqZiiJjbEHm18lu400vu8iAAzQ5/4LdkhmeSU7bJKAWm5YwdpPFaMVKWC+qLfK2xQgi9/3glXIGRbTs+3jO32fsDctv6qoK+BEhsrPpLwAnXuo31XXW+QloxIebL69X4kuxBNgn3XPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752643945; c=relaxed/simple;
	bh=8IUaTr5Dt5IXYrnUCtcCQBEbEo8DDTx4REYdDk/CZwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ClJD4jCtbMqy+Cuq+4Ny7jmztOXYiBNzgdd3Waxbx6qnYXvDbd9QWifN+mbsb9bcHq9ocmv96khx5sLl9zFzRbkNd88yrm58Mq1HuXKYWwvObbPFOKFhvYnEgG7875eqFj+GC6HMmkScFqx5xLLjYffT5e7F1ZcraxncihhJjLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=N77wuJsq; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aL6M0MuX reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="N77wuJsq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aL6M0MuX"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G5Mm3C009204
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=kZ6ZbZNHOmd+Adsj8pYAUesqHLl7xmAVc9bb4AbsWy8=; b=
	N77wuJsqTrdjnpoVxXbRUtVnELbc9TYs18Le7fscOxCAKE8wzfhPgm1YnnYAZ19g
	hGrhThL0Aplp521SrK5+8RNZGQwPggFNKDjFxpon0C0ZEtdPES0r1PN17dRfTatU
	1/aiy5l1mph52tPYrOixd0E8GGe5JoE3iUTVr3bM7W9sgg0QqPp4/A/7yu3rlpHm
	qzJg7FLgzD61IrW5pr4uM5yTj4qTvb6JGzG/P2r9x0g7191olx/htAadYepgVQvk
	7Dfj0UExAKPkXYmWofYI8dhPkfDD9WE9J5fXwguyYKACy8bx/zkwfDgUYMSIg5wY
	4ERSPnSQvxfrd9S5cHSkCA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uk1b06fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:32:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56G2YbaS039682
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:32:21 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue5awtv7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Wed, 16 Jul 2025 05:32:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Td2spZyIN2R+S4prYxZOcWBK/poKvdMpSSXXUsGL9iyV31LoU8J/bHvb1KiOe1OpfJ17qT08fU/3e4PxucOLdKLhWZiOm8ES3lXp6T+znoTsntv6wm2IRvgDYid+TMt6x72XpWfy6at5oGyKNhOO0XHo1F1/hdlw3vlHEkjROLi2onESO8x4A3seIkn7tF99LunDZXho400h2WuMJ92mUIh9aau00p8jFCO++oJQagHNSTafR+H/e/EquFLbAweQGVK1KJIzaJ7duCogx1sfmKYaabns+vIk647NKpU3ZTKYnlb9RHadTP1VMI+Bk0rLb21c1ZTNtnc5a8raeJb16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jECUySzUk1hjStY7UTN2jnQYd1YvwqcRfQI9CkatEC4=;
 b=LloiD6Ajzw9ToR1ZBLVvA2ykPXXA+A+mFZw7QJc4/T6ZvwdLFp6ZCTwWTIJJKWi+Lu+5IkF0OSknYo3vS+3P3dLFI7/M4lXdY0zO1AERDH6fIC7cpKPCYUj8xhqAYjSsvbd41geonhk9a/7KsPpxKDHDvR9TKTrbW9MqkF8KoKgzySbl++NNQ43cucxlKnqpAGEfc2RjvQDaVF00KKcW29tl5krym5YM49RY1Wii1V0v4E1V33pNHRdH/rzXRhwBKvX/CHJ0Ma4ezO/jnIo+319dut9QAkj3jmFbTWBEz74U3xzBwc/N+kcyvmQL/CxFtmE4hqFzHXFT3tjbZnodBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jECUySzUk1hjStY7UTN2jnQYd1YvwqcRfQI9CkatEC4=;
 b=aL6M0MuXFT00Dq0iP88gup1iJj4kqjyDRDsYVijr0sA25vQLc4N0NEe+m9qoEWesEtsS2cDsBzE616tZZ9pW0keKhDkt1ElTmAQ8fAeXRuz0oflI/YcagPFJ3mw8dD5L6wxeM4qKAvtHtXvUhmYRFum8bfINTm4fpWp+D1EEJOc=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by PH7PR10MB7731.namprd10.prod.outlook.com (2603:10b6:510:30c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.23; Wed, 16 Jul
 2025 05:32:13 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 05:32:13 +0000
Date: Wed, 16 Jul 2025 01:32:10 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 3/3] cg: optimize ternary expressions for
 strings
Message-ID: <aHc5WlAd3YLe4x6Y@oracle.com>
References: <SJ0PR10MB5672AFCDA4B6377F37D0C949C257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
 <57838fc8-1e04-2f10-4d4c-e4416aea10bd@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <57838fc8-1e04-2f10-4d4c-e4416aea10bd@oracle.com>
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
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|PH7PR10MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: fb1aa49e-b36d-409d-40a2-08ddc42a1e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?EULU5T7WrK8ZYpBdw2CWqUxL9FstzEnLWW5xxKpv8Sawywghl1NlIzAoru?=
 =?iso-8859-1?Q?YrG3qDSWA8sZzplaI6pNpPawHnVk3Vk3Syrjtvj5HUv+zjbfnj2l5Qd3Ri?=
 =?iso-8859-1?Q?g+7h06hBLdc4iN+fTDciDESn6yC24YBZvZu/SCUOOemj4vUFXkVBcreRCL?=
 =?iso-8859-1?Q?CZGk7CMkN5nEDY41cIodcm2piNnbq43KgIMH0PVc/qgSDl7a1wIOYCW3N0?=
 =?iso-8859-1?Q?joeSu2i2xwJX7EP93j5M4XfompN2WUem+ynW994665RpUVDhnW1162kFY5?=
 =?iso-8859-1?Q?3djacfO2ENfuRSrnhAGDJCkPPvwMlxYvX+8m5TY+/4T+oex+9dmqAanjBp?=
 =?iso-8859-1?Q?zpKRffZI7o6a0N2Pf1eYh1HshDHaS7RshguWBGkr8sYJHASv2X69kJ9E44?=
 =?iso-8859-1?Q?ieePWD8llvJ4Aud409YdRSWukYRmiObpM/HK5/4ZUF94QajWyyo+Q+xnbC?=
 =?iso-8859-1?Q?EB1r9IhoWDV46Ccu64pKejDhPguoP75/Jl6LsHSZtw81wKs+edMiDGZHU1?=
 =?iso-8859-1?Q?fza2TYtigT9XFgbVdS+fDYekB6EsZucmr6fFBLeXiUEkNhhASl7y+wk8D7?=
 =?iso-8859-1?Q?IVIgdVjCEJS1XFmP92p1z0lKQFCDjzxQPy7G6oJtjTNRaTCACcHGFE1MgJ?=
 =?iso-8859-1?Q?sNGIYOrZk3PRAcXpf+L6G7Vg5uP/sMnEYvnAPKxxBvTzfhtSyT+Wa39+dh?=
 =?iso-8859-1?Q?zSqGBldeoLdhDpL6FLm5jSx3yTE/l258J0ZLIqIS1JuB4BGIkvHqCORcQl?=
 =?iso-8859-1?Q?Pcw+RmLyPVriF2JbOUTXmbHQnoDi84zPbTw1AP61ZHp8ApmuAx9wvvZNrz?=
 =?iso-8859-1?Q?epQnbv3n8Z/SKnk3UubQkTk8JRBNwSQ15Ywgfme/fqYI2ipnZ+sut36err?=
 =?iso-8859-1?Q?warkJw7d9tDjJWSsXLRj2UN+06Ve+g1X8qrcL5ay+vKU8ddfKr6jH9N2+C?=
 =?iso-8859-1?Q?uyud0KR/T7FshpXsT8e2oUZbx8fcsyJ/7nktSlOCJvkndlSBcvYqfkjce8?=
 =?iso-8859-1?Q?b/QexgdGo74UvDYflEJQJghR75u8dK+2roPvE9TzS4XoD1D5rWU6OSS5dt?=
 =?iso-8859-1?Q?3Fin4rF/B6IY+0uMZWVo1D6uDMhHBeD0OFNs/aYcnFK+7oSB8NcS2XItPj?=
 =?iso-8859-1?Q?PPtQroqa7T5HtqGJjfLFBnPnkK54JoX83MZ9/o5WHiWOClwzLZCVWs2l4C?=
 =?iso-8859-1?Q?v7zk5Q7UyMBmd7lVPCif4FGmH4TzZUL7Dfp77lN4NU2g2ozbfV5H4ePvSW?=
 =?iso-8859-1?Q?dJAOFHDj2M41wD37VtnEjef9kaeC7ZhAcQ2cukmVO3JuKZ2XcBS0NvHX+j?=
 =?iso-8859-1?Q?Kk6o7vTnnhayocoUCOL7XoEdO/Tq2vsYoJ8Svu5QwHhr62FYSi2kOMEJIr?=
 =?iso-8859-1?Q?bpPpd6vD/RYh9M7OXlR92PEuZ7XRc1jgwhif2jBa/T19qQVYyMvSOQmRCW?=
 =?iso-8859-1?Q?PxiV5GEXnBvpcjrxRtdwGrKyZxjh0ZrKo9rZsczMmw29aMgOiUwXIZ9I/d?=
 =?iso-8859-1?Q?s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7prdh5pXuE/AzCmkCE2UhAtT/6YuqZhqqngWf/wP4flzh74kknYkle4H3R?=
 =?iso-8859-1?Q?uCKkc+sBQwMqD60+F6kgUFYrDaS/kJ+LpzcAT0oofHz44C1PGFyvZxLJhN?=
 =?iso-8859-1?Q?ouwpSRMHH/frUluu+YjiHa1glMMOLmgox4asRKkpzU+sAO1ZKIMcLZBFZt?=
 =?iso-8859-1?Q?flb8NTwDG3AAU/Tm2kC9/p6DsWNnFTdmbM3w03afrlJLEtjXn4/9kfwNxy?=
 =?iso-8859-1?Q?1HjhmlozKybDlgQSLXm2sLsz7AUUgFfPtxAsA859JAS3TdIVVwq7xEEOmu?=
 =?iso-8859-1?Q?4+bJgNpYpz+ECb8p02jKKAiaDd+WmQPSQc4EDwf5Z9+mhcLyVCxXyE7TGQ?=
 =?iso-8859-1?Q?yCSGNkxd5ohmsHbytVWfuawX49eX8kThrlWYTvtpZnNO6U0bGxjlczVNqC?=
 =?iso-8859-1?Q?tktnAktGgANtiTDrKs2pFz46Oi/oABrVWeOzdmNyLj5X2Vqi2+fchrwA7f?=
 =?iso-8859-1?Q?3wSajXcIANXFcezFEFqwgrJHgZCuoiwNx2+hbSNS95KlbXCKpJ3WaeKFp4?=
 =?iso-8859-1?Q?furnmU/pR4BL47UKUG3Qj7ABgQHE1Rd0JcshotR8czHRtuJbD198ta8oRn?=
 =?iso-8859-1?Q?1YP/RHKwf1yjGSIQLvrWSBwXO2sXZRW8iZ8tWSwGrJ6/HLYCkGnKLPz9oc?=
 =?iso-8859-1?Q?sI9rMbvsCrgMxxJJkIJttwsVntMY06OaJO2hbI3XXR7dqMnJjVH/m0UHIC?=
 =?iso-8859-1?Q?UUT4OUQQjFaIRD7sBqq6VdY4Mix/a/LX+a38wzo1AciBNAbcZXKqJRbDsB?=
 =?iso-8859-1?Q?7wMjFjF10zsHgiZnXQ73HSYsiLiAyMJuAhKWXNZcUN4ywxDD3QZXISl6oG?=
 =?iso-8859-1?Q?d2cqN5il6dPzb4htBV2Du4jDt/V9jA3+iubPSbEEfgdyLi8oayRR+wszIs?=
 =?iso-8859-1?Q?gjcE3hlDnolT7/8P99NGs6A9zTupE0ckEqWyKk3gfmdYVlcB8QgGhGBhtF?=
 =?iso-8859-1?Q?OK0QbQt1Cdn/SUBPNc5hySF6g/mes0Vs2fw6I2AOojU2tMIK2kgzpSigA1?=
 =?iso-8859-1?Q?zXXKUJhdk4AvGX9IfsTfW3aD4UrIKwK/St6x97CA/liyV3pITej+THtukM?=
 =?iso-8859-1?Q?vkh0oer8J3BkEaBUV9aoL2m85g4YfugbBfBbP3uzdB3YmkY5rpXdpQWpYi?=
 =?iso-8859-1?Q?cMieypPEG2jP1Qf3VPOo3O2nBv5f+9AfMTkt98Jx5WoMy8TBO9TgpbQAPE?=
 =?iso-8859-1?Q?MUA/UJZ3UkpJ4pgk6HfMh1EFYrzmmWokMXKJRUB1kPEY5kzqW4uZQLYvrO?=
 =?iso-8859-1?Q?jYY6gdL818ZNCwuv01K+hH8taKa6xOpK6+O7mBUW5enRGjcsPkNCSDi2XJ?=
 =?iso-8859-1?Q?1U2c0wKqijwiGDN8Rg1CkuahtFAoJxtduXknBjB37fOQbLJJFwxFVDG/p1?=
 =?iso-8859-1?Q?uznzo2kflOORGHuOjhCL2KnEy6t5dC3LOT9tkNcMW+CbEMrSmxYz8I8tDS?=
 =?iso-8859-1?Q?JLEd9WGkYbYzqDhJi9EyekWqfdsVCHOsNmULGvpjXR/QSC+QJdR3X4JeGi?=
 =?iso-8859-1?Q?SIuD8QrXErpJFYxmTCPeyLDfSmN7TthD3t2K4jMPYR2fcMAdL3j1Eu3yhN?=
 =?iso-8859-1?Q?mVn9xd6s3hb4xsY+t5lU28bGPBqsdzRF7B4nABWcqzSSv4ugZcikN2HJJB?=
 =?iso-8859-1?Q?fvu6t0jSAAf5SXBFvEpbBv+zW6AaIussyAjh/ybpo880l+7lccQ6XXVQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LGqaqEqMzCm1QZGI+JA+ozCBEY5Z/P96vK14AueywDpXQGIp6HTOonEIIQJpCP00Fw9qwkNtsgJ2bjsnHjGduASq72vNJWgbozJNv6FZXC9uyJNRW5vrBK2qOYC/WTrHTIycoEkR6/VDP5J0hO3QBCeWuBe1NXMTvrtXQDGX47xwJPVU4104CyP4CX0SSvtPXDUBAMkvnpOzW2U0EDjy/8c88vujAb4ISZsNVMDMz2XLIaac6oW2lRHSzLc97ICs2MdJQK1e4Lh/GanhBnKkYBTIid0VpHocNd4/w0IgetJsydjYA+bWxHDIvhuGnvdbKhQzxz4l5sqDV/wGANExwgvjhCz6qXO+95blFPqU6CJGaaMkAush4fTki/J8I3XnC3//5y64Zual3FuoDr99dTo6pxEQF7UgnmSfm3HZeGhyyTx5aYhX0J4TrFNXnstGVDx8XCsn7JtprzbJhIYCjfL9FmbdwPz6+zr6rMJuGpJaahW/Cu0F7dXXbXe/9FGAmTxQUpNqmPfk6YI6IstdyUdJLJjCyQp04blIfKmLbX6eLCeYMrI1FBi0Bv/qER+jAVdeNuSBm7tAxEtm5Jx+rraPJ1Ss6XxI+66Ibm5p4J4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb1aa49e-b36d-409d-40a2-08ddc42a1e8b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 05:32:13.7809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAI5V5pTp/IDH5KTsPs3xA5qYeMClwpNN9LySdD54Hey+CzGikz/iZXbdgMvnZaiJW9u5HRLmSzzvpmWShiBd1tz89K1CmXkcY37aTuT+EY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7731
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507160047
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA0NyBTYWx0ZWRfX02RZrs5VPOWQ wiebcXakKgsU8GV5ffNWbLrTWYlLuc7gE57gJqoGMZXC5c6boGahpSL3fNYKTTx0PBa38eHpi6z meMkrW0sE6+uIDAENXkHESLe2m/z7cNGlX2xn2aW7KCPpTJV/OHBCSCapTzcUCydkV/hOSGTyFF
 OvSYSh1mlukFa+9h675f9f4uJ4/aDet6sIlJAO9/vOguKQTX8L38XhUQAdpiFbPbIYYAxxvhCE6 ghczPCO+Q/CHVM39s5nB3IC9zIb6lPcFkYdKwvIra4Rex9y7lYE7XyVua69HnKz07iDRm1IlZJw /bYqutuyfXIlrT+Yv4cmeOmMvWVTc+vcYyHqvp7NpTe3mwMUPg70Bst1UknRVZvYagDX26lrsdv
 Ll3f6G/bMlW5n+jzt0exXF74hJpA/fTIpfmglbwBLvlxi4T00Yq0O+WypJ3qsp222OBWtimM
X-Proofpoint-GUID: U_E7A91udJJpZC7jf8MJJt1pAFBvPCg5
X-Proofpoint-ORIG-GUID: U_E7A91udJJpZC7jf8MJJt1pAFBvPCg5
X-Authority-Analysis: v=2.4 cv=J8mq7BnS c=1 sm=1 tr=0 ts=68773966 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=75nltVjCCirsVWFqqEkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 cc=ntf awl=host:13600

On Wed, Jul 16, 2025 at 01:00:43AM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> subject to a few comments below.
> 
> On 7/15/25 15:50, Kris Van Hees via DTrace-devel wrote:
> 
> > If either size of a ternary expression has a tstring value, it can be
> 
> s/size/side/

Thanks.

> > re-used to store the value of the ternary expression, reducing the
> > need for tstring allocation, especially in nested ternaries.
> > 
> > diff --git a/libdtrace/dt_impl.h b/libdtrace/dt_impl.h
> > @@ -222,7 +222,7 @@ typedef struct dt_kern_path {
> >    * - cleanpath() holds a prepended '/' char, a string, an appended '/' char,
> >    *   and a terminating NUL char, or STRSZ + 3 chars altogether
> >    */
> > -#define DT_TSTRING_SLOTS	4
> > +#define DT_TSTRING_SLOTS	6
> 
> Same comment as I had for Alan's patch.  The comment block before this goes
> into excruciating detail about why the value should be 4. Whether its logic
> is right or wrong, we cannot leave those old comments with a new value.  Why
> is the value now 6?

Ah yes, I should have updated the explanation.  It has become a little bit more
complicated but I can certainly explain it based on the example we have in the
testsuite.
> 
> I assume 6 is not a "sufficient for all purposes" value.  E.g., if I kick up
> the complexity on tst.tstring_ternary_nested.d, I get:

Correct - I hope to do a later patch that makes this something that adjusts
dynamically.  But that is quite a bit more work.
> 
> $ git diff
> diff --git a/test/unittest/codegen/tst.tstring_ternary_nested.d
> b/test/unittest/codegen/tst.tstring_ternary_nested.d
> @@ -16,6 +16,8 @@ BEGIN {
>         trace(x > 1 ? strjoin(strjoin("a", "bc"), strjoin("de", "f")) :
>               x > 2 ? strjoin(strjoin("A", "BC"), strjoin("DE", "F")) :
>               x > 3 ? strjoin(strjoin("u", "vw"), strjoin("xy", "z")) :
> +             x > 4 ? strjoin(strjoin("u", "vw"), strjoin("xy", "z")) :
> +             x > 5 ? strjoin(strjoin("u", "vw"), strjoin("xy", "z")) :
>               strjoin(strjoin("U", "VW"), strjoin("XY", "Z")));
> 
>         exit(0);
> $ sudo ./runtest.sh test/unittest/codegen/tst.tstring_ternary_nested.d
> test/unittest/codegen/tst.tstring_ternary_nested.d: FAIL: core dumped.
> 1 cases (0 PASS, 1 FAIL, 0 XPASS, 0 XFAIL, 0 SKIP)
> $ cat test/log/current/runtest.log
> [...]
> dtrace: libdtrace/dt_cg.c:1472: dt_cg_tstring_xalloc: Assertion `i <
> DT_TSTRING_SLOTS' failed.
> 
> > diff --git a/test/unittest/codegen/tst.tstring_ternary_nested.d b/test/unittest/codegen/tst.tstring_ternary_nested.d
> > @@ -0,0 +1,26 @@
> > +BEGIN {
> > +	x = 42;
> > +	trace(x > 1 ? strjoin(strjoin("a", "bc"), strjoin("de", "f")) :
> > +	      x > 2 ? strjoin(strjoin("A", "BC"), strjoin("DE", "F")) :
> > +	      x > 3 ? strjoin(strjoin("u", "vw"), strjoin("xy", "z")) :
> > +	      strjoin(strjoin("U", "VW"), strjoin("XY", "Z")));
> > +
> > +	exit(0);
> > +}
> 
> I guess that's fine for cg, but the skeptic in me notices that the three
> tests all evaluate to true.  I would think one could run through all 2x2x2=8
> cases in a single test for a little bit more rigor.

Since this is a codegen test, we only really care about the tstring allocation
aspect.  There are already other tests that exercise the ternary itself.
