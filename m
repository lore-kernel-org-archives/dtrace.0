Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CDB28C864
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 17:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757957971; cv=fail; b=h2rtvUkV7SzQ7S8WF7Cw++/k6uqTl0zgwT9sKvRTPqTo0wsW0kDyQeuUZTZ+MnjHjRQ95YzEKcGAtLIvtVVjMhARNA19IWKqlFRXWQNJAOKj6paCMp2kQK6MIseePtfLGGpb6ml3Z+/CIu7kS4FAJhhMnN//7YgyLjDr4+TgjZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757957971; c=relaxed/simple;
	bh=XK01+vsoMThX7EtBddzusCegPRlVKwFFTGWADvLd/Oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dkgTgV0nPj9h8C4mXydOX7pNuV3OgJ1pWABlo/ibKp6ldmQFyOkAJHLPeLcFQbsiPcC67Zp1o9TTLWIfNSGdjCDaIsj/e11RCgd/b7p4iD4K2z92Ite/3AZyFg+w9JgVXGurchNNMO7WEcuRNIxXWBJVYCTjXzYYaIR/xk1ApNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=BcxKNaUb; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HBXUFcmp reason="signature verification failed"; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="BcxKNaUb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HBXUFcmp"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FFSnrR028137
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 17:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=xDSHdcwFjNvS8+AMeBhR10NONLUddwHkc0+eCfL7Iy4=; b=
	BcxKNaUbuzzls1JmpJHHaTktDaTiI39lDbaNmn0yIFNjMki7DC93xqaNz6nzEnme
	iTB/L4laJNE6FZZm1lTRKBsgLAsv7jRgi7a7XhkF5B9Lz/6Ini7XxrKNdpVCUPkF
	KSmzHUP9nc5+D3SZy22853+Z/t2RYtqXr0gT7Wvyiswcq9CICawrrYaR/g0EmiQD
	jLIJ3Vztrgv/sfAzd+IrtvMNd//lt11d9TWuWnnctH4yT+7+B+a4sRuLOj/qo/Cx
	OECyNmPVyKeseeIvoNED/HFvUMeeE6qdvk9cvKI7gy50Usino7iwrvFSqt4hr/iQ
	rSz6hMGIEucjLHnyfmfhfA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 494yhd30f4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 17:39:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58FHTV7C021250
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 17:39:27 GMT
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010044.outbound.protection.outlook.com [52.101.46.44])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 494y2bay74-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 15 Sep 2025 17:39:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlspfmIl+qceXt+0FWP0iW7/bOef3/btcrIAbx+ZWgnow/AIPEXibwFZINxVqZlf21ecMKVQEhLip7T9ptPRsPqb9LE/t6n3dlbLWtXdyk39O5wy5tVJD0+dSiQeBLqLxJunsSHXhwathrCPPwU2X/jbeA3/25xteJOU9kX4lq3mMYnZjr3XCnujmxZIRDpu4CcluBLSuHmuMsfPAAeHGCxTavCVo2/U87Ser+JDqld1jkfDHbRStAsGEWVSajM8QrYxb1ICiA10OnHNjXviIRJUokJ4gCWDOFwjWaL+KR6H07nC36radAtBbWvmAhxEYeV8ZFpabBvP9UlZ7BdRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62QH7HPoMj5QQiE2QFFgXmFMKrSjA4NSB8nQ8RkR/vY=;
 b=YcXuphyetyk0FmTCRAKK2uCDmgCfZoQCEEpUrvi3FbXyvnH2arjHzEBf8R7aA/1V9H/zg2/d7+wh6xBa78A8PwDsHIlYlzIJV656gxHDb2kMbDUorA6lYt40bDfP9ifidLonTrk1ZeHInIkFnGv4J9xsYGeKtQgYOq8ORi/680gszh2qOcVOZTUiYQdPIfeyaJaha/06vjF0fq7DcMZpnfkmotgL+VcdmVSk38u09FRg4Qz0fA5UBQ9IkejOfwpOOiG+FW9FXXXOn9eB255jbVdAOQmQhbDNiMiB6O7Rsrnp+YOgBNXQrvVMu27uZhdzO9mM0xGCvRLEZuOFZYfzXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62QH7HPoMj5QQiE2QFFgXmFMKrSjA4NSB8nQ8RkR/vY=;
 b=HBXUFcmp2Air3IzegAolFpYP2/fjcvohVRaEj7QD/4ZgKY/w+0pdUgHiZBx7FmqH2blDQa36FlhRZA1ymvfFa/7kFetHnJuhoGO1wVhtV7EMaGHU2FtosMGOoNfGsDmKebZVneMw2wvcmSTXlnQqjyD4DCUWL/5d2x+15Yk7gj0=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by IA0PR10MB7184.namprd10.prod.outlook.com (2603:10b6:208:409::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 17:39:24 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%4]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 17:39:24 +0000
