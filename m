Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B78B1A2C00
	for <dtrace@lists.linux.dev>; Thu,  1 Aug 2024 13:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722518578; cv=fail; b=twloeJmdwK+dhNcwJ4x7UuchOx9vh9CKXfbAmU9jyr8OZ9myLLmR4U/3sYlHMnfTi3nLHnxYfsJZNmcjiyKuhNLXgCIVu+zEIqiQbqfXjTnIo4/W7fPP10HYsE4GWsCKpnTtgkw+5U/lZ8flmZ3uj8kw+YFp/M8PfHP8yxlaZQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722518578; c=relaxed/simple;
	bh=2FAkyP86vYM9L2f0KIjV5ag+C2sFJHXhLFwlGoRUMJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ETHSXiNtQQ/K4Pc+xVZKFcb7+GXwsciG0Dc0sz7m4d5lSCE0NntwDNg5Pk4yb7DCcWEgdHylim9xkx5gcRilomgd2YHSMHNzJVhkkBgUiKZ97Y6T0CxXMAJYGR+eXGKvrwO7bEytH/9e4W16TSyC2QH/j6BhCDABpRLsg6zT76s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kaGu7cyj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=hxQhf1Mk; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kaGu7cyj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hxQhf1Mk"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4717u44n005092
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=gc82WihWABvRMKIrLeuzYsD/BHz9/lUu2M+P2zgO8ZQ=; b=
	kaGu7cyjt9Lg7CLHSflS9YxwMFBnMbdSVJwcUza67CSena2ktT0erTsz7M/iYAuf
	bPw03GY1520mfwXA2dv55FCGqjFaDLR/7ZM+qQ5zmkOMU01yICnWEErSDUBR9bEo
	aZa0flAf55ifa8h5ujiB0W1fyzEGd1YYttr2zPYsrXb3VIBA4cbOz3vT35iidDtX
	AS9JfMz2atmWQW6iGXhUwQQo+0YGtV1b9En62w65ERSEAnINrO0/HT6YatvfYGMx
	x9BN+vpCXPvFgPGLXdVZr0kh2xDhPrA8Arz4sj0BGG2wH8CY8k08nxIOS3abNX5l
	kmK5FW8R4kSDbc+CCwIf0w==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 40mrgs9rfp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 471COR9i006006
	for <dtrace@lists.linux.dev>; Thu, 1 Aug 2024 13:22:55 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 40p4c2v61a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Thu, 01 Aug 2024 13:22:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuZIk5brQKW8KiN6MnJF190Ra/FQCA9p7CvHf9f8tsjhgpW6mTAzpTxjXpxP0a1RxZAWDEjnmhG7i5ALsWlazxl8ewCoKuKjnoYUTpawU3aUfW9jZcGVCJgv996QXrxIyrvNPHygf+unRrxI5WJrcVbYB5IaQY+QCzR/9S1SavkFLzy+Ycgty1iwE9SJFOknLxyv5lzS34BrCreGG0Eb1ZWOW97jFNT4iH53XdO/hayy3eU5P55dw4zXxl+eyK8895gT1sG2Q0B7jkQBFjUnbY4q0jFmvUtGKYVJOuLHMngIb5Z/Z75Ox1hqQI33swOJ3HXKrgkcsetrZQdy/vI/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc82WihWABvRMKIrLeuzYsD/BHz9/lUu2M+P2zgO8ZQ=;
 b=U2ElYSFOprHFhSyFQJN18r3kDCWXKwPDCG6eAom8LK/PGHXFuyHCWtulWYYVAHWJzLOoSAL2LfIahrKthyTshBi8AM2gffi3CtVamRzih9/9BWqCF8FaTExysa94tKS0g/LxcZtfipB60YGC1Fi+ih+/H93qdRImLgjw/iONCo9lMjKZB1pizCCMx9Ou+zOfSqBxifW5tGZyXCviOgzJDoDBYdMFs0LzScQ8CvJSCJlSJRtklVDjUbpSasabeeoezCmpQsB3WiccmoTEYie1X8Ta/O1Gshl5PDYj6F+N51iAsdy20/pAsnOlPURmA6XclJ2s1UY+2tC+slUsfKXz5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc82WihWABvRMKIrLeuzYsD/BHz9/lUu2M+P2zgO8ZQ=;
 b=hxQhf1Mk1xkRheKWEd9C3egRfVS+HHwDI+2YJalHSl5yHLTgXvOSD30D1TcDnbQEO2qof9eoBdiLwX8UhjPzlN4m/ifP3LCxgnsKA+Zayq1lP2MLs/XYeOUq0PpBW1Y4R2fPFM9Lif3QpdKFB+Az5DHFh/pw6eqFAl5cdjPw0QQ=
