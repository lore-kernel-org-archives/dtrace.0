Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11CFB67E
	for <dtrace@lists.linux.dev>; Fri,  2 Aug 2024 22:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722636540; cv=fail; b=LSolqi86otRdjtgcCZbzSPWr8cT/9Zj8UToqs3VsiQ4fWLdauLqP54hJN4anmw3SJY3Y9h3j098sm6BUrYeD9VwE7z1gwD+73iP7ZCjjH0OQwuvOEQ+sf8iaCVwOIdaDNWF+X5GbQ1ZbARbz21bxyoQsBg3bAIE6WQYmEuhpE7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722636540; c=relaxed/simple;
	bh=fJ/tFeVako5avfjngUZpvJ8/R2Jzz4yC+kcf/nbzZqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Lo2Nzmh7h4YRZCWtjcMw6JGgwCkvD9hKoGzdoVmw2QfQD/+ioZAm/jVT2nsvqBd7ZDe22+qpTPndeoDd4Brf9ndm9dA3fusIbCLc+DB/bOcPdfAVHrIBwVSlY94wIFcWcAx2Z5WKP/BmQRt1ha9+gXdSRaYERYyT52oUdviW5jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m8i4fzDC; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=DiwEc3Ja reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m8i4fzDC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="DiwEc3Ja"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 472GtUor002987
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 22:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=qHNWaBV86W6ChibnyExguvsr04qv5+zPivHaCruRlwo=; b=
	m8i4fzDCqNL00hO5RXxUnqcPy491qNc/79dD8mHoz+ZUio8cXoLLGI44ra+t+5fc
	hph+ZzuGfae9eGky/aWZsrninRU6VW/tQHCIzYr8w+AmZabNFhOUj8tuCDoq0w+G
	IcboMEnzcXSvQWccqPNAfvKgoj2CdEnywIS/vprD36JE4m0/9SuNcYsDxGFWlwkd
	Lo3tlhJsmCJ/tn2wRLEHNgS87DVBPNVTBrqi89y7+k6Ra2mO0xFVfQHMOfvnpps4
	FnDxt4zU3BPH3cshtbaBTTFDPzU+BsA8AWl85bBhLy8uaQ9gwghrIX5pydlM9DVP
	b7WOaymnxaynb3S9fnFjSA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40rje8j9mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 22:08:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 472LVDNg037814
	for <dtrace@lists.linux.dev>; Fri, 2 Aug 2024 22:08:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 40qmpuxmdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Fri, 02 Aug 2024 22:08:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJjfu1ee4CDGiFm2l8N681x64wH55EzaMtiIuhO3Sod1L6YQufFFZR9OY+wY4QaGFRteH43IaOb10BB95l3t4fNIIQxK/a0DB2qSc5WnqWzlurIm+c1Fl6445rENxGMSFzKK5uLv13Hlh3SPHCQvz8hqjvAsm5e4qiYt3P2wYLZaPA6YSvUg9pZvxhdBPCV84zcnYkCE7XlbCV2TYkTpeX5/E9v4UV805feHb3/sJRxqMP93X1LXBxXkZPvlv77W5Qw75/Zw8Rlip/TpsVQ70zMSV/bBAI1La8Kn7IhEO50hI1PF01+YEjeoOvDNWlPKBWabLe4DfUjNvsFtCfzb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvGQURdy1hXqKX04d/oezD+N4RaY8zkcUexmz89tJSA=;
 b=NFugjftiN8Tu4568z/G1vuO7juwYV4ckHN8F0JwmOEN9EflPEZyMRAIxaVBrMpJV9wcgKiS+lozhWtWZd4vs+JAqUcZe+EieBjxQcZpxM45VtNAlP6PQ7mCThgX2D1/HNTs0FbOF8+Fm8R+lKxy9jvD440RjKvVBX3GCL9NF21nrQQbTRpEfeCyG5PmR8A+x5gutZVY0M/J8ct5Ei0v3K/zmHTzDilpCsvsuCoOk4yhBlGFsSl5skpz6mqq7d32q1yaKZAxw3slwkqDm+DCJDVkJ6MJJskVc30QRsORDXaq2nEX3TQPAtQM9/UHWkhXmtyOvtFA3FqXL1teSWyyQoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvGQURdy1hXqKX04d/oezD+N4RaY8zkcUexmz89tJSA=;
 b=DiwEc3JamKOkPX77eKI1DLvJ0OTTwCcXW5MzJiqO65tREsDk5z27EW3OGv9i1P/7mvVWKQTRVD0Wz7pQhQOc/wT7Iov1xInfZUffo5K/eWGvKXClag1NhWq8lOS1kCJzWOqPe1akyULa0wsk9ozCjL7AvMzzWHwr4izRnSAdfVY=
