Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A87286D5B
	for <dtrace@lists.linux.dev>; Thu,  3 Jul 2025 22:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582200; cv=fail; b=ksgHThmuvERlWIbmvk+tu23pScrynM1sg9qStSmi3OENMJ7+vLZCmvCOx06g3NuZ/yZRHpOeSmLcs/pcSurNEzCyOt6HYfuVYALAGkPkh7KjrAQ72RWBotCA5g8p6bTuGwtNa7RLrw+ZWzPRQiTqUkgSss0FGbBi+J7OCgHlNhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582200; c=relaxed/simple;
	bh=OnP3qk9/0yhulrMN7fcI/Zgl2lWSzQ0bG8aui1T2YGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=H/sX9m7IrMra2Agfpc9A6bDvpaOD77YfXkNFK+m5HlMJ75xLPbB3AYSBokCv0Lw5SpVjJy3Vtg7u8WS7vEVeGQJRpNYvtvVmDWeypOF962FDdQzsiiLS+zG8RIgmNpmuMYB42z+18bTsfb9U8syEM4ykbTQj/AutdYHOoaZKAm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aa9v3uRm; dkim=fail (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=eUS42Cn5 reason="signature verification failed"; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aa9v3uRm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="eUS42Cn5"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563LYp5V002272
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 22:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=od73JpnPCZ1y+TbjquzvWKVYiFHLDhMrbjPMF7+5FiQ=; b=
	aa9v3uRmjbH0rsyZj5pBsk0mrIlXX9RMHjpvQE7QyAAviff+TmH7PpWT0D/HtFnh
	KEFoCz/SRkKJ+bK8752QvO2qzygme6wQkn+TvRhM9picziLB5+uDdnzzqELTC9oD
	9E6oCxvKFUGkktWCgX7g1SzS+8xIt0q0ZC0+cPRTw+Aawd7HBxRdRGdCbVwiYnbs
	29uJWndWMGakB46Sbkvn0Gd4XQ+NOTbLogrllfwLqWuVsAlPNMhiMjhMSU1X1skG
	fbmh0FPJJdCMy9RwxI82mvb6PC13JkwN7ny4z1Yte6784BWAxnSr5HZXd+UwaReN
	mVgNyOyIjRIVEtfVFXr9PQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j80w9u1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 22:36:34 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 563LsKmP015189
	for <dtrace@lists.linux.dev>; Thu, 3 Jul 2025 22:36:33 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6ucxtkv-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 03 Jul 2025 22:36:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXsNNYD4c6bvzd8sKhz+TSW9nFiuXt+ZYmPhAHqiYHNHigPkpPvjeP8OTS4xwCmFirM7Mlx2fHuULnQ0sFz5nRpQjMJRQ51/rGEy0/mKVfdM/SnCUKesd5bSuEn8824pQ40OgSHTeKCKoK85YOBFelVXP4vKyDae4Sofq2qwlObli8HcD22T4OY+CvaaMoM+2dx8ldZFavnwuxEgZb57BUGvWTALky4Jt1FR5S09QrCqN0PAUirYrSsqdVMUoM4nmWAKHofYH9jxQVKOcdgMJiFpvvlfOcCvELhJfhZYD78zP1KzmJZGYAsLGd1wQzchcGM/sDY7RH1YEvT7fz7BUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zWqFx57aXD5YQ5qXPbeu3IaBb5o44YAIEXfmK7NPSo=;
 b=o1qhV3XJvhBRQoY/blYisO+325TNWETqgdoQEk2Xdd0aOHl5/jdcM3zEAM5ApMwpz2t4EcplXbuET3ao6el62wk7/o5b2cor2ilBE7SM815iGVFfccoeTaNc3u5gfdBqSnppdLXYuU7ebcEqH2YHektDPkBOfJLrsMkMSYH4SN+fT35k2+5N6aAS6kg5opX7NhgDk0VyVO4GLNci/UQCMiMI7TFaFt+4m3tZ3s3+nRwT9t75y8O2sO32R2CceXgU5pZFFyQ1cVarUynla5Xt3g2+jWybuE+5K3D8sBLjSUbuGP5OxVl2UbrciALBbwpSLdnu8nxCWppxOSc1laR0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zWqFx57aXD5YQ5qXPbeu3IaBb5o44YAIEXfmK7NPSo=;
 b=eUS42Cn5oXD8mKzBUTLfJL/74sZJwAzVtYSdiEjvobA7LRhmF0wCWu5FR3Qz9xaHDD0WF7SvOFOQZgDQIuLMb1pSuH+nrlgeiqI16phdMjFrrEbwFCd9lvPONGtgx79gSE4LrMTN7Nb7L/Ga1vRXK/fY+OsRoUWK7leslHLAYvA=
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com (2603:10b6:a03:3ef::21)
 by BLAPR10MB4849.namprd10.prod.outlook.com (2603:10b6:208:321::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 3 Jul
 2025 22:36:30 +0000
Received: from SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b]) by SJ0PR10MB5672.namprd10.prod.outlook.com
 ([fe80::8800:9203:9f66:174b%6]) with mapi id 15.20.8857.026; Thu, 3 Jul 2025
 22:36:30 +0000