Received: from SN7PR10MB6595.namprd10.prod.outlook.com (2603:10b6:806:2ab::18)
 by BLAPR10MB4881.namprd10.prod.outlook.com (2603:10b6:208:327::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 13:22:52 +0000
Received: from SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf]) by SN7PR10MB6595.namprd10.prod.outlook.com
 ([fe80::4384:e7a8:8394:dfbf%4]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 13:22:52 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Cc: kris.van.hees@oracle.com
Subject: [PATCH v2 6/9] build: add a pkg-config file for dtrace consumers: use it
Date: Thu,  1 Aug 2024 14:21:53 +0100
Message-ID: <20240801132156.286780-7-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.46.0.277.ge12b8151ed
In-Reply-To: <20240801132156.286780-1-nick.alcock@oracle.com>
References: <20240801132156.286780-1-nick.alcock@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::17) To PH7PR10MB6601.namprd10.prod.outlook.com
 (2603:10b6:510:205::20)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6595:EE_|BLAPR10MB4881:EE_
X-MS-Office365-Filtering-Correlation-Id: 279047da-486b-48cf-a3b9-08dcb22d0b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0lYWPdy/PwRDVBHUvlUMwPs2R993GVbz/O/v1dIe21rzENTc2ND0Gt1Cbxe7?=
 =?us-ascii?Q?6ohBW2ulYXW1x3AF0sKQl7yojvCtSVz0reX24QwpZOezNfUIxMpmz5MnymN7?=
 =?us-ascii?Q?+GF4WTNpMv+p1sHQR3m3rHQWlvkrPFTNsIZaGmmvTR8Pe/J6wb3nMfnHNC7y?=
 =?us-ascii?Q?18gYzMtRQSaFc2IegFnctMqer0iP/tPUQfxgjbElnw/mzTj2g1DIVlFctwMD?=
 =?us-ascii?Q?2LvFBW6BltGFAVIpfBNgoRY9DsHdqNH5SvYsZm4VQSz8Ygt5RuWZ5DGkkYuX?=
 =?us-ascii?Q?DO7/T481Wh38rupbyB9XHb/NER6RgSciXsHhAX89STK29yKHcmZoPhrVHL/p?=
 =?us-ascii?Q?8kUDwNHvuRrGnm4cV9T+pU5Wez4uIeqwdrFeTHH+6Jiy97PDPk/05EViOUIR?=
 =?us-ascii?Q?hVT0k6oCp7z1h7vm55uqqZob/r50MYajzBJL5kZNQ4GTR75dXUbCfgPheWZB?=
 =?us-ascii?Q?M5qfnLHBsNnmkYFvTZ867mxtEv6RqebZ4z48dO6dNI6/aMqCT7NMGDUvW/d6?=
 =?us-ascii?Q?uL1XYyYiSO8eUFn1YlH4yo8RIIJyOViN3BmWg/iy3wcoycnc1w/BZ4zVEAyV?=
 =?us-ascii?Q?FwNRXRlZpHr9ALnouvGB7t948qWt4oVqXSFVpPb+ZVkFQXyCsKkp4av2WoPZ?=
 =?us-ascii?Q?Ut2C5MsRbZGEqBfg6cwR+0GfZKaogLUsSI6gnmXjf4mte1LJ/VxmTRijLjPt?=
 =?us-ascii?Q?u4qQNLpijAHIiB7NgGvxD7QjIQFq3VqXU50mdsvrSOUAG+J7eCdldtCJt3NF?=
 =?us-ascii?Q?NKZ+GOmVYziMcN6Nph//ak51p3LQVcNmzz8ocEcb1YI4mBrRTyBB4vb5ChwS?=
 =?us-ascii?Q?Q5QdQdPxiC3DWSZXSyqkgbrj98Y4WiBoUrufB47eHEaajVfQOsIMYZZSK4k+?=
 =?us-ascii?Q?jMRGI5hfXe1PTjQYM6PkoTU/Mk+Fqldud2o5cCwLtUYGB3t6Iw1jsOZICVII?=
 =?us-ascii?Q?Pz9TOYKDrzk2Q3jXtO014a2iTaHNQsfTlcYD+BwyJlL38+JRVXjADwE0uiT0?=
 =?us-ascii?Q?ioNN6XYPON7uqM7FyENUxMyxnaJ3YdSVw6PdIjA+Nma7rgvGY+uQffHovjmi?=
 =?us-ascii?Q?tEdQJ3IEpLK70OPbJWwLfJC5o7cs/nOFrKg8GIRgoeYfvZ7j74W8MzUokqeg?=
 =?us-ascii?Q?rmXmgCE442O8juf1ibXC3FeH/JzVe4H29UqHeuHqUjOtCPE4FL6ffXeqFqqQ?=
 =?us-ascii?Q?KLhJc6vbPhjHIHX8rwSg6hl6TXnWpxxY1SjGfgTgCtWxFjHQlBxgbsyaQEWZ?=
 =?us-ascii?Q?zGNkXkF3VPt7Jh5tubZVxT6Epx/bxOUIPzWUIxd60W0qbGfluQVSt/Yegzjv?=
 =?us-ascii?Q?uVmn1TFxaWGqQUFWu1g7mXGWDZ6nVf4GwRJTBxuqtX1K1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6595.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d6E0qZD3Xxsuz7N6vk9qsYSiF4ye/IJupLUQUoL5jgG8xNdGxP+XD+BoQiMD?=
 =?us-ascii?Q?E3lc/xoxdS4Upx4DjCg18kgvxDqazCflsbLjKI8woILsoVhYS72tXB0c4z/K?=
 =?us-ascii?Q?UZey/JU9E61UNalywh9IQY8+bGIzAsZyPRMFjzRt08tKoUPgtpxyQJIBnRL8?=
 =?us-ascii?Q?tCIcG1XuQG7ba+nlCi25Y/Mq6pa1evi5Iy/bIYn3iiTOS7WbaN3yZeT5Uw5/?=
 =?us-ascii?Q?45HjSx37fYgU7y50FRxhXI2zKKCkwm2mKxxHtTCjtdgvRKxTAXvJWisICfWY?=
 =?us-ascii?Q?0MIBQyCr7+ulc6uX+Iaf4wlPQzozDhXex48nh5KNH1RZRvPj4yw7Z0S7a+NA?=
 =?us-ascii?Q?aE41Zyzdt+Ofvly0FDYdNx0HNpQzfAS1fPQSNHf8SUlZegsulw8/iCuGasDF?=
 =?us-ascii?Q?UqkmZIFo3GWtAQE0TrVT3IuAAdMCWjOQyX9TPkeDewneLPRAXFUQUzwx/BRR?=
 =?us-ascii?Q?kLWcl0vK3czdC8fhfwuE6KIu3CYvH8iUT/0cU7jH9byQdap3pYWzHbV2FvQd?=
 =?us-ascii?Q?6YcD2Nmc7Cv7bv9k1oe7Iai5cSwiB0JRRr46oeBrD5KORl9ft7D5m+6sR8Cr?=
 =?us-ascii?Q?+Tbvr/9KogdEQp9WjWX05aMrXoAsHX1TOdmUhkT6lE0qgS+wOeMTn2q1nm0s?=
 =?us-ascii?Q?MTwpVACAre9Jww7vgGn8YKoPXkkHHqI6kxc7qmz0TnVe7hlgwnSxB/j0gglb?=
 =?us-ascii?Q?IrGHev6tugkyjApveUoREAR6u7MEk/h/xureksKQOBQeUnWjT+5NNAczeTnK?=
 =?us-ascii?Q?MvJAp081iwNLVrN8nZbXCFFeTmTDmoZ3BQ0ONpO1+h+x8GXrzn3p6FtVb2Sd?=
 =?us-ascii?Q?nteQbdUrDRkB3KO42Qu6ngDOLDnty8FJaPIfrWWNa3KTOPbdvl83KmYp15EK?=
 =?us-ascii?Q?FZtPitppTnalzuABWK/9N1EUIPkHB+GJ/m/LhNWxIDjjQBeef5C0rUebzqi8?=
 =?us-ascii?Q?CS0AJmevXGJQXYcU9iHpjKv2krxzXe81sLRz3C24gFes+OcxF/o521B3bhYE?=
 =?us-ascii?Q?iWuPseIH2w+ZmQC7PP5UvgWOgvc5qOVqQw7Qw5d2iONOKaHFvl3jzCoad5h+?=
 =?us-ascii?Q?mfHQY/0SB8faKbMjGYR7v+l8S3NHSjBAhRCggrkT9oDmgocB5eLvAgQq+6Nt?=
 =?us-ascii?Q?0JNCc/E5r98CGDZG12PWfjD26gPop1TDn+9iHs4zp9cUrrngo8yKE+mopN0l?=
 =?us-ascii?Q?RSajSUUmFBNb9xv1bt0UFTTTzgVvZiyhvsNGEhTfrnOCLyG3pXBtby3tgZyX?=
 =?us-ascii?Q?6LN/tlM0FOtvaSGtdDSKsmvgLdpXQ1TzFsyDu1R9JX5Bs5SAOinYVpc6txX4?=
 =?us-ascii?Q?6DbRkzQlrBUaKS9Idf8X7uOEPJSWI3PNqjPJSydX2p8NMv4/7coXjN+ipgRJ?=
 =?us-ascii?Q?olW2+LGqdV/deTRf2ISY76HGRuyVxIMppKeU0WPzsWztXeiNB0Q4HoBBQgbr?=
 =?us-ascii?Q?GG6B0XOJ/Er+8fOh5qKiEsRGV0OpzS8uHff8qjO5ojA8m+3sbPgT/JWE6eUn?=
 =?us-ascii?Q?zA+WtgTsPiAHamCqfCGLxgURF4DC/bcNvqnCdqiRrEVWAezK6eH0Y3ta2tkE?=
 =?us-ascii?Q?H/7gAn2pCUesnEzFIgEmyLgNBkbOyGUN7af2btF5DbCP/ByGRkP2+55doWtF?=
 =?us-ascii?Q?Dw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	eIAUcvDu0vZZtX3gn1gWIPz70eDQwXdjzQlHKHQSTSYEzqDXtg58zCjpxsGcWo5FxGRXdyMKAeRyMiwCgcDR0hs2Er+8wjy3n+zyHiMgVnQUADXmyCsseC+OsinLr9YpFlao2V2a0w+x6IKlSmrSk/CRPsOwy106PwYgU43d4qwrW3+B0tfAwKbj1xeQdHS5lAsQs2lTE1D+SnPfhQ7iOWIALQ28i0drFPK6E49SCAb0pzPlibMLo07HMB0Oz0OOiS0exKomg6qLiRslBqbjs4DtxuOwwFcCUe87d1ROEhtu72AKE+h6NufeSiYmWd+lSW5kMM6q6SNcZ7SEtS9Y8H59ryexfkgrCphJbnMaoiaataFWT52xjdJDzt4NxqEpfNHWGFqz4RTfjStPC4RIesoyycFjjeXyom9+TkFOLNE3POUcReDfx1lB9GJwnvkLzKdVWHnDVa2jLb710UI/Wz9xlzgPYL3OfkdPrr+CXGJt7wulbZs6+lnAkmVDCsgh67EtZVjlwPrU/T6e7fIvDAPcT+s2WPCdaL3MQfT4RWjvQLZLTfBe4fANB3iD+G7fg+ncLq4DgKlSXsGYxBhFbYgtjmfGVtoQYJ0ayCa36/c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279047da-486b-48cf-a3b9-08dcb22d0b8c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR10MB6601.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 13:22:52.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: We/uC691c1X7QJQ3bnPLWMYwxMspt7WmPFkXMKJcZzfvqgxPQk9IFr3CBht1CC8kFeF5yz1EsV9QQuH2IyDHyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_10,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2407110000
 definitions=main-2408010086
