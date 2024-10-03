Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4697178B60
	for <dtrace@lists.linux.dev>; Thu,  3 Oct 2024 18:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727980070; cv=fail; b=mG/PzY26DejxnJoY8vjLjFZa8tGprEEHODObqqmN34dGwXHnpYC1TY6gYJa6jcbcYgwc4qAxpebeXRqqet0w/EBVgkVMBBneCHbETeNKUKzRQ9ac6DNv6TgPt+YwM2FCkhkUUwl5VLVczBAa1dgR+o/VwJ/Nhpw3TgBBzKkzYts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727980070; c=relaxed/simple;
	bh=9dEFg3FRey1hgOr3vF07mymWUS6g+XmZa19ovfVjn4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=b/4LNY1e9BX0lvqv4nDnLL5n+WEog9mZlJI9soyC3OrdELg/jseX8wvszXyca1xHbqi/dEt3/+Y6ZQhJ3xts/+JvSDx8hzQWKwqgTOlRmSruWELPFYYKYFWAODt3sr3opWVqe+5OBpmL5J4pZ3J+pOeKhVniQddRJnJRBMkiqus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=H0gpwu8I; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=RjiQk9CN; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="H0gpwu8I";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RjiQk9CN"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493Hvde2004065;
	Thu, 3 Oct 2024 18:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=AVIXa7nRj+aTRPY
	WcKTEOqlSmrQ4T6sC/TB0XBM/rOg=; b=H0gpwu8IHpxsLhLAjhSCQgyGv0KBxOj
	z0oagVgHtDIFdm/efKm3AChd/aMsW/KOrv1HgesUyaLHIQLwIfmjIpIMyf+YDMPt
	D885jUKzuu844KRgHUiwn/UekvBFSAMN9mgwJkmDZYQ8dhtMfNy9+k/uMdZ/i9dH
	LmVfC4Hc1ETM3wBibW7PL1PiSc/K0Cwnpa4bNyJJqrf/6PczWJEgkMviFoB0eW0W
	36G5+/xCoEnSzap3EUcuUDNKbexo3xCc8oqC+5grPVUa4E6ERegv5mqOOfqxThHZ
	bAmqaHosx/EXlZMZhcbnWU+sAPXVOPlmNbgY4dknVdYYLN84WURkYnQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42204gr1y0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Oct 2024 18:27:41 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 493Hx0U4013371;
	Thu, 3 Oct 2024 18:27:39 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 422056h4kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Oct 2024 18:27:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CELcPHPbNtoy0xezZAxJqylrrRqeuNTbUQbxlZYgDuc5N1Bn9WVTO/Oyyv71BCAi9xtIp0Aqac9JMiZ4D/GQGAMoLcDTF89GgpFPitRALgf+2boD4TWiAa8YCjFCHhdWWNg1WA88/j0d+nOiow6iJnko0fC7gk0dxUxTRCgXNB3a8k4b5oCTpoeRXEr1bgfegNp7DrxmB053SDHdNtdxF51lhZyndX7r7KOSQ+X7qWYLL2HpLt0h/Yd5jHKlZZzKJn7mS02z06EYoveC2yyD6jOnLvilvEfknHa202vcqZcVebv/Kiyv9IKp38BYO6yiZNEevWN4+BllkIK/LekeJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVIXa7nRj+aTRPYWcKTEOqlSmrQ4T6sC/TB0XBM/rOg=;
 b=cEehSOAzZEbJuNxnyuN97686WHbH9FgU1S4EBBrXM+Koqz9/B20vdrofdUiysu1VEbyEPhuigkiSvXy2kyp+5z+TBkCxqHDo/FzbZodD3toBeXLlAYtbSemqMrOgUNB5QZzSXTQnPzvZypgnFz3j1lMCgR8SMq3wAPJQ3g/OEf+ewUEG+qHArNXB4WP9Qpr/s3JRajd6TnLhHaHK3cFxKH6/uIpl0rHyeWsvchKHQLCSmkbPMt7KwwCinFWUyvf40qKmqbjxO7WmkRwkOzOY2eOb8OhnMpTIWokvYcsdz8fVjzDwZySN+NoHtfsN8fFSuxav9nTkC9tv1FXaKOdfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AVIXa7nRj+aTRPYWcKTEOqlSmrQ4T6sC/TB0XBM/rOg=;
 b=RjiQk9CNp7mdYg17mjkxP/3FIQBkgn2b4I2qm7NF6rF4Jmc0adw+EBq/vbAa0fwzRdWGcndbhHnOfh8uzWXnd9xDKnyt3dHoI1H52ehJBFVc5Ugd0uvW8AdTWtGTbr8Xak+SMGgLbEawgk9kFIaNm+0iT5fKqdSGFtrJayK+5e8=
