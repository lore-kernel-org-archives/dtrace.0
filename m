Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21782652B6
	for <dtrace@lists.linux.dev>; Tue,  3 Feb 2026 16:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135812; cv=fail; b=AhmAlgJOjb04byrwlRh3X9qh1Jxx9KSoH34/Vtw0WUEIcDkyx2ZEEKnMfzrLyz62r5jE+dQ7UbVWXjK7ASXz17qEEyNdmSp8ZtRk2xBclrfJ+2+mNP0r74PAyxSkAGgtIStmePoam0XaWxt+dgMrFjX87fSgH0W0rKpfXyMpYM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135812; c=relaxed/simple;
	bh=n9pdaO1yScWYXmgUoZkmsXIiUYBkUZdwZ8GZl7ACRSo=;
	h=Date:From:To:Subject:Content-Type:Message-ID:MIME-Version; b=AD8HfSLmUndVfwGL2mcBH8bTHcfhz46I8javQhBoaucoj14r24sTJG9E2JW0M5mNmKujGWC/z0ay74GcxdWOygN/COuESXf62UmQio7IBzmDw+2lLYzE8Y9O8GG8hIawiHxuP/rkS34OPTNaRefAO9X9xZGoB7oZBibnT8wV0jI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Fl4K6Ngh; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=F9ifwrmQ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fl4K6Ngh";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="F9ifwrmQ"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Ev3nr4101967
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 16:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=L2jTVKPK33QYLx2W2dR6Q0e83ZX3e8hcn6g0vT5i5O0=; b=
	Fl4K6NghoMDJdseZNhIV2Ba2nwfR/Sm0851z9OqWtcamEeXCuoS99pm3V6hsADPY
	VDgiJ/ahrSzxuAadZTZSglTaob399DbH3bzWnuwKH8+RVTIetamp8nHoiBosd1Wm
	corNamSGLoH2KAt00n/2tE/o5NHI27OROmbW8bk4AbkQkWa6k9AI+Rt9j5h2foq+
	OYhiRu2lfRwKhIdyhenfFqmqKzJ16ST3Z90A1ci4x1E+cGpUrO3I4n7w9TB1SMIh
	brRKZsnXx0aOdWXUCE+rryMhsvJ13NWTwAa+oA0N73Eu7A1PuDP8xDN/ja8xh7yA
	AYJlW+ynVdsKV4b6ARwhIw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c3k7ug5pe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 16:23:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 613F2kbr001964
	for <dtrace@lists.linux.dev>; Tue, 3 Feb 2026 16:23:28 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4c186mjq35-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <dtrace@lists.linux.dev>; Tue, 03 Feb 2026 16:23:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJMDBCTblehDSNDs5ODQrYxc5v59s7HZ5B6rUmXTowtTIW2XHGW4eaxiHoO1kPcNkAeWHfnBqJ6BQUSrIztBSfGY/hn7iSJXGAXSqr0+x3Ojc+RMSyJZUdMRLtvd8cE+wSd1PIQLYJ0jIyex9gG9zvgpZLKjS6JZuIPmS1KZcs0cPYLbhzduw4aYsXa6P262D9mmbOUy4L/orOxbdFtMtUE9uEjf5E1fTPDBHSXeDXsPYxx6otTm2SLkpu79Tv2c/robZxKI4bNmQvB3FHrptIOte+Zekn88pE+IfFCpu189rZ6zV692xe7uKG+TwxBdJuY95uHPj0nFxUX9yWWcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L2jTVKPK33QYLx2W2dR6Q0e83ZX3e8hcn6g0vT5i5O0=;
 b=uYoqYRrc5TtKPFI2Q9wz1rf2Jtb+Dqc9/Kte84NF8BBvYHFncDznG3NPQsY0KMa1eyzF/exN35MQyiLJ+M9g0cwtCrDibH7vBFQZfOW0u3fKCMCuZOsxeseyrez3m9NLNa9tgg6VkQj8kh84u7yGqM3RJ00S8NgC3XXAXYw/4LLqmKNuDREIQJieZFgnhpWnpVjJW3ZpI1YguelWm8n0R95RdgiEOdlMC9NRPl6gf2sEvzu6cNhZAsWerup/Q+BRx35ZQ52uEzwQKZ9Poo+4/GX/xXVexn+clEmvynapLO3dNP+l5/rvkc/h+eiVOaRv946laxY9wYaEpmoWGMuPFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L2jTVKPK33QYLx2W2dR6Q0e83ZX3e8hcn6g0vT5i5O0=;
 b=F9ifwrmQHpmMk6b+V1lT3b8XnIT4ICNDabK3IPS5hkzsUj8qLZzLiaYmqdCHHCWNkAo4p4H2mDVPx2AC2Vm/RFU9tMFE9P9gpZLJaHWVTcHclF88qtllk00qlt/Uamho3ShiJMYWIl44HdPM1QkFo0hX7LJYB/6S4dzy+P8CTYA=