X-Proofpoint-GUID: pC7sKRsfMvPALYpFx-KzwPf5ZTIBQQnx
X-Proofpoint-ORIG-GUID: pC7sKRsfMvPALYpFx-KzwPf5ZTIBQQnx

This lets you relocate the include path anywhere you like: users of
<dtrace.h> et al should invoke $(pkg-config --cflags dtrace) and
$(pkg-config --libs dtrace) to get the dtrace consumer header directory and
-ldtrace invocation for linking.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 runtest.sh       |  2 +-
 uts/Build        | 10 ++++++----
 uts/dtrace.pc.in |  8 ++++++++
 3 files changed, 15 insertions(+), 5 deletions(-)
 create mode 100644 uts/dtrace.pc.in

diff --git a/runtest.sh b/runtest.sh
index cc9703e12c16..817f4a90487d 100755
--- a/runtest.sh
+++ b/runtest.sh
@@ -579,7 +579,7 @@ else
     dtrace="/usr/sbin/dtrace"
     test_libdir="installed"
     test_ldflags=""
-    test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt)"
+    test_cppflags="-DARCH_$arch $(pkg-config --cflags dtrace_sdt) $(pkg-config --cflags dtrace)"
 
     if [[ ! -x $dtrace ]]; then
         echo "$dtrace not available." >&2