Date: Thu, 3 Jul 2025 18:36:27 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: Alan Maguire <alan.maguire@oracle.com>, Eugene Loh <eugene.loh@oracle.com>,
        dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: Re: [DTrace-devel] [PATCH] test/utils: add more reliable "get remote
 address" approach
Message-ID: <aGcF67vQ8M942gh0@oracle.com>
References: <20250703113345.1273604-1-alan.maguire@oracle.com>
 <e660b225-4a3c-209f-fae4-8831f6c3229c@oracle.com>
 <08bae006-f438-4134-a811-609b3fda69d1@oracle.com>
 <afbb9858-e5a7-6d76-a6c2-23b46d8660df@oracle.com>
 <58cb8219-337e-42ed-ae17-1c4e77894a9c@oracle.com>
 <aGbLTOzqILN+3J93@oracle.com>
 <a2f593f6-38d6-4a8d-8d42-4bdb6b9ac14f@oracle.com>
 <aGbT+p0DjRTFl7Oc@oracle.com>
 <077a08c1-e999-4782-9269-62a269d76f65@oracle.com>
 <aGbvQAmqsLA5+LaH@oracle.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aGbvQAmqsLA5+LaH@oracle.com>
X-ClientProxiedBy: BLAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:36e::7) To SJ0PR10MB5672.namprd10.prod.outlook.com
 (2603:10b6:a03:3ef::21)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5672:EE_|BLAPR10MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: a991caa2-cb68-4b30-60ac-08ddba820e51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?FvX3Nb6xBo+F9x4kDZqtvxB2zDZv21XHoHwAMrw9a+5WhHaF9JUVX0bDeU?=
 =?iso-8859-1?Q?9GPmhSIBdQtWLYVayVNZUetVGWunliWCGXiuFTuj+U/vu8AGHs58acCQC9?=
 =?iso-8859-1?Q?2nQVwnNFJz9wnfbhfp92VgDAXM5q3GwIrPI4euE27wY5IPFOXMDqWBjMbv?=
 =?iso-8859-1?Q?10fAU79DZa0db4xUNzKhnxT17QdyB4t8p3zqDJ+iLxbjv6WxRejyt2CkDf?=
 =?iso-8859-1?Q?bge4dYKvnW4IMc60RPHTJqDRER8IQ5Ll4+TtMyvsRqDMgogGWvgDe20APd?=
 =?iso-8859-1?Q?KP07SrwR6JcX99/MzYALN8MZWjZRdACd894dSC5udGTAlUMreq+7KhM0P0?=
 =?iso-8859-1?Q?nRLYnlS2zqZlFbvLnwnoqsBFI4RkwvmoolEbycNFsdVTuqschHHSgUZCDO?=
 =?iso-8859-1?Q?kKZpxZzshDfErDCEwolpoQo3Ix4ZhUscm7d+GeYYm/3GXPKNu2Dpr68fO3?=
 =?iso-8859-1?Q?owrhD9v+DPMFbezx2dxCn4TSL+UHMhBWcB8v5NE/Ona9oVqwad5DCygoWJ?=
 =?iso-8859-1?Q?S6RveQ+b9JG9bujxQbqSPi5KC1D0I4MpCtBPYqlOytmGY/OaXT+6LSeWKU?=
 =?iso-8859-1?Q?mSIwhGKHC6MapaxRu8g15tYbY/4PMBYXD6qd/yAcX6PS72A+BPraxpbMhk?=
 =?iso-8859-1?Q?jikKpMGvElNg2awQ/rUJi09zb5sUI9pDp4ufN8DfsizQni5AUsQxHE1DRZ?=
 =?iso-8859-1?Q?Z1i71pW12ypENNA2+NnjnoWSuOV5GROz/q4gek5xX35FqKYg0R8SuWXYhi?=
 =?iso-8859-1?Q?V2ydHsGr5wp6KV75wXxCghIzdN/62nSI/IUj8/m2yqtK5yYlTyZcf0h3Ay?=
 =?iso-8859-1?Q?DMVey9p1LNlnq80ofwc4tqSe6S5ucYfK+Z5WW5rKbHmQ2PEpLTWTr83cr/?=
 =?iso-8859-1?Q?+Pq0EyiSSrnSpwcldgEX8aJ8NChNEg8wDhbQH6sETlu7W1r8/Ef5f9LWSg?=
 =?iso-8859-1?Q?e062UiRIFxFly02ZCeyY+1gDAmKxWdY5Y2vRiY1jkk0UWKb/qARlBH1WOd?=
 =?iso-8859-1?Q?mig+tyV1HXI5Yi7/OpPuL7vOqVD5mQRL2QoIL64yGEShLC2PytYRyx6I6e?=
 =?iso-8859-1?Q?kj6XAjisvunczyaZrAfnsrcp9FjukaeHhUzDbKd9JDpraKGMcbovGKJFTX?=
 =?iso-8859-1?Q?yGRd6/kFsY1THQGEYCWhgMueKSMLUaTJlNeoRu/nJ2q698q3Cz0tqYKpQz?=
 =?iso-8859-1?Q?ckyHOHnWBfEhFMz7f4abw/hhwDW79CGyforzDlVU+D7jQtXakoiuVzDYIH?=
 =?iso-8859-1?Q?4czUJthue4H7AjkBqHPmcaCv42TBFpt7Y7lk/JKL2DBRhoNb/iy9smnngy?=
 =?iso-8859-1?Q?KpdRQnxeXP8+6rDLPSnMFu1cDy6H0rSQCBDaSXGpMCgBbJ4VGEEHEc68U5?=
 =?iso-8859-1?Q?5AxFCULQ/EcuWYf/RUR3Ir7QNa7V3JsakYGebQiYcEXHzju2wfH3UrArDW?=
 =?iso-8859-1?Q?C7b/C/FGtE5M6joFzmwTJFgS26ARJZFfHGJ0wnPU3zeUcyzVVASsV860iz?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5672.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?+UzJV0dvrs+FSQ/dr90Jm5cFgPUFjXHaPxRzZ0nmnJiX1r2aYU5BEOBjLc?=
 =?iso-8859-1?Q?Ek7naiyYNfYNXQFqO0f0w8he6+Sme7KCa1V0FhDNqOpCwulpYO0WtW1miX?=
 =?iso-8859-1?Q?PerwMdUyLJUPCxeXJT8ENcEr6mlMr827V8nWhbXUTbg8j+dS3Eaot3m4uJ?=
 =?iso-8859-1?Q?ab1zjhh7e3QcYGPFOe28QZClcqaJ5dnSCEUn/BkhJMO0/1pYEcgK+O9w6Y?=
 =?iso-8859-1?Q?+1W3fjfsoZJ8V6IO+S0tcAL4ExzVpcnrPUGGkb4e1izZC3nN5YMj7f8VYG?=
 =?iso-8859-1?Q?TOujKLxTrxFit0M920hKzqPIfErBZWm1MjAf39vMDUEuqhoNuYYzuuoOXk?=
 =?iso-8859-1?Q?DRqRKPx6QSg3wjs91A5Oef/V76i5IFUh+9XO5ufytVhycg8QSlu7AAFyKf?=
 =?iso-8859-1?Q?GyO+S3qAsICbiWgerddzv/Jmd5dmTbkiWgmuTqZERQYE2PcwwSLY87qgta?=
 =?iso-8859-1?Q?inMD5l8jWdHq3gRK0bo6BvB0RFMZDtLTyajLoRU6Ifb5ZDql97LUqdLvII?=
 =?iso-8859-1?Q?4qPtuKarR0VCc9UvyyV1+GZfdO3v546ZSGTlUEYs+4fAf0QCQpUawHC05B?=
 =?iso-8859-1?Q?AFjyGv8Z1VyufUd3ynomAwQrtNWmKIYJPsFqvLaxIUJ5dXXApdeYF/nsoh?=
 =?iso-8859-1?Q?jHbfuNJPLoddZMifijT+6Tki/R9VDcb9hcXdRZa+kl0254Xdi15L0SEu3S?=
 =?iso-8859-1?Q?w3sc5S2zYv19luaDICNNEHLaOYaWf51kIxEHe8huKQ4c7N7lUlpjaUYyGj?=
 =?iso-8859-1?Q?Z8/V+wIZaY6wJqLiMRqq6AAsHhpxLGo9M92CHQySPWpStsEaKqsHsC0oNT?=
 =?iso-8859-1?Q?VP0EbLFyIHU1R/nPH79VIDGpu7++E6dqNWbpNSXPysMcwK32jqDaPORr62?=
 =?iso-8859-1?Q?VhsaAv6Hfw0YsmFs7I2RLyENQB4FA8EOBAIwFkwrtxNfX3vAqA3m+9R4Qe?=
 =?iso-8859-1?Q?Kkh6atY7SDSXAufJbF/SzBp/ozuhfsKQiJIUZdhoOZ9rK0pkdyyqF5UMfK?=
 =?iso-8859-1?Q?SE8+1Iri8jMB93S9aQifeQc2kOqP6SaXQBl0Gknc3cdQs1A8JcKXy5mXnD?=
 =?iso-8859-1?Q?6oG6Gsuv8FxYL+e87AUYmpYRzmGxs7Wf95mV5aEzsrOdZaNtZ0jzB4+g4V?=
 =?iso-8859-1?Q?BJmgw+/WxGmUVF/Kld/s+JCuMTueuA+HK6yXvCkV0kO5WFaQDglFfBr2Xz?=
 =?iso-8859-1?Q?iSR5U2UNFTjsNv/bOb3xeYahTShYaPPeq/J26IDg2bcZaLMDb+bGZbx7vV?=
 =?iso-8859-1?Q?1z0apID+U4/J/9L4lTUuAdw1Nj/WqroPwyB19v3tnGFJisv6DDtQgUN1cC?=
 =?iso-8859-1?Q?snjth+Qywd/BOETqlZ4HKk0xJdPRx3gSn1OQSS4I/L0A4CdeZot5nU1sCJ?=
 =?iso-8859-1?Q?x5dmg/TdeUJqBBWbzlbayyzc0VWZxLtBk7gbLJULL+aj4oT350yPLzwvgf?=
 =?iso-8859-1?Q?yRSoG+sGbOzguGWUehFwWrn6s6CW++xZGgSlNG5Y2/gaXbPdIqbbxUT7vX?=
 =?iso-8859-1?Q?DjnwnY2reMUl6rJVVkC7Ig7XUy/1G6irk3+vKuMeqhshzH7/c/FcX6sF9l?=
 =?iso-8859-1?Q?cMFr5XtrRQYTmwUIOMniCX7gpyfJ/hbFHSsk0awn6PYJO8OhwCDKgv59E5?=
 =?iso-8859-1?Q?dCr61dhojYNZKkZkFoDZuInQFiMwslK5BoUCHxOKvz1dc5H2LWqKvPbw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3ooKxdEObMtKaZW+kL+5UWsEf9Ab6+//iUg8qPExyCBOeggVwbSe0UA0Ftt6lcpW/wnjNhSF2ppRGXs68j3fgLfKFYTFq2ufp0Vnz/q8CMg38O0vIzyvxywg8XuK18w6l+aV7vqGl4VaEfm2tWoDfhRmngDAnuwGWTKraWTjS0XPRfO9YJ60fW+JO/tmloYwnDl6ZBzJmzrt2vmu4POBFPf39BFu6jNjlUAd4hnmhjf9K7Ee3NFr0dLM/UaCeDwmaFjtKOTLBICOBX82SMMNxCrYUqbPDbVzqqaBZJcOsSKLrZZaqBrpTbpAU5Z3c0X08Q/KbhiNTl8PwFAHGGeiD+6TZrRST/RyljXWdSZ5+mOF2cjaPYVJ7LzwEmrLuAQKF2WheUgf879pOid/cd8Dde8C6xM5uyKdw4NIL5SLrwaqxDdPC2V3UD/XcqJOdF4PmAPUMMRQpf5UK2OyeQADUbuFBcQ5mbOuBCElLitoL3hGjeRodp7LrlqNTFOh7SwqdMsJwDobta59XA1K8MCPyQRzkW7VAahgHNUOJRrJItW/X+icXZchmcHeW5vK1SMZZ0sWAMn2TsXuRP66L57UTKTxEGSxvjvLZGAmJZm5sFI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a991caa2-cb68-4b30-60ac-08ddba820e51
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5672.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:36:30.5887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uMC1oLfPPht4/+WlyJ6LcvMbTjSERH7yg75jWxq3WXUm8LsNdlXbqiPLAR6kd24VqyZjDPOJ16yTHat2zrtGjd5QlGbpe6yKIX12WnAE0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4849
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_06,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2507030186
X-Proofpoint-GUID: dDkr_rNkTW3VoJWJ_TZj_uQaco-jfO9q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE4NiBTYWx0ZWRfX+2LlS8Q2Pg6x lNuwnDuQD+TJWaJfHA2QN7/5vuB4AdYy4ebBT8pVwn9IP+dMry1Z6wwM+OzjCvRQ2Ea2ojkZGsZ Idfgn7+PJCpTglV83SAkMe7mUVhLJb/gyPKAAs14AoiM3qXzZ3hFRjftYmJPamE5ZYAWOAAQfJl
 fqiwIdwqW8l2BbpaFhnjWKQ6z4sA4aZz5e0iUVES55Uu9+WcswC8vVInKWck8nvT7fCFyqVFUdt dhQccWSTUD/glmwLGdf8Z9hoSut6qz2pKL/s9yUeSMflLALgpXnd8YATAhnAEPjjwa3chCkSF0t 7ZhXXxstTmlTAAY9icgkvVof182klgZFGvnGvUZwet3H2Ffmn0EdMdl/MYM55mIlfvMMN6ZFMnl
 KDwlu5aawhr+Qqz07JUCJKSxrrz7CNuEB1waXUMIwlk9mIed4PWPYKhwNhZK85RSs3lXYQ31