Received: from DS0PR10MB7522.namprd10.prod.outlook.com (2603:10b6:8:15e::16)
 by SN7PR10MB6617.namprd10.prod.outlook.com (2603:10b6:806:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:23:21 +0000
Received: from DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a]) by DS0PR10MB7522.namprd10.prod.outlook.com
 ([fe80::9668:955e:1688:ea7a%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 16:23:21 +0000
Date: Tue, 03 Feb 2026 11:23:20 -0500
From: Kris Van Hees <kris.van.hees@oracle.com>
To: dtrace@lists.linux.dev, dtrace-devel@oss.oracle.com
Subject: [PATCH] syscall: fix syscall probe argument handling
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:208:36e::25) To DS0PR10MB7522.namprd10.prod.outlook.com
 (2603:10b6:8:15e::16)
Message-ID:
 <DS0PR10MB7522673147BF87561EFF9A68C29BA@DS0PR10MB7522.namprd10.prod.outlook.com>
Precedence: bulk
X-Mailing-List: dtrace@lists.linux.dev
List-Id: <dtrace.lists.linux.dev>
List-Subscribe: <mailto:dtrace+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:dtrace+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB7522:EE_|SN7PR10MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 068e02aa-03ea-4fd1-d580-08de63408c10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?edQDrJZY8CARtkLoN270EZGN6poouJ0d0wTA0ihi8EsSDstb3Y0pW0x4X16m?=
 =?us-ascii?Q?ILadQEnZCY7xvce7pMw+siLJyxhnwArT1hpcukVOJIkfHUzxrYkD1yqpPPSN?=
 =?us-ascii?Q?5O4lb1bCKlznTaci1lNnycm6E/50iCndHD6yg23wH1wk2Rt1kC2FVL469hMa?=
 =?us-ascii?Q?YiiLUfIfAXIwktO+92HKY4KgfxoEnRWbYgEfMCdNFClYeYgIhTOBDi+ND+EM?=
 =?us-ascii?Q?2JHcz0qNc/knaQSXZtjNFtYk6xEuFHmc67PwOO8w0TgoLj64JfvFYk/9MdtR?=
 =?us-ascii?Q?OL6Wi4G3ksz1nBWM2p7LyVIrY2Bx+Gr26laQRxUon45b74cUXnR78zjPvhmY?=
 =?us-ascii?Q?sxNOAy6cSR3/AXqdS0fFwVAH1WUpja5+pDlEUsac2IXvB0xr8NWlcR/yWpyg?=
 =?us-ascii?Q?55owFsd6L9NCKrORCBGlMZ/t8TqqiLOQBgqugNJJeO2uQOEkG8CDQRK6ImQk?=
 =?us-ascii?Q?6EXp9kZ/myNgWLVNCIyDSjZZyPC+X+NbFGZXWwRmji+w9NptSJCMdM1Wjy+v?=
 =?us-ascii?Q?spK9gkoU/9Y4Hzu2tR1JIabOr/ZQBQ3lxuUFPDjG5q99HjCmfw5OdzZLC2nP?=
 =?us-ascii?Q?3eQ8tadE8h2zi5gc/f8jATTlG8LiuPwd/f3fNTCJT8OAqGfi3AAml74j1hI2?=
 =?us-ascii?Q?/lwvhHecpztbm5m09Zg/YqxwCYGUH+g5xDD/3u7L2c0YBu60ygC5LK5SBJws?=
 =?us-ascii?Q?Gz0FtT5nDqbP7V7LthdMYGpFol5fkN3E9uMsrGzvFniEiZ5HCfeBv+yOKGdl?=
 =?us-ascii?Q?Hn0wduSPNocKPGgx5WF3F0L/WMgCF6oBg/NAEMs4WC2X3Bu8sUxwK4EIu1l9?=
 =?us-ascii?Q?uxJICh9xesDfcAed+0+17vRlUYjeBJdn1gJSZz3ME04autG2T0agpvO1g+cP?=
 =?us-ascii?Q?yx1qH7pfbdYP2UkqQ5Ed3ZCgxBGcoF9t2n9X/VMCauiFcBPv0USvwuOWCuWy?=
 =?us-ascii?Q?NjIhc6gAL7hOja5H+B/xxNRHf7ednuIahiHb4M2UNkOR6e6dqKYCXwnNL8Ox?=
 =?us-ascii?Q?COqRMww6ripR5I8XQQGhhPDiConeA9rPbbk1aCQwp1QcAwc+c1tH8d0bXxyI?=
 =?us-ascii?Q?TFeOTz0/BGrjbsd7OJOwaBYcdrvi0QZ1Rbl64Me3EHK2Uo9xy+u1FgUlmxXV?=
 =?us-ascii?Q?jU4qptKxeYvVzKK9R5YebzRHfY9PdBUeErEo+l/6IBrlfU0miAHr3v4/jru3?=
 =?us-ascii?Q?va/qogVWVPad8Ta/cCWeZWOOSfkTY5RPczRuBJFJ2tS9dBrZn8Z5bjR0/99D?=
 =?us-ascii?Q?S8Xy36GHjGO8tNdc0cJ74065Krz5T5GaGLM21KkLVfDhvfpPQeqd8mZeRbJO?=
 =?us-ascii?Q?YKeR8ZKPXYmxZA2xQ1TIowYshftkyk6f8lvua3lP42rVCycsB0owrkF8TZiw?=
 =?us-ascii?Q?WKYRj8N8utC99PU9Lr9TJWBzI5VqtfcpBbAIQXWIzO1rR/Lj6e+FQ0t/aLwd?=
 =?us-ascii?Q?lFYRlnc9lqjFyjEVOl9RDD5ymxQAVTHPBIdYJxQUp6tQQWWhfLOvLlCDuiP/?=
 =?us-ascii?Q?VF6zkw4AvZ2teCEKKROjWR5FWm19Cd/rzFaSaWKlVlNfaxOxiWW318+iJIa6?=
 =?us-ascii?Q?NQ/n3BEtHb8lM2c+gXA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB7522.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZhwWzKOIGn3io8yTieqXryTZmCJi1UJbceJQdrmFcxJ2oRzgz767FWSunK54?=
 =?us-ascii?Q?Gn7m+y8XZGStfSWvD+GHP8EfLbG662pFG5RoH/20fuXSOZaDO/U4h+zjPQtO?=
 =?us-ascii?Q?/chYrimM/A8GXsSbCcpQlXevGNAgcFz8WBZcIZe9ZGY+hfuNEXDgT0xs/VN6?=
 =?us-ascii?Q?lfLRa8xVtCqvzp+AplK55ROnJ30yzdki/lrUk4I7sidrh0dO+7zZHzCB83fK?=
 =?us-ascii?Q?oxd3oV3BpxU6iotOduWikq7cWzuR8CzSvKooXGz6eoqOVPapnHsnCjInw2yT?=
 =?us-ascii?Q?nqOM2CcEamm3gbd3cNKd3qT1p642SodB94gmLpU5K7y/vgrf6huee1084UvJ?=
 =?us-ascii?Q?L6e6e2m1SLeAB1O0sQVKmcSjVfV46KkOtjGbzCB/QuOGYlkgS66c3JwzcB9c?=
 =?us-ascii?Q?FRxqOfYV8I15slRr9ZmMGxKHaVGtiTxey9ELkoG8IYjyCVl9kkFD/FldEFbA?=
 =?us-ascii?Q?z7ySJtfZu9MRSFiVaa7NVtGJ9uyZu1/ne7cM05sem27Wgb4ABi0e1+K8Xlq+?=
 =?us-ascii?Q?akkHen9tV6o61tXSQttlo17s+j6vk+mhB3wzZU456ScNOcc5uOFXBb+jLLrc?=
 =?us-ascii?Q?QyKkGYxcab5Lk0bF7oxpOVxmfhJOBN+pI+8gav9NFEiooyhStZx/LZw1ghwU?=
 =?us-ascii?Q?GuygIozNKz16Qa6gXUXtGm/U6AOuDnST1a43k00IwKPVs28MX5MDPOMuXPY7?=
 =?us-ascii?Q?eU68vkCGKrdwW29ac/yEIUegQ3btBFs/CRqs2IG6njfQA40C92bPZJnzAMnT?=
 =?us-ascii?Q?XmCSxPSl+0wdKieGxhvUsnP5MTUJF1xlFUgPGHkN423zGFZ5ZT1Lrv8eWR3c?=
 =?us-ascii?Q?H33C4eDHvw2/XXUud1q3sGzZh8Bq7MT5ecD7jxgGheWkXn5hJ3bUbh+59ToL?=
 =?us-ascii?Q?lwlQkOf9PbhQbmf3TWiAOBTV8ktulzpmqyAZwjBYGYEQsBVmD5S8H0msE2FG?=
 =?us-ascii?Q?QOSr2ft1VYLD5B46ZSy4aFr7LM/IWnk2xzaGk1mdkHOvXrcnJYCD7WYP0m+l?=
 =?us-ascii?Q?E96dl0peSDwl8jEUJt3bikA6p8fCOQ5xVlIO/68UUNMq+Fo6wJuH3CU5aj3m?=
 =?us-ascii?Q?0eJ47DWXADisBs2os0reu7hSWT3lZt+GaQelxdtw6s/55wRWfWd7+exDoEMY?=
 =?us-ascii?Q?rbTcWwl2aBtt6EO9L1GY5XzNjmJgFAbSA9j76gwASNw/qkBAul4B020nVFwW?=
 =?us-ascii?Q?HriRwJe7REjoXJdXKbvvO0K2afq/d4XD6/jkOCqIz3bbThdaFj/TlvBzXbEl?=
 =?us-ascii?Q?CIjwHKkPscNW00qlNQVFKfbpvp1CBvDS6MqWqjlUCAHvNhw4kbKQK0jXNE4+?=
 =?us-ascii?Q?KrGTScUoT3IPziahd3Dw1SlLZsvVrEF3MyxdaWYu706ml1LuLyFsZZ5SJxw+?=
 =?us-ascii?Q?2BRqWOoSjixxpg/puNtWHHzvjJerBHfgwM4uKVY1Q1f4EWT14vT+1JHs/MkQ?=
 =?us-ascii?Q?ofIMhtaEk2tdT+NGw6amjqdM13Zg8iB2TRJVQp9Agb92Yc6PsmHoHtHIgkFL?=
 =?us-ascii?Q?GbG+i/c056/aVmRe5NKIf62fEHi9owXCNCNHn7hJPAjvE0mLodBvYmASlYYb?=
 =?us-ascii?Q?Zeonx6+rl+evzfxZGd1ZqQ2qPhl6ix5Lqu3FCMOm459MX/sO3rRE25Or4c2N?=
 =?us-ascii?Q?nLd/Tp1RM5e0/btQuzo9Nc/XG61PmqYvN9fbulEG2vWe22g1Edi3z/pkJyXy?=
 =?us-ascii?Q?3jf/6xh50J+Eni7CoNDBMZ971Lf5j+8o9RC8DMPL15jy0dYL+pFQ+wlKg2h/?=
 =?us-ascii?Q?m6uSx6wD6Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RULMWrTR6gNQaPu9DXUjF5CDSxksj7adNwmwDZBHI9AOYDXrq6gWqmp7SAE+qiShws9eE/oTuXtiTpsFYky9DT2tmTT+38CY9PQg5voFDQ9JeDEIDFXWSiYiwVfzC1YR66yThIcX7eCYE4Hfms/u34XDmcggYZYva5u1ePpCf6Tl3//9jSLoLUhrgP693neCZobFTUG6a7aMsfG7Gs/vgGiobDuAEjH/jLOhSujSIYNOHQHMo/S2jSXRNL/ocjmrl/FUISSGecLoRiUdLIM4pdE84XPPTLhcuSW89ZRIKESNRw10MKg5J5YdzgSWbOFgXUFhzGrMG6lP8267fGNnt5ft8SRpJrioedCecnaa4zeUCh5HT8MElZtJE8DEzk69BHPBi16cLuuMTyn4FjOeae6E6f25kDh+u28X4RUz54UGVXD7JMIj3WwqKACtJanznqpn1ViU8afF7Sip1YlmBMshF3H+0lRXyTYbbOHYpauPZlHcYWr2IoHJVSn++WLHOl3nwBD77ljhN9hRdGqEQK08//WGAzEh+mgXvLwd0ULzNEABPGIPYWEKMEyZSOFvXZ23A3oWj+tQYzvTgfcbEETJP8+yva4q+jbjXP/qawg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068e02aa-03ea-4fd1-d580-08de63408c10
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB7522.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:23:21.4923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhkRi2agGpC0rDfhG14xOPzyGBPhLcotJzhVVSlkAIsYtLp9PhA21RQg5SmPnMgvkNJc2ZRZ2rjajqhtXc4pvzhkwAMG8+R/ONYtXYYlkZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6617
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2601150000 definitions=main-2602030131
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEzMCBTYWx0ZWRfX1iy+ajlW5iQU
 rtEDY3z6T9xcZbEkkczQ6gXohp40XLHV/zxTgRwwrM5IFZRi17/gNjECDfzY5LntOjNkPNA7Sup
 KRGKPkgZ6f9QNL5XMyXVCBxz82sGyMgqq9FNXfsidtvw427BtuqcasEqZfrnPK/rPkXPPsRp2aS
 KinW/Y0TRjez2JRmur0+H1rcIp2WcXbFivZiHDW7+m6M0j0+dPyUaxDuuMMrmI2XvkiQQTVood4
 8x0t2wYFQoHlDS8gQS0T+wv0RshQ0Sj8Cc3f/A/Y1fpvQfDhS5/o8LxsCrox+73scWjG/RY5g6d
 ewWerYeIzvKa+isOvYwi/nVPQTQuzFcQA0NmhtyV/rguM5LB3WsQK35ouN3ywFbkTLlJqyaNayk
 2w7dkQioeXxZArhdP2Gidu3lG0YyRm8fAWvD/jslIjube+P/HuZQPT7ueQqEq0TsUq6VDghncUI
 JHELc2bzTsSS1Eb3RoY6fOnTQ1jAeqhRVW+H7uLg=
X-Proofpoint-GUID: pmUPTGgHgGUenKnJXsSJFKYll7ZPTXjF
X-Authority-Analysis: v=2.4 cv=Z7Dh3XRA c=1 sm=1 tr=0 ts=69822102 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=15yIpirbljyiBF1XFqEA:9 cc=ntf awl=host:12104
X-Proofpoint-ORIG-GUID: pmUPTGgHgGUenKnJXsSJFKYll7ZPTXjF

Kernel commit a544d9a66bdf
("tracing: Have syscall trace events read user space string") (added in
6.19-rc1) causes special fields to be added to the tracepoint format
file for data strings that are faulted in.  We need to account for this
when determining the number of arguments for syscall tracepoints.

We introduce support for a valid_arg() callback function that providers
can implement to support skipping initial non-common fields and also to
stop processing fields as arguments.  The syscall provider uses this to
skip the __syscall_nr field, and to stop argument processing when the
first dynamic string field is found.

Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
---
 libdtrace/dt_prov_dtrace.c  |  2 +-
 libdtrace/dt_prov_fbt.c     |  2 +-
 libdtrace/dt_prov_sdt.c     |  2 +-
 libdtrace/dt_prov_syscall.c | 42 +++++++++++++++++++++----
 libdtrace/dt_provider_tp.c  | 63 +++++++++++++++++++++++++------------
 libdtrace/dt_provider_tp.h  | 11 +++++--
 6 files changed, 90 insertions(+), 32 deletions(-)

diff --git a/libdtrace/dt_prov_dtrace.c b/libdtrace/dt_prov_dtrace.c
index 9ef001a3..a0bf34c3 100644
--- a/libdtrace/dt_prov_dtrace.c
+++ b/libdtrace/dt_prov_dtrace.c
@@ -255,7 +255,7 @@ static int attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 		if (f == NULL)
 			return -ENOENT;
 
-		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
+		rc = dt_tp_probe_info(dtp, f, NULL, prp, NULL, NULL);
 		fclose(f);
 
 		if (rc < 0)
diff --git a/libdtrace/dt_prov_fbt.c b/libdtrace/dt_prov_fbt.c
index ed1bd93d..59e4583b 100644
--- a/libdtrace/dt_prov_fbt.c
+++ b/libdtrace/dt_prov_fbt.c
@@ -526,7 +526,7 @@ static int kprobe_attach(dtrace_hdl_t *dtp, const dt_probe_t *prp, int bpf_fd)
 			goto out;
 
 		/* read event id from format file */
-		rc = dt_tp_probe_info(dtp, f, 0, prp, NULL, NULL);
+		rc = dt_tp_probe_info(dtp, f, NULL, prp, NULL, NULL);
 		fclose(f);
 
 		if (rc < 0)
diff --git a/libdtrace/dt_prov_sdt.c b/libdtrace/dt_prov_sdt.c
index f9de2cf8..b1343481 100644
--- a/libdtrace/dt_prov_sdt.c
+++ b/libdtrace/dt_prov_sdt.c
@@ -202,7 +202,7 @@ static int probe_info_tracefs(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (!f)
 		return -ENOENT;
 
-	rc = dt_tp_probe_info(dtp, f, 0, prp, argcp, argvp);
+	rc = dt_tp_probe_info(dtp, f, NULL, prp, argcp, argvp);
 	fclose(f);
 
 	return rc;
diff --git a/libdtrace/dt_prov_syscall.c b/libdtrace/dt_prov_syscall.c
index 4f1e206a..e80c7bcb 100644
--- a/libdtrace/dt_prov_syscall.c
+++ b/libdtrace/dt_prov_syscall.c
@@ -40,11 +40,6 @@ static const char		modname[] = "vmlinux";
 
 #define SYSCALLSFS		EVENTSFS "syscalls/"
 
-/*
- * We need to skip over an extra field: __syscall_nr.
- */
-#define SKIP_EXTRA_FIELDS	1
-
 static const dtrace_pattr_t	pattr = {
 { DTRACE_STABILITY_EVOLVING, DTRACE_STABILITY_EVOLVING, DTRACE_CLASS_COMMON },
 { DTRACE_STABILITY_PRIVATE, DTRACE_STABILITY_PRIVATE, DTRACE_CLASS_UNKNOWN },
@@ -186,6 +181,41 @@ static int trampoline(dt_pcb_t *pcb, uint_t exitlbl)
 	return 0;
 }
 
+static int valid_arg(int fldc, const char *desc)
+{
+	char	*p, *q;
+	int	rc = 1;
+	size_t	l;
+
+	/* Skip the first non-cmmon field (__syscall_nr). */
+	if (fldc < 1)
+		return 0;
+
+	/*
+	 * A non-common field with a __data_loc tag and __<name>_val name
+	 * indicates the beginning of the dynamic data area.  The previously
+	 * processed field was the last argument.
+	 */
+	p = strdup(desc);
+	if (sscanf(p, "__data_loc %[^;]", p) <= 0)
+		goto ok;
+
+	l = strlen(p);
+	if (l < 4 || strcmp(&(p[l - 4]), "_val") != 0)
+		goto ok;
+
+	q = strrchr(p, ' ');
+	if (q == NULL || strncmp(q, " __", 3) != 0)
+		goto ok;
+
+	/* Done with processing fields. */
+	rc = -1;
+
+ok:
+	free(p);
+	return rc;
+}
+
 static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 		      int *argcp, dt_argdesc_t **argvp)
 {
@@ -209,7 +239,7 @@ static int probe_info(dtrace_hdl_t *dtp, const dt_probe_t *prp,
 	if (!f)
 		return -ENOENT;
 
-	rc = dt_tp_probe_info(dtp, f, SKIP_EXTRA_FIELDS, prp, argcp, argvp);
+	rc = dt_tp_probe_info(dtp, f, valid_arg, prp, argcp, argvp);
 	fclose(f);
 
 	return rc;
diff --git a/libdtrace/dt_provider_tp.c b/libdtrace/dt_provider_tp.c
index 1faf5cd4..6e0d908a 100644
--- a/libdtrace/dt_provider_tp.c
+++ b/libdtrace/dt_provider_tp.c
@@ -123,17 +123,16 @@ dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp, const char *name,
  * array dimension specifiers (and those are part of the type).
  *
  * All events include a number of common fields that we are not interested
- * in and that need to be skipped.  Callers of this function can specify an
- * additional number of fields to skip (using the 'skip' parameter) before
- * we get to the actual arguments.
+ * in and that need to be skipped.  Callers of this function can specify a
+ * callback function (valid_arg) to validate a non-common field.
  */
 int
-dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
-		 int *argcp, dt_argdesc_t **argvp)
+dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, dt_valid_arg_f *valid_arg,
+		 tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp)
 {
 	char		*buf = NULL;
 	size_t		bufsz;
-	int		argc, common = 1;
+	int		idx = 0, argc = 0, skip = 0, common = 1;
 	dt_argdesc_t	*argv = NULL;
 
 	tpp->id = 0;
@@ -141,10 +140,8 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 	/*
 	 * Pass 1:
 	 * Determine the event id and the number of arguments.
-	 * Skip over how ever many arguments the caller asks us to skip.
-	 * We will skip initial "common fields" as well.
+	 * We will skip initial "common fields".
 	 */
-	argc = -skip;
 	while (getline(&buf, &bufsz, f) >= 0) {
 		char	*p = buf;
 
@@ -205,7 +202,31 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 			common = 0;
 		}
 
-		/* We found a non-common "field:" description. */
+		/*
+		 * We found a non-common "field:" description.
+		 *
+		 * If the caller provided a validation hook, call it with the
+		 * current non-common field counter and the description text.
+		 * The hook returns
+		 *  -1 if the field is not a valid argument, and no additional
+		 *       arguments can follow
+		 *   0 if the field should be skipped
+		 *   1 if the field is a valid argument
+		 */
+		idx++;
+		if (valid_arg != NULL) {
+			int	rc = valid_arg(idx - 1, p);
+
+			if (rc == -1)
+				break;
+			if (rc == 0) {
+				skip++;
+				continue;
+			}
+		}
+
+		sscanf(p, "__data_loc %[^;]", p);
+
 		argc++;
 	}
 	free(buf);
@@ -232,7 +253,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 	 * Fill in the actual argument datatype strings.
 	 */
 	rewind(f);
-	argc = -skip;
+	idx = -skip;
 	while (getline(&buf, &bufsz, f) >= 0) {
 		char	*p;
 		size_t	l;
@@ -249,7 +270,7 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 			continue;
 
 		/* We found a field: description - see if we should skip it. */
-		if (argc < 0)
+		if (idx < 0)
 			goto skip;
 
 		sscanf(p, "__data_loc %[^;]", p);
@@ -320,13 +341,15 @@ dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip, tp_probe_t *tpp,
 			}
 		}
 