Received: from PH8PR10MB6292.namprd10.prod.outlook.com (2603:10b6:510:1c3::5)
 by DM6PR10MB4268.namprd10.prod.outlook.com (2603:10b6:5:220::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 22:08:52 +0000
Received: from PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6]) by PH8PR10MB6292.namprd10.prod.outlook.com
 ([fe80::7f53:c7c9:4dc6:d4a6%2]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 22:08:52 +0000
Date: Fri, 2 Aug 2024 18:08:48 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Eugene Loh <eugene.loh@oracle.com>
Cc: Kris Van Hees <kris.van.hees@oracle.com>, dtrace@lists.linux.dev,
        dtrace-devel@oss.oracle.com
Subject: Re: [PATCH v2] test: fix another use of a kernel variable
Message-ID: <Zq1Y8M2lPHxJEYwX@oracle.com>
References: <PH8PR10MB6292435D6EEF211506E49899C2B32@PH8PR10MB6292.namprd10.prod.outlook.com>
 <e6e325dd-d515-715f-13c2-a6d698174ba3@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6e325dd-d515-715f-13c2-a6d698174ba3@oracle.com>
X-ClientProxiedBy: MN2PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:208:fc::23) To PH8PR10MB6292.namprd10.prod.outlook.com
 (2603:10b6:510:1c3::5)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6292:EE_|DM6PR10MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: 439476db-2431-4262-256b-08dcb33fb14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?PS35lM0d8YR3dkgWFk1YOAI6j+lY5eEBaJ03n2H25wxoK/qmUwHUN8Kds9?=
 =?iso-8859-1?Q?TP1WM/3YxQDYZFkl9q46gfpvDiHoA4l9XsmeLluG9pvn1lc2k3ddp259Pz?=
 =?iso-8859-1?Q?eW0+n4KgFTjfBqYBJ+GOsK2KzFSeC+K41WLKxlHHV+6lUNsBHEd2w5cNiX?=
 =?iso-8859-1?Q?l0hgq/ZCUXwQ9W1PEcpVlztoew1h+HILBlSD465ns9up3Ko645fFlqAInO?=
 =?iso-8859-1?Q?3Urem7tWSYsk56tkiZcewu8HnggUO4PdwB+P/jsTyxXRj6VqPc/g9dR4bi?=
 =?iso-8859-1?Q?2n/PLSqRXtlQyV1KsDEEuRoTF35Xq/hEA3TravTZyDGFIaWddeElfEKV4Y?=
 =?iso-8859-1?Q?514gYbxkQSxKkXPPBzzQdecWIt9NST1ID56vGZOyKUSafrch2/qQjSIaXp?=
 =?iso-8859-1?Q?qYoqlMMvzv5YN0UvVoDWHf5zMMzlJHfXpPgqCH7yLy+I+moJHygvq0Hf9T?=
 =?iso-8859-1?Q?p+zeylEETCVjpA4a+GdeqjgCf7TwAQxzO/OAsmhRM3Tit5H29IRKz6m3Ij?=
 =?iso-8859-1?Q?YwoejyCwkKqUX5zrUCXtFlSdSJByytVs7Kdd+dbl9OMbbiXahry5qs8fo6?=
 =?iso-8859-1?Q?x8/Fc+z5oMk0HY6IlKVDbRyXKDzfDz8ycioU86OwN1qN6k8wbq9ebd+yjn?=
 =?iso-8859-1?Q?5zn9MsDhbYL5JJD8LzP/eymzam2deIWiSlB8RDDBBcr0Q1InEg4DDlvNuH?=
 =?iso-8859-1?Q?hjTCZhtaEDe6BHFHMsZD0EntrRlDrxAWi9aeFOgxHLxDOG8iLiTbYeIbbA?=
 =?iso-8859-1?Q?Y375xc9maJLrgguVVjjU9I5hD3NbfFXHIWDNiRXkdoJO+Y1hTUqXhMTLBA?=
 =?iso-8859-1?Q?PsIeQGDQDDFaLxvrOfvr/oCuj0t+wY5AlFjO216YNgESk5pRb8j2wnzGkj?=
 =?iso-8859-1?Q?tzMPQdBu863rlEWlXW+aQDbdtj7K3fDOzGpiuyLsP+5+cGW195sCYtvKxC?=
 =?iso-8859-1?Q?9VFG8x3JCzv7ZwdOMN3uW/6RAx9hIWC7o02sSovSAaOGRncKHbRSEPfTom?=
 =?iso-8859-1?Q?5lCTb2pJm6M/KEWzGK1w2zXNVt7kqsTOKrpPJZj69opDv/s2feoH3b9FZs?=
 =?iso-8859-1?Q?DfPbHExuPYZ8q3Oyvx2ZptfsPigzYCTUnMoh0+LaGUDJ0mUm48FeDEojnY?=
 =?iso-8859-1?Q?JpRj3sQwfErhLwc5FHbcCd05UA0T0/NpEr+57ZMvLb7hnv3nArD9zQQJh0?=
 =?iso-8859-1?Q?QOg2hBbYLCDVEEKJ7igCJ0No3NbIitugnx+tttXKPUOYa45qU7qNq30rbX?=
 =?iso-8859-1?Q?i9z8lGN0u/vFbyeO+xrqwxMauM2Aec4L3AZBmAThTx1xd4vdLbrTDtOMly?=
 =?iso-8859-1?Q?e6irZw1LQrHiQet8rWlHbdPXjQ1KgR1MuAHralTekWuzxF0jwXAPcgjlv1?=
 =?iso-8859-1?Q?83IoLjKzkHDUDdHNsK8HLhNXKAfBweZf6gbpkyE20uNI8t2FMTFBY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6292.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?bc67oIgcEqZ9/jUIpHQ+dNPbvZ7hyS3oeXWYFRiZQnphZtoun9+UEtpeZf?=
 =?iso-8859-1?Q?0kplap6rlMyGetAspgSTB9ZcD5IwuIORwx41YNRujwC6FKF4LiYhXRB2zA?=
 =?iso-8859-1?Q?K2ogvCi8ifLfMrbg5QnUW7CT2kuBxOqiHZNmZrEHuQg8jEU+PRU/c9i9kH?=
 =?iso-8859-1?Q?82kiazBeMDqwyvTqpVi6HCn3vMMKbbLjll7ZDBIVYS9ZCWerlyCC5QbJxa?=
 =?iso-8859-1?Q?ScZSoilmz04FuhKepJA/0oJXI3JvVGo2sszepj1e9fdH+SZD/6ZX2xokOe?=
 =?iso-8859-1?Q?TN2iMvZ4oe4AAOH6Jf+jmd1g8xOsBurTRSnpLCoOzMK+oDtnUPyQqs6HfR?=
 =?iso-8859-1?Q?OsjB6h8ekQn3/2g2mKcwLtqupHD7p1oAgDHTt/5ff4hF/iJwP3tYILrUp/?=
 =?iso-8859-1?Q?VfJ0B4Av6xs+FBZnCsxoG935wV/SrBTxxKnlu1IGP3EExy1w14pAoCNXAY?=
 =?iso-8859-1?Q?BuvB1KRSV9L9Dyq/qZXYyx6tK3dwqMYPErXVbtIrxldno2TwWEeosBsjTG?=
 =?iso-8859-1?Q?vpOj1qCaRVM1hpmG6UV6Hnm9VIYX3VoZnHhIX9JfRqXnuyNVCPtf4trBay?=
 =?iso-8859-1?Q?NR3+ZItL9FZqbRtPhU+goXG6HtoUXibamzE7rJNmPgnkPsrny4wDWxEEnJ?=
 =?iso-8859-1?Q?kS2q7v7rFF+3l/z9MwPCcIGhG0izrfEX0eln1z+wDOzaTO97zFeOohr+cX?=
 =?iso-8859-1?Q?3jaAlbepsRJAeI7aO7aVO/jm5JNMTUwzRfjnbDG1NFRn0XPxZlkDbE9p+Z?=
 =?iso-8859-1?Q?/uj+KAt0Ig19ZYXBz99d146uR2tg/xmp0Ab0O7YJbJmaV1iJqY91126zvr?=
 =?iso-8859-1?Q?YUQJDKkE2Nif2BP25AI/J6JGb0KhwwR7dNPxZZHX7qJOhk2FQr9ikzIT0x?=
 =?iso-8859-1?Q?6RHfcZL7vTLOApgQ/O6WKqWybKPRiwRy5nny8KACnofFYn5TxE0t6oogIg?=
 =?iso-8859-1?Q?FBiBbSQgQWvhUXkfmZWruGUBIMR2gqrtu1ogGy0VflCZGsD1baP/oN1vgi?=
 =?iso-8859-1?Q?K2rrWQpgEtjXSGTnW97cWPaH1uFci2b4ym+6WF3zeJUEW/jTyHDPKHjXPC?=
 =?iso-8859-1?Q?cR2vNhgkjK8ufLQxELuQF69cEpp074nNoUlOqWawV2snRLNgFpmyrt0MnC?=
 =?iso-8859-1?Q?uNMDi1Uxh9weqY9TNVxvJaKofbMOSaB/66D2p0P/em2s1E66HLHCWq39f7?=
 =?iso-8859-1?Q?TGfcH/tb1Umyy0kixqbdJnn0d/7GwIBmHqxxbBCcyBjDNGj1sya31hpVEe?=
 =?iso-8859-1?Q?SprLnmXdsY/2Jmt7ixUY8i3spbE0TEgvVexGNhE4cy9cV/XybD0zps5Qzm?=
 =?iso-8859-1?Q?WpmkXkQRWRXi3/N0VIg8w2DJI/n8Z8AW0nC2PgRdQHGnjoxQQ+IgNRox00?=
 =?iso-8859-1?Q?26aM1z79nvPjniqrwAdo9eCGceskOxf4y/aFvWMHHuStIqg2XbnxMMLlBP?=
 =?iso-8859-1?Q?Gt9xccWvAQrkflIRw+nh9yYAocfrhI8NCcycvX2DX3bHGm2el65JbVHYgV?=
 =?iso-8859-1?Q?CAVBmbsZeYphmwH39C10bTSV0qw+g1k+cQz+PA4qW4l0NsrKxUFuVDdW5k?=
 =?iso-8859-1?Q?WBjwcQE0lRpe3y6a3XU7iKAhjWrh4N/2L6FI0WbCNJDlRGMrfa10wnmhD2?=
 =?iso-8859-1?Q?5Z9aILFa8k2GAWoEovYq/uXEnbicRqqjItvUY0vVNcHlqLdSyFGN8ymA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6AjgqmEQu35/aFcBmKISBM9Ubi3c+lMnf8xRF2pgP+tgBYvoxYCetD6J05Np1XTuOTD5WGGXX3L1HDE50HQnZVKIfTD/WEanJXIIzpAMAOslz6Gk5b/ZgDBU6TkZ7+iUoBrt9sX449EcBOoQ58WZOWv6sPUkClAyDy1tZfLgsWedvHBFq54kHrFGkieKgLIuG6mHzY/eDtK9pHuMb/WYCgt5NQdx+eDmrYrSDavTVy3yYnDG1DMptDWF0bkvFT3vltDyNtAPSiVz7te1lwXeqfw9rzhYup39ttboPbx+8KPsbqYVqUD+mK6xhot/y0cvqHXdX/zoeiv7lp63pdQcjceho3URFRCAzy4toDclWGh7mv28IpDgk2/aFlH9+jsFr34WntPQMHaUg24h0JOxWkFtDdTR32KOEi3SzZX2dBQflsUh9CAaG6SB/cxIPmfr8wSQ82FKHZpozPJE2QZBYzzs+N0jvfS+YRcdQbbig3NBehq9UkMpiXFTMRRCH1Varpfvyhei1K6G/el1USk13lIhWqMgQzJCd0mZL/pQEIfbo/8QQClYOzI9t5Sa85Ttg1E4+T3OFAa/Or77TsdE0Tassb98kvicUn87lg3xHn8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 439476db-2431-4262-256b-08dcb33fb14c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6292.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 22:08:51.9579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEGcdRMxuIaoHhvGI3Ei7G7nRDvn3rSsn8cwdgpEvUs/AjoOvPOiJFmr+ykPnZVHW5tEbGcMawXuGy6dH4q+m0Ekiw5sEEcbRFamPz21CRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4268
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-02_18,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408020154
X-Proofpoint-ORIG-GUID: qoEXN-WjphssCM0sVKcEWwnXEeQWqKj6
X-Proofpoint-GUID: qoEXN-WjphssCM0sVKcEWwnXEeQWqKj6

