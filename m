Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDAB299927
	for <dtrace@lists.linux.dev>; Mon,  6 Oct 2025 15:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759764526; cv=fail; b=bkZ2JU6VQMKot4uNPwht3tFcM2q6bBL2b4Bm4I2jzYiblT4YrkB3EFa4mJTPQsLiE+4SieeGk70VhSrnHCf3OlTz1/vnNKuMUWzfsIfJsYZwZWLurxxgfkZxF2i9WZQEabIDQE389S9Q7KM+TmWS2zoPUd68sSGex7qwjLu8D/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759764526; c=relaxed/simple;
	bh=dINoHSVKPgsAMrKDjCp52mtR/BN2JTvzj0oLd/gywOM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=tBiYn6xkwaPnllbGAdzw9T60lZUogFlq0TsPIfxso4vtRRkfYO2HOGhAOYnv6hhvv2+9qdgLKc6Iczjja5yOGGnifKvoDrDmn+S/1+fOkMALxUXYamylwKwKGUNQ/EZ5Okx0/ZFRe4xCn54TOM3fHz4RicSLALjagTarEazxDKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FqyMPhFG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=0SEwzHKs; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FqyMPhFG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="0SEwzHKs"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596DxRS0030245
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 15:28:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=Zggr+us5kQNaUhUZ
	oQs5A/DxVz1aAuimgNYAZG6h1CU=; b=FqyMPhFGgWFZLQDrJZEt2dtKjzOrHEe+
	g4OxUW+9MG7Kp4fKkzuF1EJQLMAPz4+dMs8lVI0VWtL4ShOqi8JXiK93Yh6ydsSz
	tpY/pJa4/j5I9ghz0jf0BRqae56ootmvQ5Ic8qWj9Zcx8VqqHB7mKXy8UXawumpQ
	CEu+QAE8sR/XfC/Gi1QCkv3wq3w8qr4GqE69GDxnB552mLw5DYVi9F0OpD11ESGz
	hvThy6h3Qo5pazjTx2jVFl/35KjkDUyBMTm41lQE6CWN0byuZ188NpyesfVwj7Ci
	wPjNKCRzACRCjjtExeFDZX3sB2NnoNERdU6P4CTRsWhi/ARsIWxbZg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49mdyb8eew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 15:28:43 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 596E5xhx021343
	for <dtrace@lists.linux.dev>; Mon, 6 Oct 2025 15:28:42 GMT
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010054.outbound.protection.outlook.com [52.101.85.54])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49jt178273-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Mon, 06 Oct 2025 15:28:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4QufT/5FU/tbrApBNtsas7p5KPpqfD5FgHDg54/st+jKPJur+GoRWNjrbqi+qCuBO+hkcegEjpYXfDPfWr7RzUaSW7dHS6B8THMVeQNenPOGB0tshacxsqk+KglUQwcoRrLrADhIPG9I8mVENUZY9eTs8ZNHPgJBrpebhw/vatu8XK/3uuWR21okqEsY/Z/ufUmV2NzJU0JO/LBY5c2TGp45i2pfhfw5wbLXtZbn50SKO74RYj9wh5sD22xzD9gsTH3i/czZzaFtzhY0n+7bgYpkcSNbaiiAihgRqL360djffq2RxqMflBljRwr+8AJqXtY7CFv6mFkrG3uy1Fxdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zggr+us5kQNaUhUZoQs5A/DxVz1aAuimgNYAZG6h1CU=;
 b=sXUg7p0csbwg0Ihm+tiuxaOjYlfiJcFW4Qt/FZLOXmTVI2B7b2IGBeucA0g/OAYWLHtKSwZZ+z88tXPZhxFuAW38ge1rOQ3d6NWSQcXfi5n4dXDUkFhVEtYrGKiD25WsEldSMT6hOPhnR4cCX0xSJexPAqCjo1h29nIjSabu9PLRhBoIHEMK9hXcLFPbDQ4OK0xRmGAIGF0w+HUWfv0Lz9jHDK/kgPTZKM9dmHJGBJMPMWrRIWBaYKunKndnccpPX6fJr0rsxKduDi71cUE3nmlCD/JUPWnJgfzxB1vdFrfRnySvdbkdyworFiaXF+TQOBWr8Ltrh3H3MNN26NjC9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zggr+us5kQNaUhUZoQs5A/DxVz1aAuimgNYAZG6h1CU=;
 b=0SEwzHKsvEs49Y0F1ykghhpTG2SrGudEZmfQAIab67Ejg4sPL1WO9tE2ey45r+OWeuQDW7i+hX1pHeYdB2YEXHbq3zRsrWkUNJtwzYcd0cWVCpy7E3Eh196kEXMwIA9V03IamgjiF1r50/1ULz+UPzqiwLBzhLU+/k8p7SW9VN0=
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb) by IA4PR10MB8253.namprd10.prod.outlook.com
 (2603:10b6:208:561::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 6 Oct
 2025 15:28:35 +0000
Received: from PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3]) by PH3PPFA3184E4F2.namprd10.prod.outlook.com
 ([fe80::815c:d94d:29c8:ecb3%8]) with mapi id 15.20.9137.018; Mon, 6 Oct 2025
 15:28:35 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH 1/5] test: fbt return0: work on quiet systems
