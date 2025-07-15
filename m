Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543892E370F
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752576632; cv=fail; b=EHSO+rYN2ood93V0FF7uZvom5W8/Hbap2G3ELClqOOpo3h9W9bQaVblLEwo9xT2zocCqa0rCaqOe2qbiV3sSD+76A4PkjpYoCsLIjM1PynzE4kuYUH1N7FAyHLRkZdWV4p1kXWP0e5yOgcoh/7FB39hHC8zaNUjLyTQmdq2O4Xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752576632; c=relaxed/simple;
	bh=A4NY5t4iW7mlcS2r830lIw+tpQ2CIbG8dxNaWX2FZYA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 Content-Type:MIME-Version; b=dKoMTON1ewQMr/x4Dt5zDTi0lKTONjo56nQZ35XwSD81q3JtVZOJuyDX920yfVJJpziVnEivxWFTB1yJnLF0mprX+9lAq8sNDokQmQL8gCwv+7ID08jC09jtA5JHWAHKLzJ4FeKmq+tt63V9Z8wQaFb1FrNb48KhAKKB9lRaGT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LigvxjEa; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=COA/64OW; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LigvxjEa";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="COA/64OW"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F9YpUG020358
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=oVSl6qoInzvXQ8XpCD
	ryPAXFeXn+DzFnTM7xuuQBI0I=; b=LigvxjEaJXVZwpyPmKIr77xK7LHF2CwVC5
	tT/UJPD6Zmg9hjA6xdkwxzahP3ciI28VM44PPrlAtL7qm+FE1xiaZ9lXR5AGB18F
	20ANp3StV7kjNDn+JHP8GMX4mRUGp9SRHTM+5UHSkbmAYavVLOnuHf99XGGmro90
	j96EHMZBb9XfEvXNx4j/bR13Euz5EGYyX3W0OfGSf0qHSyWPZ2RuXWAg8eCpwgQo
	dVCOuN9mU0fr9SxBUbeqmJG2U6/sUHfVzkxBFRbj3NNOfIAmjZwD+0qIIoiUL+er
	/XU5o1fq84+PZ3aLKmtNOwQT2Iv7d9ZeDL0D2xDzsg+K56kubVyQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47uhjf6tjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:50:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56F9ZXsZ011665
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:50:28 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2056.outbound.protection.outlook.com [40.107.244.56])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ue59t4s5-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 15 Jul 2025 10:50:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+YyhTb6L8bqfACcGCeP8n0bt8XjhKksaNfp+cdla4SOpn/qxhhzRkdKc028EMWSWIEW+PvG0BnFglWdb8eS09Uzz5aQVjAzeW672moBKuMldv6O92CK/COt3SvjMiP9s39B12+tdLz145SY/BxQdYfg3HCKapY9dV8qX0+cbqHcYVvG1RItEb0rSm1AGhScxoHcO7vYNbVT124hUq/V/bCNTe+6B8GLGnQhQTPf5o/WmRTsGnoDo2Frtgv/sw9bJkWdkG0zJjpyTWqPJ3OtU8xYXaUqbGvgjKTe2k2AH94TFWs6Dje+Vxopdb/jxmtj0WwqVG8B5Mwn81kJX1HfMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVSl6qoInzvXQ8XpCDryPAXFeXn+DzFnTM7xuuQBI0I=;
 b=s19Hx2J9ejMDlgXURVO2PtxRXtg5/am6FcGKsjNNVszUGaSd19ibLoOrn8zR0sHkAZ1A5xV+YpvdOJe0cs7bc6qTFHDGrx89lqhB4+jHjAB+xP7HRUNrRbkPtbL+ngrtYX+i/+Aj7p3wBm0R7Nwmnq1rC3wpwverbkH9pL2kkZ4mNTs+FukPPtM/nxK+uEmxbgHVQYnpFzdFwh8g1B3LG+gOmkA/Xx92IGxmM8RCs10Yn+XfDBcTb8x/3fpyP/v6cWI5taHSiO6vJToYtxrqYseGZZYUknOUDfLsyT+c02r12JJfvZ8PZCVSEwj6z8tPQiWmMDFUnK+1ShOVXIpUhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVSl6qoInzvXQ8XpCDryPAXFeXn+DzFnTM7xuuQBI0I=;
 b=COA/64OWX6DpjO20JDfD8+oDRKzd7ltW7I1Uadqb/H2EQO+uoKWjX+DbQDgCyoqHrmdx+ZXfrLilmi0I0UfnsE3HhJxJpKslUekYcbEXaMzK8JBBnShf6RjYKuUxIC2wyWePqlyysk+QIEdzev01ZSigkvyGDPPHpdw0gv9nlbU=