X-Authority-Analysis: v=2.4 cv=D6hHKuRj c=1 sm=1 tr=0 ts=686705f2 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=rf9tdN3BMZsFTHtBa6AA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
X-Proofpoint-ORIG-GUID: dDkr_rNkTW3VoJWJ_TZj_uQaco-jfO9q

On Thu, Jul 03, 2025 at 04:59:44PM -0400, Kris Van Hees wrote:
> On Thu, Jul 03, 2025 at 09:23:46PM +0100, Alan Maguire wrote:
> > On 03/07/2025 20:03, Kris Van Hees wrote:
> > > On Thu, Jul 03, 2025 at 07:41:41PM +0100, Alan Maguire wrote:
> > >> On 03/07/2025 19:26, Kris Van Hees wrote:
> > >>> On Thu, Jul 03, 2025 at 07:02:57PM +0100, Alan Maguire wrote:
> > >>>> On 03/07/2025 18:06, Eugene Loh wrote:
> > >>>>> On 7/3/25 12:59, Alan Maguire wrote:
> > >>>>>
> > >>>>>> On 03/07/2025 17:43, Eugene Loh wrote:
> > >>>>>>
> > >>>>>>> I tested and it looks good (modulo the OL8 UEK6 issue mentioned in the
> > >>>>>>> patch 3/4 feedback).
> > >>>>>>>
> > >>>>>> Sorry I couldn't find that issue; is this the 5.15 problem with the ip
> > >>>>>> send probes?
> > >>>>>
> > >>>>>     dtrace: failed to compile script /dev/stdin:
> > >>>>>     ".../build/dlibs/5.2/tcp.d", line 177: failed to resolve type of
> > >>>>> inet_ntoa arg#1 (ipaddr_t *):
> > >>>>>     Unknown type name
> > >>>>>
> > >>>>
> > >>>> Ah, sorry yep I have a fix for that one in the next round. Basically we
> > >>>> need to add it to the core set of typedefs and add a type for a pointer
> > >>>> to ipaddr_t; we can't rely on the #pragma to include net.d unfortunately.
> > >>>
> > >>> Why can't we rely on the pragma?  That is how e.g. the ip provider manages
> > >>> this I believe?
> > >>>
> > >>
> > >> Unfortunately the #pragma include doesn't do enough; it just defines a
> > >> type for ipaddr_t , not a type for a _pointer_ to an ipaddr_t , which is
> > >> what we need as a parameter to inet_ntoa(). I tried adding the ipaddr_t
> > >> typedef to net.d and doing the pointer lookup/addition but that doesn't
> > >> work either. Seems we need the core typedef + pointer addition or we hit
> > >> this failure.
> > > 
> > > Actually, if you move 'typedef __be32          ipaddr_t;' from ip.d to net.d,
> > > you should be set.  That is what I did in my priliminary tcp provider impl.
> > > I do believe that works.  Either way, we use inet_ntoa() in the ip.d
> > > translators and that works with that typedef in the file, so this really ought
> > > to work.
> 
> > Yep, I tried that in the v2 patch series; Eugene hit the undefined error
> > in one test and I now hit it consistently for all tcp/ip tests
> > unfortunately with "typedef __be32 ipaddr_t;" in net.d.
> > 
> > My assumption (probably wrong) is that the include of the library does
> > happen but nothing triggers the pointer type generation for "ipaddr *"
> > in the CTF dict. If there was a way to force that type generation at the
> > .d file level that would be great, not sure I see a way currently tho.
> 
> Well, like I said, it does work for ip.d so I don't see why this would be
> any different.  I'll have a look and see if I can figure something out.

Looking into this more, I think the problem is simply that you did not sync
all the dlibs for the various kernel versions with the updated ip.d, net.d, and
tcp.d files.  So, if the kernel on the OL8 instance you test on does not have
your change, it will fail.

Also, I do not understand why you removed the pragma
	#pragma D depends_on provider tcp	
from tcp.d.