Date: Mon,  6 Oct 2025 16:28:24 +0100
Message-ID: <20251006152829.239100-1-nick.alcock@oracle.com>
X-Mailer: git-send-email 2.51.0.284.g117bcb8de7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::9) To PH3PPFA3184E4F2.namprd10.prod.outlook.com
 (2603:10b6:518:1::7bb)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPFA3184E4F2:EE_|IA4PR10MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: 9306800e-0195-4a10-1ac1-08de04ed03c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MMqW4PpcHXXnvmRyy5XU4sbS6RrFECOFTGbtFDcp0lGkGZCFNT/E6gbrnsaV?=
 =?us-ascii?Q?MCkDq6sTqkqo8a7hY8LQS+Z4xH5xUBa5pLz8qwN/7GeqF8AA0gvGGgh/om2D?=
 =?us-ascii?Q?pkpUDINDpK8D4IEYa29AfEppSHQDnKY0ARBUbwXLniL4KSf6j4MfBZsspo+L?=
 =?us-ascii?Q?uqe/zdQMxSGYwtGwE/U7TjkLhuaJgfM1iUZM8414K2qa57AA2fhDHhKRqkkz?=
 =?us-ascii?Q?v/JwNhld6roE1DRKT7xYk/w2nUX20+dzLG4awWfYdkuMjEzQb99VNDP0MpJ4?=
 =?us-ascii?Q?MvfV5i8pFRqmsnxQMybhc20D4f1R92cSesDbCR5Ae4gqYvpkWsoZPuuj0Ws/?=
 =?us-ascii?Q?lLV1FXBD37oHld34vIZ3vtIdPg3l5si3DoeU6fBuYrdKhdNC/TMeYMII1jb9?=
 =?us-ascii?Q?OZ1bmuoFFWkPtTSDZ/QEy3BY7evnV23MKMJ4Bdh2HcliAX5WU1oUW+gpS9xR?=
 =?us-ascii?Q?Ym43MVw93uBtuLuV24lAPVK8BAKnL24dCueTJFdZ1oEukfkzQc+8RbIqZZYa?=
 =?us-ascii?Q?jJqIMIc4t5IiiYdaCGQHPI6snagYyQ/Izmb3/AxKc9BPp6YGTSbTRnl76Dhr?=
 =?us-ascii?Q?446h08oI/Zb96Ml5jr/Mu0kZf0zb80sS9FbfNY1WIJ8gjkpxD5tFg8qLx423?=
 =?us-ascii?Q?4X91zXFyZ5jN61TwVnIi5pHDgMJerOE6wgHxVZKdyOmfLvvJPSG8mPv5vFaS?=
 =?us-ascii?Q?Kh34JVC/n+YX6JBZTchf5YK8PouIPPKs6xjDax8gQsLxBnwx47fSmu5HyIt3?=
 =?us-ascii?Q?MuJn4SftZ0J3vquRs56LUhtct/Y+bCnRbDr5kotMv9tJhotH6OKe26Lq8oZF?=
 =?us-ascii?Q?gY/4nk3+gQaHnTsZ4xaN5EyuwtjThBljgKdbRQX3yhzuHvgEC/3VLMwXlUzA?=
 =?us-ascii?Q?8pqdPAuvnNiX/2/1p6eR0eD00Waaa40M/dIGAQFGPzBO4LWzHtHALIhLtBEM?=
 =?us-ascii?Q?ttIdMVY1/7BCs4UcHThfsAZ35T9MLxpflipx1gnsLU6BQMQFnlIw71pJ3HpT?=
 =?us-ascii?Q?zLxudEF6cTsxE6Inoe1eFkPBM3ni2xLGvRoj9WOxfMHZ/bInlUL2F9C5KgzW?=
 =?us-ascii?Q?5DtswQJQsQmsuSOpjJmSgDt5LWw8sz+h0OwHTpn4Bqp0es6SF6lJZldbiKqL?=
 =?us-ascii?Q?2qCDMSbvgl80n+GVwiIrSelG147SrGDt0/XvbLqjEfC32pOiW/XiBjtvhOAM?=
 =?us-ascii?Q?aVihBOWkCswe46E0p57Wom5Uv1RXRFLIJLWgWXV3iXg8YU14jGtFX1VegsFO?=
 =?us-ascii?Q?Sx5WRR/vLfxlEAqRFQs2ZlGxqJnFtQYQsukSb4k+/tcZBp6Z8i2c9vwcTYBV?=
 =?us-ascii?Q?hoW+B/9CHY8AmpuIU7TpUHKhO3VEEPqLVUzynULlUgRCDS9msp1wFp5GE8kR?=
 =?us-ascii?Q?FchMzMe3a8AvH/ekOnwf5B+r/eP/iXAdInswqe5/G6zPzf/lwTUtSRc3gVDC?=
 =?us-ascii?Q?B60urFsQQNIu3JHBGUlxxprJbg1MllAAEOholqZrcQYOMofhpcU61A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFA3184E4F2.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kvEJpjWr/1Gj4/XwLrSMCcXuJiLUi08MV43Nxwd/b71S8VdutDCOh0Rf+Q5C?=
 =?us-ascii?Q?BJvQTYHWDDrXfG7X1RwAU+M6K918FHe6pOaNu1S7S7uVnTsDfopoNMBcBMiM?=
 =?us-ascii?Q?QwFN65UHUjGJVnYdY6VjqvkncCwnW3TDuJOVvZRVgWIll/yJzYGwSA+Sl8aG?=
 =?us-ascii?Q?cG8FHvCat8+A8EXOreDG3ua5/+yPK/USaCxC1/FQ0J4vf3zS8Rd59DkNWszf?=
 =?us-ascii?Q?uyBnvdD50lZ41DfR4GQWOwCGa04xHSl+NcqbvwEl/4/uYurLfJY+pePCp5QT?=
 =?us-ascii?Q?83IqGmGc5cfX4wohUV9bnVnY5O5AmacUuFTJ5rs9TBjttrInpNk6DionDL2A?=
 =?us-ascii?Q?j/3Y/aBWYd3nrjKuNfwgb6OdcuA61tm3yUO+T5u+VQBh3HuokkkvlpDkeKDa?=
 =?us-ascii?Q?doLy3+Gnvm9RGmRB4A6x+tzCPPho8NxQhhnM3JBK7ENmt07SLUFHKNVXLX5Q?=
 =?us-ascii?Q?V/shiZt+vGrQeecFYuIcrk6K0VwC3VJm/xigOtfmVDtOfClqYgn/q/gv8Yk9?=
 =?us-ascii?Q?0xdwBjmmlPuNnxq3XrsnmWV3mz/6i2ma2/injfsJfNux7Covt52fHj1m6AwA?=
 =?us-ascii?Q?FAEjGb7Q0M7vHujGtS1senalJx2TP91c42TvY0lezbL/QszqnrhFNABgrKCP?=
 =?us-ascii?Q?bGwJRr2gYwZbNrabXNqsQq9dx0YO9DaszHdTS2NWY+eYe1qnq8pmyT7UK9jT?=
 =?us-ascii?Q?0bJt+JAoCQWUFl9fynjs+SRUf0ZpVmMYDAayjoAQieGDK/o86o+17pKx17YS?=
 =?us-ascii?Q?EO3HKxiJP5nbMd+z5KV4n0kWeH0i4U7Gt5zazcUarYB3BoKAp7FrFcl8FopF?=
 =?us-ascii?Q?w2F9gOXpRx018V9eHww6yurXLN/jHcsXyvalPmKRUBvx9jZgw+odSk5G9Cui?=
 =?us-ascii?Q?ZPwIFYY61OdbW/cDRWXMoB7af15SeGFgzOPfcpqYS8dcNlrkifPPSJb6/Hp8?=
 =?us-ascii?Q?IA3yWnIAN1bdJg8jj7XZbgSvArd6MvyK8GeVuh48pZqecYh/imMyZixtaYmE?=
 =?us-ascii?Q?m91f/3i1DKHJhxmD8oUs2Afr18AIb38pEUscYbitCAV1N5hW6n3efZz/c+6s?=
 =?us-ascii?Q?114XHub/QU9FjFs14ugU4pM9g7tj2H6cip4EHUwB+n1Z9W9b2J4k4QEqAY18?=
 =?us-ascii?Q?BL+LVsMacOlQaQs3Ehy+H7aZHMF1xtWMyVf7l97ezHyC/YarZFtKfcOu1ShQ?=
 =?us-ascii?Q?m0C9JIrlMEc97fSCJfdn/wIQRDYutbpljo4NlMVwr2ECrZT5FxJUKXLRYSEc?=
 =?us-ascii?Q?EWZvirJCykRdhEPY3d/B7YLMOG3/1fXb04rj3Nq0kMmLNzOmUi/OxH/gRkvx?=
 =?us-ascii?Q?jpIBtZJMFPJgS4DmgkRimTsNv0euTxR1mIhyfmUmEpEg+pjFhrSjwXxKYB5y?=
 =?us-ascii?Q?7p+PFF2Zu3h3raCBoIctddYRBlvUzged0iG1HQ7eirSaQjL/dbJXZq2Ji9Vc?=
 =?us-ascii?Q?EZdgAtuEIAAdineD1858/XLCn0R2B7N7mBnZ30ekgIoMBsQJzXEDDyz420wt?=
 =?us-ascii?Q?3fvsb6oKD+MNkeC5bEqVVPbSrogE3qeG6aXtX6ov8P02ZADnD6sh7u/I7DEd?=
 =?us-ascii?Q?cJs4a4sog/hR7EwsCjhQ8U0BgIu0pkKALZjDDxzBrL0Xpxu4pBXZeezA/78U?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7HO/vNR2bVAsjQL4K1iRmgSg08ZqbmLroeou0Ku1jqQ7tAtiTt9YZabD4oa4hi4fgHje10rXFzlPs97s5836xCkW3VlUxc0tEhOLkRfVOLrdWOgkNZ4p8Nent0txPaeeOjxLLLVER+PIwV6p5x9AtXQrbN4gCpBz/GzBIKkXaxl5pFs/empOpOSjipVkB8SzykHe+RyI+mNp7SSc5pEzjOYTh8dfKa3jEXRM4WiA5vHx5L5OCemfHUA6KpqRu8T/0uzrqsOqifZqRXQ9+rAxqSGS2M0C9ARneEiZhq1yq6wgqIK5nF/fgIwht59dVANj2zX0snfS+NYa0Uj0ZvUBmYNse8P4B6CeLnmvZUeaEmsdP1CzO6H0RugINp4vpar3HEeF7JFxe1okZAXZfNYJyDuCoELWifOiWvjsf8o1NbBaXvDMMNCPNz9Y12V1Dwurx/qxusLpnbrh9XCJwLU78UVAf2Cr+E+JjYCsELTPx3YpmOSl4ZjmZXQ5P+PIwdU0hmVAZ0KJ7vWkhKZBBPIX0s+v+N4wVxDqOJFV4wxuLwJSKS5tJ5dpRdf4tkP3Bc4dZHFlk1aPB5IcgGoBUQ3INHOpFtvNLkeqmN3AFbwbv0c=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9306800e-0195-4a10-1ac1-08de04ed03c6
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFA3184E4F2.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 15:28:35.3383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jsdVH/8uBAdru55zOEEQo6X0eHn920Op7nJ+AZc/hIpiKt9e4nE2npBWyuO2vxXZoI+Kec5IoK0ivQSqtWCrFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8253
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2509150000
 definitions=main-2510060124
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEwMiBTYWx0ZWRfX6+cv3M0lqJk6
 Dl05ABrlnAjj//SkKKIIl/legaAYh5UDIe3peNMPNT6kuIi3OwpAIwNSkcYJI5EESWt7ldGc02V
 vI/W0lMgT0V/ANku0N++HX+iP0uqbzQ0bQrgJfE+OgzUjvWoreOECgVkteonZc/GIRfdT8Mc1OT
 9AowSbXVhHbLRqZviNufB95JutWdbtpbXE19SYF5oh8djoiwW42cXIDmo3i186pgvCpebibjKVI
 P5khkToro96DnPvqNUkbTOpNZN/oF6tobzmn0x9cMJdWOauOBuVJaQzfrAi8h0ocDcyMFIjwS8Y
 ZRbXQHFnjPPcZ7pA9mNrOUwuJupLgnhcH2iNDqQwhBe+nEAtqz2cgcGf24jwIhlYGy/7TUDBFFK
 NEDLWB8ssorMa4a51MEsvirieLPt6Q==