Received: from DS7PR10MB5037.namprd10.prod.outlook.com (2603:10b6:5:3a9::23)
 by DS0PR10MB6920.namprd10.prod.outlook.com (2603:10b6:8:136::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.37; Tue, 15 Jul
 2025 10:50:24 +0000
Received: from DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1]) by DS7PR10MB5037.namprd10.prod.outlook.com
 ([fe80::824a:572e:d9d7:e9f1%6]) with mapi id 15.20.8901.021; Tue, 15 Jul 2025
 10:50:24 +0000
From: Nick Alcock <nick.alcock@oracle.com>
To: Kris Van Hees via DTrace-devel <dtrace-devel@oss.oracle.com>
Cc: dtrace@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>
Subject: Re: [DTrace-devel] [PATCH 4/4] rawfbt: selectively allow return()
 in clauses
References: <SJ0PR10MB5672917714933FF0262E814DC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
Emacs: you'll understand when you're older, dear.
Date: Tue, 15 Jul 2025 11:50:21 +0100
In-Reply-To: <SJ0PR10MB5672917714933FF0262E814DC257A@SJ0PR10MB5672.namprd10.prod.outlook.com>
	(Kris Van Hees via DTrace-devel's message of "Tue, 15 Jul 2025
	01:48:34 -0400")
Message-ID: <874ivdwwwi.fsf@esperi.org.uk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.3 (gnu/linux)
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0158.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::17) To DS7PR10MB5037.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::23)
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5037:EE_|DS0PR10MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: ec47f27f-4514-4c96-0387-08ddc38d66fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EWMUF0q0E7nP8gDvZXuHmZGY9yKCYWUjI2h4JTRm+r+8ek8+px7ePMgLrfPl?=
 =?us-ascii?Q?GJS3QKcA+6elDMlhl2ZNeBdVMdHBX+NsYePAZoSqNJ8IZ3VXp8I5/U6cD6wU?=
 =?us-ascii?Q?RBcps0nOzFVul/mOg2lENEUbvHZttDQtG4tsyrzqWbSRoCCha25roe17jiLb?=
 =?us-ascii?Q?hKy6KLbclxDIrpG+0rplkWduXs+haBh+15csY2CtVJkJsnpMRa45mvrZYReI?=
 =?us-ascii?Q?Puvr+0/nuzTUtgLRt6V5ZIxfoljxYTUOFR9e6EqPbRGpoejz30XMk3Nb5ovk?=
 =?us-ascii?Q?uwBdnrj+Hk6XqemUyc33yE6tKoilQ0XAl4cMHBh/uKcMTrGeLtOXVjyV1QPU?=
 =?us-ascii?Q?b73a0lkxmHTPcESPtCcGD/RJuoZBugU7V8Y5SlH/I8h4wE7SgXY5kNVN0je4?=
 =?us-ascii?Q?EUi69KvJ7Z23R/ISb9VT6Pq1QQUPgZjjJTga8umyT0DmgPFyKnIut1fO8BO/?=
 =?us-ascii?Q?42t5YR6/pWdUvIbBl9rthyjRj+G792ymgQbOg78sTX/mdfqw9309W2x7zXmP?=
 =?us-ascii?Q?Zuur7yqQbOHHrvk8S3TdPngpwezvXAZIY0g9QmGt35YkmbW34eRWbuQSLnHT?=
 =?us-ascii?Q?hoIsIHyxNhFQNi+eMWQtWne+Cm+eEaA+wp7hNHP69uJmqcmM2LkVH3ObEH+o?=
 =?us-ascii?Q?dHRcLivoGeW3W2lkjUTMWtOxcce2O2351VKIXjtQOWzMO8zouhCC/BnM4pfT?=
 =?us-ascii?Q?xlzFWiMmS+aVDuwNr/shKN/6+JPMr2PnhBhxqntVBDuORfF0xAOkuIf6bUnD?=
 =?us-ascii?Q?JC4gUDybcEwWeq8Pd8/38RUaW2RMfLc7Sm9clTvFYHHBrvp5pFh4Ba5TaG83?=
 =?us-ascii?Q?HCqw9/IAtxUbSvT/XliGVRoXfH1oPqxOxnyKJvYbTU1n5bB5u7iwYzzrYUpf?=
 =?us-ascii?Q?Igw5MVwnq4/hbuvXpqy9tyCZQNl7jLkK7JCarEKzPnlDMjNS8UoVgNtDSefT?=
 =?us-ascii?Q?POfaLmZqqcJG8MaNokWDKME56Eunz6irExomd25yd+LAxpER+jZDkoH0X661?=
 =?us-ascii?Q?t85wUDryD8xu/tYDEvm8QjKb+TxsdhIKPHGqOoZLR49u/wUZAhCGtijaRdfR?=
 =?us-ascii?Q?lXTZntHAldxkQbpDhKiIWmLBA8TMni0K2bOxkb2z5MwSR9qJG5viXUjRm7hJ?=
 =?us-ascii?Q?JVgdgL0vmeUbBRkEMJj3/p9xB3S6PYiS47JQXszx2lLr1RnUGkUCSeKH4xKp?=
 =?us-ascii?Q?iO6AHB6PCt1/nvzcJ4xl6L70d5aC5AU1zdEJ5RBhL+4LzSRGwwJ1VIrUuhyD?=
 =?us-ascii?Q?oLBRWuCuE3Jtbj/dCVPctzCst5hTyEHUgG78zVYWiLtcoc8+BO/hlT9q0N/I?=
 =?us-ascii?Q?hqS+V8JTZL2aBvPH+JUhCMCajTb6hB2W3rG+jDou29/FwcTvedZpv/a8ib0a?=
 =?us-ascii?Q?dNAJNXAGAXRBeh6BppWMzLxrBLjo/fAM/Z1XrbEVpBRM83x3oaP8UeSsj6xn?=
 =?us-ascii?Q?EHIMPG0OsZg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5037.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lsE6zjBSMmCgCItz2JWB1u4gKEB/FsMiKVCSeuuvFBo4D5fU+SLOeUK47Q5d?=
 =?us-ascii?Q?oXBYitqEvbF/kh2jvep/BYX78fNcO9YlYS/tU4nKyueOmKhz0pN1RaNvveux?=
 =?us-ascii?Q?FhmT7HaZlA9RkR8ZEpib65gVKZtw4ahXYvxSfZnpiMPaeQPJV9YroP0ZMWht?=
 =?us-ascii?Q?AJ0qJK5vR8Fhvx59nkZAD1BBdMFUQYbSGUwhPvGytUWT6d3tic/St/FLoJM4?=
 =?us-ascii?Q?Ds9LsQLIBiBl6fz6mcVf7a+rttw4BnDsIUB+2vOg6SxOXZf7K/aZEDLiLSEL?=
 =?us-ascii?Q?gNAuZVhshPIZ4b6ANOqzqtJweWZxO3vWYr06lTLvpjpBaS5X5ks/bqUHXnsN?=
 =?us-ascii?Q?xRM97NbygajQqfn15vzAaxy93jkA7LF1tl379YDifH8HLy3fr1LSUO07NgTQ?=
 =?us-ascii?Q?6W1jQU2LrMH5yj+RpZ8wJsFB7Jp2U6WIkBMUcRMjWERu8VGkx3qOzFv1ZKQg?=
 =?us-ascii?Q?jmxy3MmzIidPYv75b5FQ3HyUbfuC7Z/T22wsa+gr9wzKSflLS+ddyMhgitj3?=
 =?us-ascii?Q?eubHumBZ1TBL+UpdEsr+hVHWlPmonPjPatpFrUbxG3UKfrLXuBRC5dv8gFbw?=
 =?us-ascii?Q?f5ZkVCKQ22iPBEKEjywc3bIRwx3AZJgJVNubtsau7rbcMPZGv39x/mBp1Ji8?=
 =?us-ascii?Q?AilsCfvMmJmwIl8pKcy0Hc1p97txJqoeyvnvuA+GGL/5zc8uZ320PyBrSu2q?=
 =?us-ascii?Q?mywpkPBWcZwL/pNCxGOhEZZMMljeTOWn465r7qbk0KuNbaETrhPLheyTQaco?=
 =?us-ascii?Q?TaB50/64rKoid49uSmO08/m03QuWy0dscglj8/WGraoAYNObNSETm9E7+dx7?=
 =?us-ascii?Q?0TbCs5oUE9eAqKPg0CyL2KWrjR7xke+RrxTXMBiL2THFDPtIByBIVa9ABNMP?=
 =?us-ascii?Q?G577a/HPC4FnogNXsuJxPsGII8eHmgLRCo+Z89AFgjHsNHxNCVGYK9QoxA4m?=
 =?us-ascii?Q?0rhEza8Hx3DCkeI0lqpsx/l+u8CReyYIuiC/0SauJkl1j5VCkpfhFiafo3X/?=
 =?us-ascii?Q?i+kbm8+o6X1skLuBQf/8HFX7TZGre/JUPTyVJ+0BN2edFWbiyQTQdBuB6ZgD?=
 =?us-ascii?Q?UGvJWZEmMnjbjzJ8Hn2FwulNKeJuWS0sKO6cfYnNGZIqTH4mx5rdgvNFpRx9?=
 =?us-ascii?Q?Im/VDDtL5OfiT+AfhPTFRekk7ktZOuv5aFaNPSeviHl0OZ+4HeLxs/Q97+oQ?=
 =?us-ascii?Q?vv4pqS5hpg3NpTqY5hTMZcqsTx9p/gK25u+dfqlDi38/un7xes/hB6Q6/Kw7?=
 =?us-ascii?Q?k58AADlJCejrnIsGdPWyCIi66x7Gm05jPMOL4stZCuz3up2qO0CYeCMDyq0D?=
 =?us-ascii?Q?WJPkpsKkRC2rROLrEyloVWK/gOOtzyUFDrvjEo4999mYhfyUrqEXwYLMumWl?=
 =?us-ascii?Q?7dYDD0HZRlAuElMqS8vP84CVut2WU2HHVCmdWaEZauzMK5SJBwPNadbrq7vU?=
 =?us-ascii?Q?x5uyhq1EjaoyBDWuDpok832cKHbDc4jaQAiLwsMqdRN8nvdF4aYtUvpYUAK5?=
 =?us-ascii?Q?Pk+QWpOZ5EMo8Va+Q2slp4nqGd3euTn3X9IVpwRkShkd1XQ7JXBU5XC1xoGH?=
 =?us-ascii?Q?afoBiom+5gBrHkGhzuNh0QBMH3pyZc76Xu2BHqPA3WdiB3IJeW8deAC/hUjc?=
 =?us-ascii?Q?Mw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ATTu1f1FejcvKI9OA3x3cQROpR2R5dvfAGGPWiFgomhzwbI/n85qNAfVIgYeYhyMPrsmzIXILPl08NkphyD4mLal6+h8dhUSLWH47IwUEgfcoP9xAdP9wUpc7pnGuH26AE5BmcGzeGRjDtT8h+jIbiR8qEHAuea0LjY9vsZ/k/zCHGlm6S2FA130fIQKpX9fGlDedFolKRzbKwgGBxHAiyzyGm6wVFzrbzD6Dy2oyBLuGoYqWxN52klaKWf8H+cwjK/O8uWvR8aV59Gi9RW1QZMzurP/DFxB/2wTmzeY4eHCzGul89KMvxhVsylZZPJ1WM1Lu3lHmqUGmO/tebqrMwAWtwm7I52uO3DEPVUOi3gdPAeV/kL8eFfnpgOYtexiABHspZF8bAieo0kPHT8PEWTJsWLNVlClWTAYokBJ8BCDaawk/JS4uMdo1Mi783PH2aYcpw4w2THuO3IarGLL1ejdhEjs62g+tXAUyGrNmR6RzUWRgt9WQu/OeIQysr0uPiKZH/eqBNd1fyy6zesFeD6sN1hWh7ADOKifRDpfI46ij1S2OYU0lYLezeUqU3hUxiS3PCX2vnm/R7dAPOEv30AOd5enr3sgoWMf/AuA3y8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec47f27f-4514-4c96-0387-08ddc38d66fe
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5037.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 10:50:24.4460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3DDtRtgfWZWEKcI8DSrrv+0ibHQMOoGqdgu0jqf5PvMVgcHrWNPGOkB74PST0zxeHOAoYhh75FF3CKAKClwXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6920
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_01,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507150098
X-Proofpoint-GUID: KI5AzXXNRFACzmtdeHFmtFqZjpe_mY9E
X-Authority-Analysis: v=2.4 cv=O6g5vA9W c=1 sm=1 tr=0 ts=68763274 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=PLKM15IfKqamK7nIB-cA:9 cc=ntf awl=host:12062
X-Proofpoint-ORIG-GUID: KI5AzXXNRFACzmtdeHFmtFqZjpe_mY9E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDA5OCBTYWx0ZWRfXyzzFEHa98uB0 jLapD8uX7mW/+DPIjw69ceaWS5BNctgscudYtvBFZDPsMR29s9hx4lM9Sgcfq5V87wbq9s2t0/3 IUtoiAxaYGKIvp1lP6WhlTUbMSuJHHBikfAFN3QgV+ktDHyCfZKY7qFXC4vp6PlWWkac9i9MQyp
 ipvZMAM/cRB5h8D3w3tXstZUMiQOgZgH3vGvlb7ShkLaCza74zSYdFUObyaa/LcIqoBwZLr8fjo UYKMpVOIfEHdZHejh2ct6/wRH4T0ztw2Xnr22DwXMRT17/f0+s+Eqdv9TozSrGEYmt69BzrbSor 1WF3QT0uPticRc2ua9xscVTu3StSeD7JI5BKZ3D1/VIrkFLtOJEU6lgMWOb/zCeK6NrJpevAr3k
 2VedE32eqIpWTEqvSL1nl+hiZ0BzlX0DEYzHoH7yy+rfQJN0q3jCZ17vdB7X0R/mFF+BRgpM