On Fri, Aug 02, 2024 at 05:46:09PM -0400, Eugene Loh wrote:
> Reviewed-by: Eugene Loh <eugene.loh@oracle.com>
> 
> Not sure if you want to change the subject line to something more
> grammatically correct or more specific.  E.g.,
> 
>         test: fix other uses of kernel variable "linux_banner"

I'll fix the subject line.

> On 8/2/24 16:38, Kris Van Hees wrote:
> > Yet another case where lack datatype information for kernel variable
> 
> s/another case/other cases/
> s/lack/lack of/
> 
> And though I know you don't intend to be exhaustive with this patch and
> though I don't understand the underlying issue well, what about
> 
>     test/unittest/io/check_io_probe_args.sh
>         printf("BEGIN { printf(\"%%d %%s\\n\", %s, stringof(`major_names[%s
> % 255]->name)); }\n",
> 
>     test/unittest/printf/tst.str.d
>         printf("command line = %s", stringof(vmlinux`saved_command_line));

These do not need the &-operator because of their use of stringof().

> > (i.e. lack of CTF, and BTF does not provide it) requires an explicit
> > use of the &-operator.
> > 
> > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > ---
> >   test/unittest/options/err.D_ASRELO.kdefs.d | 2 +-
> >   test/unittest/options/tst.knodefs.sh       | 2 +-
> >   test/unittest/options/tst.linkmode.r       | 2 +-
> >   test/unittest/options/tst.linkmode.sh      | 4 ++--
> >   test/unittest/tracemem/tst.tracemem.d      | 2 +-
> >   5 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/test/unittest/options/err.D_ASRELO.kdefs.d b/test/unittest/options/err.D_ASRELO.kdefs.d
> > index 0a42fc6e..06bfe24e 100644
> > --- a/test/unittest/options/err.D_ASRELO.kdefs.d
> > +++ b/test/unittest/options/err.D_ASRELO.kdefs.d
> > @@ -14,6 +14,6 @@
> >   /* @@runtest-opts: -xerrtags -xlinkmode=dynamic -xknodefs -xkdefs */
> >   BEGIN {
> > -	trace((string)`linux_banner);
> > +	trace((string)&`linux_banner);
> >   	exit(0);
> >   }
> > diff --git a/test/unittest/options/tst.knodefs.sh b/test/unittest/options/tst.knodefs.sh
> > index 532d7eca..da65c49f 100755
> > --- a/test/unittest/options/tst.knodefs.sh
> > +++ b/test/unittest/options/tst.knodefs.sh
> > @@ -9,7 +9,7 @@
> >   dtrace=$1
> >   $dtrace $dt_flags -xlinkmode=dynamic -xknodefs \
> > -	-Sn 'BEGIN { trace((string)`linux_banner); exit(0); }' 2>&1 | \
> > +	-Sn 'BEGIN { trace((string)&`linux_banner); exit(0); }' 2>&1 | \
> >   	awk '/^KREL/ {
> >   		print;
> >   		while (getline == 1) {
> > diff --git a/test/unittest/options/tst.linkmode.r b/test/unittest/options/tst.linkmode.r
> > index 4b453f56..acbf8025 100644
> > --- a/test/unittest/options/tst.linkmode.r
> > +++ b/test/unittest/options/tst.linkmode.r
> > @@ -14,4 +14,4 @@ Linux version
> >   -- @@stderr --
> >   dtrace: failed to set -x linkmode: Invalid value for specified option
> > -dtrace: invalid probe specifier BEGIN { trace((string)`linux_banner); exit(0); }: relocation remains against kernel symbol vmlinux`linux_banner (offset {ptr})
> > +dtrace: invalid probe specifier BEGIN { trace((string)&`linux_banner); exit(0); }: relocation remains against kernel symbol vmlinux`linux_banner (offset {ptr})
> > diff --git a/test/unittest/options/tst.linkmode.sh b/test/unittest/options/tst.linkmode.sh
> > index 4e28f8bd..07045fd5 100755
> > --- a/test/unittest/options/tst.linkmode.sh
> > +++ b/test/unittest/options/tst.linkmode.sh
> > @@ -1,7 +1,7 @@
> >   #!/bin/bash
> >   #
> >   # Oracle Linux DTrace.
> > -# Copyright (c) 2023, Oracle and/or its affiliates. All rights reserved.
> > +# Copyright (c) 2023, 2024, Oracle and/or its affiliates. All rights reserved.
> >   # Licensed under the Universal Permissive License v 1.0 as shown at
> >   # http://oss.oracle.com/licenses/upl.
> >   #
> > @@ -12,7 +12,7 @@ dtrace=$1
> >   function mytest() {
> >   	echo try $1
> > -	$dtrace $1 -qn 'BEGIN { trace((string)`linux_banner); exit(0); }' | cut -c-14
> > +	$dtrace $1 -qn 'BEGIN { trace((string)&`linux_banner); exit(0); }' | cut -c-14
> >   }
> >   # Test different link modes.
> > diff --git a/test/unittest/tracemem/tst.tracemem.d b/test/unittest/tracemem/tst.tracemem.d
> > index 716b119f..fa838454 100644
> > --- a/test/unittest/tracemem/tst.tracemem.d
> > +++ b/test/unittest/tracemem/tst.tracemem.d
> > @@ -14,7 +14,7 @@
> >   #pragma D option quiet
> >   BEGIN {
> > -	p = (char *)`linux_banner;	/* first 14 chars are "Linux version " */
> > +	p = (char *)&`linux_banner;	/* first 14 chars are "Linux version " */
> >   	/* try tracemem() with various sizes */