diff --git a/uts/Build b/uts/Build
index feafa21369f2..7948e9f2d084 100644
--- a/uts/Build
+++ b/uts/Build
@@ -22,7 +22,7 @@ PROBE_HEADERS_INSTALL := common/sys/sdt.h \
 
 # The pkg-config files undergo a few translations with sed before installation.
 
-SHARE_PKG_CONFIG_INSTALL := dtrace_sdt.pc
+SHARE_PKG_CONFIG_INSTALL := dtrace.pc dtrace_sdt.pc
 
 install::
 	mkdir -p $(INSTINCLUDEDIR)/sys
@@ -34,7 +34,9 @@ install::
 	mkdir -p $(INSTPKGCONFIGDIR)
 	$(call describe-install-target,$(INSTPKGCONFIGDIR),$(SHARE_PKG_CONFIG_INSTALL))
 	for name in $(SHARE_PKG_CONFIG_INSTALL); do \
-		cd $(uts_DIR) && \
-		    sed 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g; s,@VERSION@,$(VERSION),g' < \
-			$${name}.in > $(INSTPKGCONFIGDIR)/$$name; \
+		(cd $(uts_DIR) && \
+		    sed -e 's,@SDTINCLUDEDIR@,$(SDTINCLUDEDIR),g;' \
+			-e 's,@INCLUDEDIR@,$(INCLUDEDIR),g;' \
+			-e 's,@VERSION@,$(VERSION),g' < \
+			$${name}.in > $(INSTPKGCONFIGDIR)/$$name;) \
 	done
diff --git a/uts/dtrace.pc.in b/uts/dtrace.pc.in
new file mode 100644
index 000000000000..58aa46fc75c9
--- /dev/null
+++ b/uts/dtrace.pc.in
@@ -0,0 +1,8 @@
+includedir = @INCLUDEDIR@
+libdir = @LIBDIR@
+
+Name: DTrace
+Description: DTrace consumer headers
+Version: @VERSION@
+Cflags: -I${includedir}
+Libs: -L${libdir} -ldtrace
-- 
2.46.0.277.ge12b8151ed