On 15 Jul 2025, Kris Van Hees via DTrace-devel verbalised:

> The return() action is only allowed in clauses associated with a rawfbt
> probe on a function listed in /sys/kernel/debug/error_injexction/list.
> Use a reject_clause() callback in the rawfbt provider to enforce this.
>
> The list of allowed function is only initialized the first time it is
> needed, and its content will be stored in a hashtable for faster
> lookup beyond the first.

Pluralize "function".

> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>

Reviewed-by: Nick Alcock <nick.alcock@oracle.com>

modulo typos and other nits above and below. Nothing serious found, just
misconceptions of mine being squashed.

> +/*
> + * raafbt only:

rawfbt

> + *
> + * Accept all clauses, except those that use the return() action in a function
> + * that does not allow error rejection.
> + */
> +#define FUNCS_ALLOW_RETURN	"/sys/kernel/debug/error_injection/list"
> +
> +typedef struct allowed_fn {
> +	const char	*mod;
> +	const char	*fun;
> +	dt_hentry_t	he;
> +} allowed_fun_t;
> +
> +static uint32_t
> +fun_hval(const allowed_fun_t *p)
> +{
> +	return str2hval(p->fun, p->mod ? str2hval(p->mod, 0) : 0);
> +}
> +
> +static int
> +fun_cmp(const allowed_fun_t *p, const allowed_fun_t *q) {
> +	int	rc;
> +
> +	if (p->mod != NULL) {
> +		if (q->mod == NULL)
> +			return 1;
> +		else {
> +			rc = strcmp(p->mod, q->mod);
> +			if (rc != 0)
> +				return rc;
> +		}
> +	} else if (q->mod != NULL)
> +		return -1;

Ugh, that's quite tangled for how little it does :( can't think of a
nicer approach though.

> +static void reject_clause(const dt_probe_t *prp, int clsflags)
> +{
> +	dt_htab_t	*atab = prp->prov->prv_data;
> +	allowed_fun_t	tmpl;
> +
> +	/* If the clause does not have a return() action, allow it. */
> +	if (!(clsflags & DT_CLSFLAG_RETURN))
> +		return;
> +
> +	/*
> +	 * If the htab of allowed functions for return() does not exist yet,
> +	 * create it.
> +	 */

Personally I'd move this into a function just to do this initialization,
and call it from this one.

> +	if (atab == NULL) {
> +		FILE		*f;
> +		char		*buf = NULL;
> +		size_t		len = 0;
> +		allowed_fun_t	*entry;
> +
> +		atab = dt_htab_create(&fun_htab_ops);
> +		if (atab == NULL)
> +			return;
> +
> +		prp->prov->prv_data = atab;
> +
> +		f = fopen(FUNCS_ALLOW_RETURN, "r");
> +		if (f == NULL)
> +			return;

Might want to at least dt_dprintf something here, or more likely
xyerror() out, given that this probably indicates a kernel configuration
problem. Right now this looks exactly like a success (!).

> +		while (getline(&buf, &len, f) >= 0) {
> +			char	*p;
> +
> +			entry = (allowed_fun_t *)malloc(sizeof(allowed_fun_t));
> +			if (entry == NULL)
> +				break;
> +
> +			p = strchr(buf, ' ');
> +			if (p) {
> +				*p++ = '\0';
> +				if (*p == '[') {
> +					char	*q;
> +
> +					p++;
> +					q = strchr(p, ']');
> +					if (q)
> +						*q = '\0';
> +				} else
> +					p = NULL;
> +			}
> +
> +			entry->fun = strdup(buf);
> +			entry->mod = p != NULL ? strdup(p) : NULL;
> +
> +			if (dt_htab_insert(atab, entry) < 0)
> +				return;
> +		}
> +
> +		fclose(f);

free(buf);

> +	}
> +
> +	tmpl.mod = prp->desc->mod;
> +	tmpl.fun = prp->desc->fun;
> +	if (dt_htab_lookup(atab, &tmpl) != NULL)
> +		return;
> +
> +	tmpl.mod = NULL;
> +	if (dt_htab_lookup(atab, &tmpl) != NULL)
> +		return;
> +
> +	xyerror(D_ACT_RETURN, "return() not allowed for %s:%s:%s:%s\n",
> +		prp->desc->prv, prp->desc->mod, prp->desc->fun, prp->desc->prb);
> +}

(end of function for comparision with "error" path above...)

>  dt_provimpl_t	dt_fbt_fprobe = {
>  	.name		= prvname,
>  	.prog_type	= BPF_PROG_TYPE_TRACING,
> @@ -628,6 +761,7 @@ dt_provimpl_t	dt_rawfbt = {
>  	.populate	= &populate,
>  	.provide	= &provide,
>  	.load_prog	= &dt_bpf_prog_load,
> +	.reject_clause	= &reject_clause,
>  	.trampoline	= &kprobe_trampoline,
>  	.attach		= &kprobe_attach,
>  	.detach		= &kprobe_detach,

So unlike what I assumed in the previous commit, we're assigning to
reject_clause() whether or not destructive tracing is on...

... because dt_cg_clsflags() is turning on the destructive flag whenever
the return flag is on. OK.

> diff --git a/test/unittest/actions/return/err.not_allowed-1.d b/test/unittest/actions/return/err.not_allowed-1.d
> new file mode 100644
> index 00000000..246a68b1
> --- /dev/null
> +++ b/test/unittest/actions/return/err.not_allowed-1.d
> @@ -0,0 +1,27 @@
> +/*
> + * Oracle Linux DTrace.
> + * Copyright (c) 2025, Oracle and/or its affiliates. All rights reserved.
> + * Licensed under the Universal Permissive License v 1.0 as shown at
> + * http://oss.oracle.com/licenses/upl.
> + */
> +
> +/*
> + * ASSERTION: return() is not allowed for fbt probes
> + *
> + * SECTION: Actions and Subroutines/return()
> + */
> +
> +#pragma D option quiet
> +#pragma D option destructive
> +
> +BEGIN
> +{
> +	ok = 0;
> +	exit(0);
> +}
> +
> +fbt:btrfs:open_ctree:entry
> +/ok/
> +{
> +	return(0);
> +}

This seems like code that will rot fast, given that btrfs is one of the
few modules that actually does have error injection. Why not pick some
of the huge mass of the kernel that doesn't have it at all? (I guess the
rot will be easy to see -- new test failures, every time...)

-- 
NULL && (void)