Date: Mon, 15 Sep 2025 13:39:21 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: Eugene Loh <eugene.loh@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH 4/4] test: Do not depend on ext4
Message-ID: <aMhPSWxgnIi8lAbQ@oracle.com>
References: <20241004044355.25870-1-eugene.loh@oracle.com>
 <20241004044355.25870-4-eugene.loh@oracle.com>
 <ZxwKuCIs1atplKFL@kvh-deb-bpf.us.oracle.com>
 <9c8bfb58-6d34-07d8-243b-691fc62df38f@oracle.com>
 <87348pxoxv.fsf@esperi.org.uk>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87348pxoxv.fsf@esperi.org.uk>
X-ClientProxiedBy: BLAPR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:208:36e::21) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|IA0PR10MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: abe88e95-e466-4a91-3717-08ddf47ecfb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?gm6yqaD453xJwTE7/C+Y7r2WBiTAZKmSMylvvecmJEsGD4z8a4ZEWSx+x+?=
 =?iso-8859-1?Q?KpBdoke862D535jT4Cx+gwbZUJDBd7IIbe0yMHlIkk0+Rsk99zggynwxgX?=
 =?iso-8859-1?Q?cgZAhfgg8bKqkLyE6Ih1/zY2mq8kXMQLuXqhnZ5UzVRGtzIywdJwvNqnXR?=
 =?iso-8859-1?Q?ntAAzk2iW331m3K5QvSKMB/knT94+mFwuJ2m0LKegSSqkXOVaVRY7nhrVU?=
 =?iso-8859-1?Q?qtdGYitrOaZGR0aGgalYjgkHzpGI7hpO5kDj5RuN/hEInlgcs7B+oNZgqr?=
 =?iso-8859-1?Q?sfeQwfP4+pXyKP0xQz77mVUniFe2pqkcAKzlcHHkkwFwi3B/cTXQHg6PTM?=
 =?iso-8859-1?Q?lErSekeVbBp1wxga5huyVulPxSNFtVhrC/Xa9+aHYQVgUh+lDRaORBTZs7?=
 =?iso-8859-1?Q?6853elQGm7zugWPSvYoC1g0utGPcrpLCCrvwGBIMXQiaIS5+/Dype9X4Bg?=
 =?iso-8859-1?Q?wkWSQyTK8CWa6vKnKYZqxA4qZjDIFkoIVOghDFgE5M56VbgrBlt5rn4q70?=
 =?iso-8859-1?Q?BPaaykbHop2B7I+oOazqM3jzttAvrRU51m4qxPhePC+Wa3B080FlKdaLDO?=
 =?iso-8859-1?Q?ExkVAVoKUTpLNx7MMS3hXbMxcEGOulnJsa6QtB2DxpsSNOOTRCSoquE0jy?=
 =?iso-8859-1?Q?NmBmVhusDTGswPPCM9fpnv04Ib8dl31Lz0r2/5K8s07h7//UStg9+qNHd8?=
 =?iso-8859-1?Q?oJjYi+y9X87wGhT/3MDsLEcN7yD2/5xMSBPQn1V1vyd6j+8zqSJHwTp6PY?=
 =?iso-8859-1?Q?J+F3a9UElvMWR+j0KKjcscxCN+gqQLsnw+RBnceli4FZ3ruA9gl2tkjWkQ?=
 =?iso-8859-1?Q?3NX+QUrKqfnTCsHK4w3iD+pdUjQwQRCkmrk/BMhDIBACrkg0c76nCzDXFF?=
 =?iso-8859-1?Q?wpOnEEq/g/ECDufRN6/jWuaBbDYiZ0ZhoRSt9jzxAySpWxKVo2AkQLz4mA?=
 =?iso-8859-1?Q?a0Ajmwl2d+7ibQonyf8Ck4gU5BOy3wEOT4ZZzTunP1ya8xJbeitQjkgguj?=
 =?iso-8859-1?Q?dhDyp8L5gQcVQWXhyb++5NfFCv/+YxamvsDYEEI+hcGmzqqR0eAMQJTrIW?=
 =?iso-8859-1?Q?7+dhITVgBLN4wDivEUZaBwdEwd7fmVIa8mxC5OPnRbRy5NrS/KyDKnxOHY?=
 =?iso-8859-1?Q?/IH2YOfU4SwEmACJOXe59Bxuz3toegpnKGTodS1IXq4NYNcAuifCsEFqY1?=
 =?iso-8859-1?Q?JD0FUcoe0/ZdUavnCalxQuaOWYhSjemrb+zR4YUZ0GuX2OyGgbv8ZZavvL?=
 =?iso-8859-1?Q?qoxUsO4FpOqoDQp5LWlqWbz3t0+VxgwMDM3xH8hhL5W4VDph9vsp0SEzKk?=
 =?iso-8859-1?Q?4+cTkR8xskVY0XbF4IJ3ihytbh7sFKbgGjUxZhKI8Ohxp0Jv0SYlulaRBN?=
 =?iso-8859-1?Q?uPAgnL7i7LCIZaP6LmOyOln8o+2bl9oOB29tTJSIA8mjU3OCJg2Pl681x5?=
 =?iso-8859-1?Q?B4HBuxmKfon65AurBrOOEu02ZbeCs7yDrYdaOn4REXsjIVBXc//+4AoJmh?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?NIT2FsWcWNQVaKcEcZPAWyfz1ziLa+0LTQUI19mJ6R5iKCXTNv/TmOEBNN?=
 =?iso-8859-1?Q?bxZtDzk5BQ0sk0fmj8aT+BOBt5yAKhgrWytT7O1ejfECuD5jcHJlystBj6?=
 =?iso-8859-1?Q?+KfSbsqRxG6ilU6gIPex2ow+y6N45LoSDeYvGHvF4YIYfIl29FW62pkNIX?=
 =?iso-8859-1?Q?QE8QOHCrSxfToEzaEsLG7iSxdEZjZJ8fTFGdCOPXN4l1p4GGA4FEoLu+Q8?=
 =?iso-8859-1?Q?JBXhB3HIHkNdJLTlk6jGj9k6KzgeXxv2dkpe7FgWwt2AMmusBAzI4XBWDU?=
 =?iso-8859-1?Q?VA8wdB65dtO8b87IG+PNYX6iHPRqgNuc3Z5vz7fWqbAJXUkTTUJxe6TZrE?=
 =?iso-8859-1?Q?WfflqYStPFQWEJJPnuaovieDiJEuYKt5yC4O75gq0lIMcZH48DoEjs7HXd?=
 =?iso-8859-1?Q?6fuavwm8SqVDGhZwaPohHH/L532vx+k5TrXhRaNmwCg8Etrb7P9dDFMuOb?=
 =?iso-8859-1?Q?s1lI3IqbdAxq0UZBQrqyYesIbbpk50Py58bR+S91HP0yfjD5rrGWRsrWHg?=
 =?iso-8859-1?Q?bzQ+OKXummwIoSlXEyQV+Zmh4upspDFs/TtoxtedF6JbDm72fcbvY6Zj5A?=
 =?iso-8859-1?Q?lCSlfnRV21viqkiF5DktOIaScj3jFQJ1FTGd8UK7JI52tqnNzwvAxXJ31l?=
 =?iso-8859-1?Q?80IIM5Ee5dB4yMbn6RRUnX8tbqDgZ9VVBDXxU2mELWhB0fnN81POKeaYHd?=
 =?iso-8859-1?Q?/ZnKp+1tr+iCEzOOb8bcex4cCGQur+SEA9xSr+/u2Cx6o8kmAa4/svvTC4?=
 =?iso-8859-1?Q?976SIlX5lJJi7UUzFRJSqSCgji4wgN7mzXrCaJdRkSGSx4N355hTC6EOTZ?=
 =?iso-8859-1?Q?DYAEi5JK2Su4SaC7fW1NXAJwbAfduoQdNBAqc7uAoVV+61uoZLv/lldGd3?=
 =?iso-8859-1?Q?TBDGKstqW0QOrNoFP8mKm/QF/mSnJ5/izbpcsbJex8DWyS8E3dHHu+ynIn?=
 =?iso-8859-1?Q?Pp9Kv2+3TdOczhOplxJSbFKFwlzbT0erJkrNSoTpidxKmNk0w2se1YUTKo?=
 =?iso-8859-1?Q?L6RXyl3n+NA2Fi74TI1I9KBpIeHKmFHVSoxAaHppZij3DsfKqg03oxJvDX?=
 =?iso-8859-1?Q?lO7f3cBnjKdMOt8d3ckrBUFZ3+MNvHodDTZ2Wyr5DJjioWrWAOiUkODOt6?=
 =?iso-8859-1?Q?x33mMm4HwaM4FVf+VPLyJh+M/YvXqi7yI5yWmMJaCXxDqApN7qfvi0RWeo?=
 =?iso-8859-1?Q?vyRQED4uVwmSHz6ej7JO/77HS3Ya6rpB0I1cl5Z9t1XccIMXQ2iIxRACQu?=
 =?iso-8859-1?Q?HpQiz/2WuOEhzrAXcHLbyX2/hJ02Fv8ZU8X1QlDfDWgpn5GmkaDg2FnOEe?=
 =?iso-8859-1?Q?yBBPuF97dlzwTmyB6R5s8+yTvtfHGNDi5BKFbmUF9PHDjhcX4LZ8iT0bY5?=
 =?iso-8859-1?Q?hct1QSv9EQ8GyZ3dAnDrFcuEUIC1Kws1DKS+JSPpL5XtfAdpvXQ+jP4696?=
 =?iso-8859-1?Q?tWr3F1AHcVxMtp++EQlDGO1dVAtGJMbzT5RlZEU9PkFJPnUsO0dKBgItR5?=
 =?iso-8859-1?Q?adQ8k115uxySBfvSo/TaaARUQHKIJa+//11lU0cx3og+e/iTk6VloXIjMg?=
 =?iso-8859-1?Q?Ma0P8FelMYmjnUvGo4LvWJTq4apwi/BS23awIN722MA5uKAGsj2rrkLyWs?=
 =?iso-8859-1?Q?Vl/GiZwePDjsSAV7otBMKTFe/hATWOgeGPx9w0tqTSvMM4mJCEKorpjA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xxFwdI+UrpH2qPoe0lsg133wbugnuySZMal3pVm1y/H0Kje3LnqEJeQc5F0gCV4L0DC0zKuJmGRyKxT6VLmAjPXtrRExs2HXTqKQHlrgmYqmZbSm5XP8pboGy3mnJVSsYr1pQmG/YhOKACjWI3gUImGENGDMrfkGTbr2PPjDbmyzV7vg+Jooz6koWjhptGHrb3cuqlrlwET7jg776WIfsx3mBdLBBBl6e2d/1TZDBH9oJxZjQ9jQFlzMIBjwMf+rwmByT9A5JXQ2dwuGI/9Rl0T4EO2pkp56wO9lwgZ+IAXJsjKg/zVilK+fQJ/ex7iJt4Vedozxxai22e4v8HYLsRKhSuaOmVkfK5GRpHZXhbyi3ntr3qVtHxpv1t7AtKRVj0TsbKleQxSBZIOIPf/+eQlPRszPEVm6YcSVgqyHVLzQhqhMmKdwaXGH2lG2oa3iNnQlystBGcNoicbhWlBL7GUBNoMrYXeTh1vyci0ww0f4xSejbUzcI/Dd/4mYCL5OQgSWdfkN/p0VexDuECx5rY0r4D2jMz+0Sde85BZ4GcAlifd1L3PU31EjOHDKZ4vIo80Vjpmv5D2DrUwKrD0UGzQeaqFzQIrPD88q0iCRrxI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abe88e95-e466-4a91-3717-08ddf47ecfb7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 17:39:24.7349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEKqix/VQbYhicNchPBJF2FtfEqpneQZLqp+F13IfFwjunvzA7n4y4z70m2NbNedfEyln1EeWR5icGmymzqTbkcmQ3aXAWI/IGo8RuTy8QY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7184
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_06,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509150165
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAxOCBTYWx0ZWRfX3pzrJjcuVLhS
 szwNcipO3mm1/Ts9wVdceZGmycKC0nMEUth1uAme90QmQzNPf90lsBUHXY2E0we5nFDPTXPisrT
 7cqWxZ4Lb4lRLYPmr1fNWZdQXI1QTJnOjD2UaBVF63irYuL2h/knDp/LD3t7GAMpFQY3eTyt6eF
 AnGRxyVAqfarHCCn2Tm7ust0SD2gbjtmBFEdqMh71+CN186e/cOy5DhMg3YwjR16D8eL9oyKoaB
 4JGVSruYoDaOML2k9mUWdEOfrJudvZ1E43or4O1yssFEpU8ImV57gQ+WR/HRQOUoESbytd4VV4/
 /R1AMzkVp41UvvZWVcK9gGpcItvPOKT5N9hgUSTBlDPHrmhRnfy2QmT80QswUkrDRt7ahwrgVw1
 /pgrPzla