-		argv[argc].mapping = argc;
-		argv[argc].flags = 0;
-		argv[argc].native = strdup(strp);
-		argv[argc].xlate = NULL;
+		argv[idx].mapping = idx;
+		argv[idx].flags = 0;
+		argv[idx].native = strdup(strp);
+		argv[idx].xlate = NULL;
 
 skip:
-		argc++;
+		idx++;
+		if (idx == argc)
+			break;
 	}
 
 done:
@@ -413,12 +436,12 @@ dt_tp_probe_insert(dtrace_hdl_t *dtp, dt_provider_t *prov, const char *prv,
  * the argument types for a given probe.
  */
 int
-dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip, const dt_probe_t *prp,
-		 int *argcp, dt_argdesc_t **argvp)
+dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, dt_valid_arg_f *valid_arg,
+		 const dt_probe_t *prp, int *argcp, dt_argdesc_t **argvp)
 {
 	tp_probe_t	*tpp = prp->prv_data;
 
-	return dt_tp_event_info(dtp, f, skip, tpp, argcp, argvp);
+	return dt_tp_event_info(dtp, f, valid_arg, tpp, argcp, argvp);
 }
 
 /*
diff --git a/libdtrace/dt_provider_tp.h b/libdtrace/dt_provider_tp.h
index 406609d1..bf73d96a 100644
--- a/libdtrace/dt_provider_tp.h
+++ b/libdtrace/dt_provider_tp.h
@@ -33,8 +33,12 @@ extern int dt_tp_attach(dtrace_hdl_t *dtp, tp_probe_t *tpp, int bpf_fd);
 extern int dt_tp_attach_raw(dtrace_hdl_t *dtp, tp_probe_t *tpp,
 			    const char *name, int bpf_fd);
 extern int dt_tp_has_info(const tp_probe_t *tpp);
-extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f, int skip,
-			    tp_probe_t *tpp, int *argcp, dt_argdesc_t **argvp);
+
+typedef int dt_valid_arg_f(int fldc, const char *desc);
+extern int dt_tp_event_info(dtrace_hdl_t *dtp, FILE *f,
+			    dt_valid_arg_f *valid_arg, tp_probe_t *tpp,
+			    int *argcp, dt_argdesc_t **argvp);
+
 extern void dt_tp_detach(dtrace_hdl_t *dtp, tp_probe_t *tpp);
 extern void dt_tp_destroy(dtrace_hdl_t *dtp, tp_probe_t *tpp);
 extern uint32_t dt_tp_get_id(const tp_probe_t *prp);
@@ -44,7 +48,8 @@ extern struct dt_probe *dt_tp_probe_insert(dtrace_hdl_t *dtp,
 					   dt_provider_t *prov,
 					   const char *prv, const char *mod,
 					   const char *fun, const char *prb);
-extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f, int skip,
+extern int dt_tp_probe_info(dtrace_hdl_t *dtp, FILE *f,
+			    dt_valid_arg_f *valid_arg,
 			    const struct dt_probe *prp, int *argcp,
 			    dt_argdesc_t **argvp);
 extern int dt_tp_probe_has_info(const struct dt_probe *prp);
-- 
2.51.0