X-Proofpoint-ORIG-GUID: 6n4yu1QTXRKX5nIGeqTKfrpOrk3NTBc9
X-Proofpoint-GUID: 6n4yu1QTXRKX5nIGeqTKfrpOrk3NTBc9
X-Authority-Analysis: v=2.4 cv=Cb4FJbrl c=1 sm=1 tr=0 ts=68e3e02b b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=tyH8V26bHf4hJXxgQTgA:9

These two tests probe on sys_poll and just hope something calls it.
On sufficiently quiet systems, nothing does.

Define a trivial trigger to do so.

Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
---
 test/triggers/Build                          |  2 +-
 test/triggers/fbt-tst-poll.c                 | 23 ++++++++++++++++++++
 test/unittest/fbtprovider/tst.return0.d      |  6 ++++-
 test/unittest/providers/rawfbt/tst.return0.d |  6 ++++-
 4 files changed, 34 insertions(+), 3 deletions(-)
 create mode 100644 test/triggers/fbt-tst-poll.c

diff --git a/test/triggers/Build b/test/triggers/Build
index 4ff5002a853ed..bd6b0510ba003 100644
--- a/test/triggers/Build
+++ b/test/triggers/Build
@@ -4,7 +4,7 @@
 # http://oss.oracle.com/licenses/upl.
 
 EXTERNAL_64BIT_TRIGGERS = testprobe readwholedir mmap bogus-ioctl open delaydie futex \