Received: from SN7PR10MB6287.namprd10.prod.outlook.com (2603:10b6:806:26d::14)
 by DM6PR10MB4155.namprd10.prod.outlook.com (2603:10b6:5:214::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 18:27:37 +0000
Received: from SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29]) by SN7PR10MB6287.namprd10.prod.outlook.com
 ([fe80::5a47:2d75:eef9:1d29%6]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 18:27:37 +0000
Date: Thu, 3 Oct 2024 14:27:35 -0400
From: Kris Van Hees <kris.van.hees@oracle.com>
To: Sam James <sam@gentoo.org>
Cc: dtrace@lists.linux.dev
Subject: Re: [PATCH] cmd: drop legacy DTrace references
Message-ID: <Zv7iF6uNrsrIv5xe@oracle.com>
References: <66555d41665c9ed4e1cae5428739316ad8a2cb03.1724985747.git.sam@gentoo.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66555d41665c9ed4e1cae5428739316ad8a2cb03.1724985747.git.sam@gentoo.org>
X-ClientProxiedBy: BL1PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::16) To SN7PR10MB6287.namprd10.prod.outlook.com
 (2603:10b6:806:26d::14)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR10MB6287:EE_|DM6PR10MB4155:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7bd0be-3e53-429e-0c20-08dce3d90eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mXSrtjKZlhdduvLXu0Frdwlb25ZrhyVAwIIVcUCU+9eyiptKUZ1ZYNFVoBLL?=
 =?us-ascii?Q?DoHwEelruwlgkgIqhIJ2ZCbqk0V/RyTrdg2JpjZi1x1nbO6eOTN3884uRPV5?=
 =?us-ascii?Q?DlcQ2p3tGzxp6QwZis7s2+L64sv6RVBvcXBBMFxRX6yUke03wMRvEnXnuKCj?=
 =?us-ascii?Q?xvZspZFiwjZr77V9TsZC7tMRirV9rsUc53Adj1GAvF7ro3bT/hpplnWChm7N?=
 =?us-ascii?Q?8SAFI8Mh8av6sQJjR/v5sLahhkXVnqXrQVRsV/bDaQkkcLd8VetDEd9/0V9m?=
 =?us-ascii?Q?CK7KORhqsVRfexl3JjkC93dYYutbnctzHDDMhvi5yOzsf1f8+P92AwrF8oSZ?=
 =?us-ascii?Q?7+lEOrZ4OLCt38ryavPYoAc1cDl7nnyUssA/VJrX+2xwnRCqUkCkH2SfKIOy?=
 =?us-ascii?Q?dXZGKS7RY0m3tF6JfVZZ83+quWyYJPCZUhjAufsuyJ3taNgM6OvBQW+zwuuD?=
 =?us-ascii?Q?owl3/ZUuZCVScI91Qs+okTZtpCuG8wUvjdLdOIT9jNcFHeHvdVrehFWIROTG?=
 =?us-ascii?Q?St2U3YcHNVKpWchza7VEESaJ2A0izaZuF7Qaqo8OZ3y64W6jP4fsEv1D1cBx?=
 =?us-ascii?Q?Nr33JATHTk4GZfPlFdFTOAQ2oJkrvO0M60DmK0+5tBbShygK34k+mZCR1a5p?=
 =?us-ascii?Q?lN3GnCWdnAXDD/R9DO/GsCQ0NYyeuxNKHfYtShayJOgtfv8BzOcRcjxmtcMQ?=
 =?us-ascii?Q?5/Dzsb09fC+8qtAbRF52KtF7YIVSxV3pllD63zqLSBlcF0u8n7ClD8TPorlr?=
 =?us-ascii?Q?W0iFhO5mzoZafGEeAeB0b5Co7xxzQ05zc46P1Z97EROYsYyb3CcWRY9E9fT3?=
 =?us-ascii?Q?CTY9pXSq8HyhVCfI42rU+TCszHLe+mTE036ODvl6+pg1g4eM5Wq7DXQ8Ql5d?=
 =?us-ascii?Q?njZ7FJLf51i/7WU2mVbZBE42YY3PhwYGxQQsNNG8TFtJrQGnpl0cemss0/ld?=
 =?us-ascii?Q?388gOTQpcnY6tgKvKX7jbNCQ5GUjaW9Mdpvrs2XBmCZ98SQVYMSeYHf+kjlW?=
 =?us-ascii?Q?M2ZhWKQ9hkYyBru+y4SSuU1LNIzmspjSTeNNZv5ouBzLbwgDdnP4brC85FnH?=
 =?us-ascii?Q?ggTW1w25cdwI3c2/MTagK+czP6HexqlXe+QZt366Y8woAxarjSA2in42CKFq?=
 =?us-ascii?Q?LkE2CU6omuAmTpr5tSbP7zo3UWMLokpRnZ1gLzoCi4Cv+7oX3KRy8SVdX30Z?=
 =?us-ascii?Q?wzZSE2gnSbu1D69Aux7C7oB8D/tO908tYWNbbR7tLlkgxOpIr9b+XdgtexSs?=
 =?us-ascii?Q?sR1sY4XoaOV1JjpTtkAxIOzT0Td/R5iNH3N5qSez4w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR10MB6287.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C+n+8Vergp6jkymkMF0Fhq5XCxKVljl0vyZZmpLPxR5Hp0SlTX3ikvrpw8v7?=
 =?us-ascii?Q?HllYd/yuTSJPIwR8wqyNe1dY+nJ/vrYsAAmcFdNjttVZBJSSsYSmwEy+QGcC?=
 =?us-ascii?Q?0Ic7VoNi0ivfYFl8GidFoIojsyKB9jO+BYaMG3HD1FHY9A59RYi72RU1MkWS?=
 =?us-ascii?Q?pIJjRzU2MKLexcojRWhK9NPzrBCYWwjXdBoveo/FeOnSEuGbljncCfcyQ3rR?=
 =?us-ascii?Q?3ftKus69CLdNq9P6x3AHh4TNmEk7VRBoSQUm3Tso9amvxs+8qaRBs9xth/un?=
 =?us-ascii?Q?uM7Aw7v8ne+91+L+GJPe7xAe2i4hAUUeeFEgir24aqkQvumyYc1wmoH/l/Wt?=
 =?us-ascii?Q?/+q0a0e+IN6F4cxLTeDisW82rjKxi6Km1JhG2OOmKN2b9g7NsHgQFscP7s25?=
 =?us-ascii?Q?syk1YFXxP4ryAdk1WMMd9HdY27JtuE6OfdvRuQ5yws7L0wD7x1GzUMdAgcin?=
 =?us-ascii?Q?3SHzvyIgMtKTmYS05kN0wrQgF0c1c8JFwx6NFu3MKPUzP9K0czQG9qWWV0ri?=
 =?us-ascii?Q?YBnKkk5mLcvX5wajX4GmFEeFIciVMek8u8NshRDRcDoLJZ/kMopItJNO4vaO?=
 =?us-ascii?Q?3C+zPG0AhgJIaXvI4YmdAV+dpHHh31nFwRs9H3JDFQ95S4VDswVXHaJWEd1r?=
 =?us-ascii?Q?yVBJlxiz+rldY6RFaqkuy3ILOhWk1ohzKL9SQLghLwkfH+/A1zk7KyDQhIlm?=
 =?us-ascii?Q?dkoJYZ0qfxLdo0vIkqEZnP7k7K8Aqb9VvDgpC5z77MRVZVVS7iE2GqEuC7Ti?=
 =?us-ascii?Q?Bfmc82+PJYQkfUX5Q2aad4CQDByuAs8RMNeOKezKQ+AvW2gpmBskIsaMxxtZ?=
 =?us-ascii?Q?cWA6bSehbz/cuAs0On0qAt0JmBJ+2uLTNqWY1n+1/IBi80GbZqkcy2JGyEVZ?=
 =?us-ascii?Q?bjE7UhQN/kt1Xanr/lSM+nSgNf7uMtpcJ/BU+UfpFi0aKLNagMVpZ2I7vU0g?=
 =?us-ascii?Q?+CNhe3IffAFxRLm58hwCsMzBmd65AB1skHHSdfshmMkN0B4bL99ZmPWGMhAs?=
 =?us-ascii?Q?3YqW8MICU3js28X+h9hF2ws6KPuCaQICvLUIkqn/W/pDeasbPB6UAGJm1Ulp?=
 =?us-ascii?Q?N2RYd+K0q0vojodryeR69thckAkmJdVlfx7I/hWidrNt6ih0l6/w6VQUxwoe?=
 =?us-ascii?Q?kICo2lSa0Lv8OeQRnFuKoE79I6+/0iyKhwoZdPKsfggPyRc7yyBju9Ol+Jbg?=
 =?us-ascii?Q?eJ3hHSYW81Ewx4YOWlMknSglZ91LDJg50pcGWtiDtdb+in5vrGa0bsYzvHyw?=
 =?us-ascii?Q?0sRcyljli8ZKuIXCE3+zCXZS2upyqxPOJtUcSUt6xrg1q8bkRme86JPgo9GH?=
 =?us-ascii?Q?qUpHq17OB4c89kTBLfDVlxuUzRpgzUg9fXmAlZugg4+oXxhyIWbmvTEkIuzc?=
 =?us-ascii?Q?QKrthH0DRAOMwFU8b0s/ARQgbc2IDP4qu07Ovji/xv5MPX3jIiOdnhltFpV3?=
 =?us-ascii?Q?JlnL0uoNC1MGxWsH/tWKdegG2H280/wJH6Ms2XwnZg4hk2Pg1E1j8zAR22oT?=
 =?us-ascii?Q?GKvyKVFoRpDYx0xDfdgxTXd8V0+ZLhjiNmG2Zf9cBo/KGvKY3TCDExB1QPz+?=
 =?us-ascii?Q?eIauDC73fip1px6oYB0NGu7ocp/kTLU9n38HwPW/u4jJes1id1EVWWrXfnle?=
 =?us-ascii?Q?3w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9VYqbOIRMaBXUcDAkBLaFf9/6JfT293oxpYcq32xJmFFjIayYJCsi21LD+wgRLUS+UVQhTWSojTB3BHL56IZXWByuQt6bhueCo8oOJEqbu5cpNTMjfWYnKvMZcHVOCHE6tQYEP7u5WGRdnNvX6RtbS7GHdtna1Z2m0X9YyyyCitdYbXLO6Lg6TTguXT3JHAdz/vFYokPfMPnrWpK1xuZUCgtmxTFavoSy4bJ9TEzzaWnJQuYPxZ7+ukk7TruxvhzhZDrea6I71NIIVSQsuDUeiI/2qZ9fqtWVy6XxgY/fZOA3BrUmoRoOa7E6oGSRXv4ymOsFWVI6S5b1m20CzFFzwPJzsutLKVnq1nOIKYexIzIYOyHmxkOYAZBon9GQptD1L5KeEB9naA8zEAiehpzWHnEvOwNZf6YKIMd72eW6YA+VGI88wVSm1r8kolOOEh3AlESP2ZDoKcQhBwSUr4ciR3aGUPODgb68q7ctKmw1o8N6wBXdpNuZoMyXqC9zKT6xm8hycMXlIIxSlus5mmXa45kKWLSH0kdz3JIPByyiEtp2AHa96sM1P519A7MmNSzY404SLNLCM/oo31vuE1V2cdbDqahLjOT6TXOHMho4Tc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7bd0be-3e53-429e-0c20-08dce3d90eac