X-Proofpoint-ORIG-GUID: UWGCa7h7vIDcTemNBTPBAvU19xAUTJz_
X-Authority-Analysis: v=2.4 cv=YKafyQGx c=1 sm=1 tr=0 ts=68c84f50 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=N5g6O-dRQGs8yKlYIh8A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: UWGCa7h7vIDcTemNBTPBAvU19xAUTJz_

On Sun, Sep 14, 2025 at 12:18:20PM +0100, Nick Alcock via DTrace-devel wrote:
> On 30 Oct 2024, Eugene Loh stated:
> 
> > E.g.,
> >     $ uname -r
> >     5.15.0-205.149.5.1.el9uek.aarch64
> >     $ sudo grep ext4_dir_operations /proc/kallmodsyms
> >      ffffc45a59d9ee88 100 D ext4_dir_operations
> >      $ sudo awk '/ext4/ { print NF }' /proc/kallmodsyms | uniq -c
> >        2342 4
> >     $ sudo grep -w ext4 /proc/kallmodsyms
> 
> Something is presumably wrong there -- ext4 should always be considered
> a built-in module if it's built in, that's what built-in modules *are*,
> things that might be being built as modules but aren't.
> 
> i.e. this test is working as intended and pointing out a real bug :)
> whether it's one we care about is another matter.
> 
> > So, lots of ext4 symbols (including ext4_dir_operations) but none of them are [ext4].  Bug in... kallmodsyms?
> >
> > On 10/25/24 17:16, Kris Van Hees wrote:
> >> I am not too sure about this patch...  We are not using kallmodsyms anymore
> >> for newer kernels, and on older kernels that symbol certainly be listed as
> >> [ext4].  So, if ext4_dir_operations *is* in the ext4 module code (compiled in
> >> or loadable), then the proper ref to it would be ext4`ext4_dir_operations.
> >> So the test should be able to use that - if not, that seems like a bug rather
> >> than something to change in the test?
> 
> Yes.

OK, I will mark it as NAK so it gets removed from my tracking.

> >> On Fri, Oct 04, 2024 at 12:43:55AM -0400, eugene.loh@oracle.com wrote:
> >>> From: Eugene Loh <eugene.loh@oracle.com>
> >>>
> >>> It is possible that there is no ext4 module, whether built-in or otherwise,
> >>> even if its symbols are present.  E.g.,
> 
> That wasn't true in the kallmodsyms world I wrote this for.
> 
> >>>      # grep ext4_dir_operations /proc/kallmodsyms
> >>>      ffffc45a59d9ee88 100 D ext4_dir_operations
> >>>      # grep -w ext4 /proc/kallmodsyms
> >>>      #
> >>>
> >>> Meanwhile, in
> >>>      ab883bae "tests, io, scalars: use kallsyms instead of kallmodsyms where possible"
> >>> we read:
> >>>      scalars/tst.misc.x needs adjusting to check for the presence of the actual
> >>>      symbols we are looking up, since the modules might well be built-in, and
> >>>      thus not show up in /proc/kallsyms.
> >>>
> >>> With that patch, in test/unittest/scalars/tst.misc.x, we check:
> >>>     -if ! $(grep -qw ext4 /proc/kallmodsyms); then
> >>>     +if ! grep -qw ext4_dir_operations /proc/kallsyms; then
> >>>          exit 1
> >>>      fi
> >>>
> >>> So it is possible for us to find
> >>>          `ext4_dir_operations
> >>> but not
> >>>      ext4`ext4_dir_operations
> >>>
> >>> Change the .d script to look simply for `ext4_dir_operations.
> >>>
> >>> Signed-off-by: Eugene Loh <eugene.loh@oracle.com>
> >>> ---
> >>>   test/unittest/scalars/tst.misc.d | 2 +-
> >>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/test/unittest/scalars/tst.misc.d b/test/unittest/scalars/tst.misc.d
> >>> index 60edab45e..6a5f4ae2e 100644
> >>> --- a/test/unittest/scalars/tst.misc.d
> >>> +++ b/test/unittest/scalars/tst.misc.d
> >>> @@ -20,7 +20,7 @@
> >>>   BEGIN
> >>>   {
> >>>   	printf("\nr_cpu_ids = 0x%x\n", `nr_cpu_ids);
> >>> -	printf("ext4`ext4_dir_operations = %p\n", &ext4`ext4_dir_operations);
> >>> +	printf("ext4`ext4_dir_operations = %p\n", &`ext4_dir_operations);
> >>>   	printf("isofs`isofs_dir_operations = %p\n", &isofs`isofs_dir_operations);
> >>>   	printf("vmlinux`major_names = %p\n", &vmlinux`major_names);
> >>>   	x = 123;
> >>> -- 2.43.5
> >>>
> 
> -- 
> NULL && (void)
> 
> _______________________________________________
> DTrace-devel mailing list
> DTrace-devel@oss.oracle.com
> https://oss.oracle.com/mailman/listinfo/dtrace-devel