-    periodic_output \
+    periodic_output fbt-tst-poll \
     pid-tst-args1 pid-tst-float pid-tst-fork pid-tst-gcc \
     pid-tst-ret1 pid-tst-ret2 pid-tst-vfork pid-tst-weak1 pid-tst-weak2 \
     proc-tst-sigwait proc-tst-omp proc-tst-pthread-exec profile-tst-ufuncsort \
diff --git a/test/triggers/fbt-tst-poll.c b/test/triggers/fbt-tst-poll.c
new file mode 100644
index 0000000000000..8b1e72eddd258
--- /dev/null
+++ b/test/triggers/fbt-tst-poll.c
@@ -0,0 +1,23 @@
+/*
+ * Oracle Linux DTrace.
+ * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
+ * Licensed under the Universal Permissive License v 1.0 as shown at
+ * http://oss.oracle.com/licenses/upl.
+ */
+
+/*
+ * Simply loop, polling stdin for something that cannot happen until killed.
+ */
+
+#include <poll.h>
+
+int
+main(int argc, char **argv)
+{
+	struct pollfd fd = {0};
+
+	fd.fd = 0;
+	fd.events = POLLPRI;
+	for (;;)
+		poll(&fd, 1, 100);
+}
diff --git a/test/unittest/fbtprovider/tst.return0.d b/test/unittest/fbtprovider/tst.return0.d
index 0b7091b320904..78a82ffde7473 100644
--- a/test/unittest/fbtprovider/tst.return0.d
+++ b/test/unittest/fbtprovider/tst.return0.d
@@ -11,11 +11,15 @@
  * SECTION: FBT Provider/Probe arguments
  */
 