X-MS-Exchange-CrossTenant-AuthSource: SN7PR10MB6287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 18:27:37.4531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kc0sHv7Yov8R+IJkZEM5GcfY/gLqzFWOlRevn5+lAI27T3IW2UQiJN9DYHSOioP8md7RIDz5Mfl0v728EH2eD1C6XHqBqbW74elsyDAcOM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4155
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-03_16,2024-10-03_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410030131
X-Proofpoint-GUID: gnPMOuAIaK2KkzgHoalL53Wbm4YwqnB5
X-Proofpoint-ORIG-GUID: gnPMOuAIaK2KkzgHoalL53Wbm4YwqnB5

On Fri, Aug 30, 2024 at 03:42:27AM +0100, Sam James wrote:
> We don't have a kernel module anymore.
> 
> Signed-off-by: Sam James <sam@gentoo.org>

Reviewed-by: Kris Van Hees <kris.van.hees@oracle.com>

> ---
>  cmd/dtrace.8 | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/cmd/dtrace.8 b/cmd/dtrace.8
> index 44382e1e..d82ed209 100644
> --- a/cmd/dtrace.8
> +++ b/cmd/dtrace.8
> @@ -181,15 +181,6 @@ Print CTF type library debugging output on standard error.
>  Set a given DTrace option.
>  
>  Options set this way are overridden both by options specified via \fB-x\fR on the command line, and by \fBsetopt\fR statements.
> -.IP DTRACE_MODULES_CONF
> -The location of the file containing names of kernel modules to load (see below).
> -If unset, \fB/etc/dtrace-modules\fR.
> -
> -.SH "FILES"
> -.LP
> -The following files are consulted:
> -.IP /etc/dtrace-modules
> -A list of kernel module names, one per line, which are loaded in addition to \fBdtrace.ko\fR if the \fBdtrace\fR device is not found.  (Failure to load these modules is not an error.)
>  
>  .SH SEE ALSO
>  .BR cpp (1),
> -- 
> 2.46.0
> 