+/* @@trigger: fbt-tst-poll */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
 #pragma D option quiet
 #pragma D option statusrate=10ms
 
 fbt::do_sys_poll:return
-/arg1 == 0/
+/pid == $1 && arg1 == 0/
 {
 	printf("%s %x returned 0", probefunc, arg0);
 	exit(0);
diff --git a/test/unittest/providers/rawfbt/tst.return0.d b/test/unittest/providers/rawfbt/tst.return0.d
index 0146d684f1033..915830c800b70 100644
--- a/test/unittest/providers/rawfbt/tst.return0.d
+++ b/test/unittest/providers/rawfbt/tst.return0.d
@@ -9,11 +9,15 @@
  * ASSERTION: simple rawfbt provider arg0 and probefunc print test.
  */
 
+/* @@trigger: fbt-tst-poll */
+/* @@trigger-timing: before */
+/* @@runtest-opts: $_pid */
+
 #pragma D option quiet
 #pragma D option statusrate=10ms
 
 rawfbt::do_sys_poll:return
-/arg1 == 0/
+/pid == $1 && arg1 == 0/
 {
 	printf("%s %x returned 0", probefunc, arg0);
 	exit(0);

base-commit: 877fcdeb25b370be182d51f27fb4bd8e4f739fb1
-- 
2.51.0.284.g117bcb8de7

